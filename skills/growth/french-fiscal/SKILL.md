---
name: French Fiscal Engine
description: Complete French tax law implementation for wealth management applications
version: 1.0.0
primary_agents: [beast-finance, beast-dev, beast-architect]
language: fr
---

# 💶 French Fiscal Engine Skill

> **ACTIVATION:** This skill provides precise French tax calculations. Math > Emotion. Law > Opinion.

---

## 🎯 Compétences Principales

1. **Impôt sur le Revenu (IR)** — Barème progressif, quotient familial
2. **Prélèvements Sociaux** — CSG, CRDS sur revenus du capital
3. **Plus-Values Mobilières** — Flat Tax vs Barème progressif
4. **IFI** — Impôt sur la Fortune Immobilière
5. **Assurance-Vie** — Fiscalité des rachats
6. **Succession** — Droits de succession, abattements

---

## 📊 BARÈME IR 2024 (Revenus 2023)

### Tranches d'imposition
```typescript
const BAREME_IR_2024 = [
  { min: 0,      max: 11294,  rate: 0.00 },
  { min: 11294,  max: 28797,  rate: 0.11 },
  { min: 28797,  max: 82341,  rate: 0.30 },
  { min: 82341,  max: 177106, rate: 0.41 },
  { min: 177106, max: Infinity, rate: 0.45 },
] as const

function calculateIR(revenuImposable: number, parts: number): number {
  const quotient = revenuImposable / parts
  let impot = 0
  
  for (const tranche of BAREME_IR_2024) {
    if (quotient <= tranche.min) break
    
    const taxableInTranche = Math.min(quotient, tranche.max) - tranche.min
    impot += taxableInTranche * tranche.rate
  }
  
  return Math.round(impot * parts)
}
```

### Quotient Familial
```typescript
const PARTS = {
  celibataire: 1,
  marie_pacs: 2,
  veuf_enfant: 1.5, // Premier enfant à charge
}

function calculerParts(
  situationFamiliale: 'celibataire' | 'marie_pacs' | 'veuf',
  enfantsACharge: number,
  parentIsole: boolean = false
): number {
  let parts = situationFamiliale === 'marie_pacs' ? 2 : 1
  
  // Enfants à charge
  if (enfantsACharge >= 1) parts += 0.5
  if (enfantsACharge >= 2) parts += 0.5
  if (enfantsACharge >= 3) parts += (enfantsACharge - 2) * 1 // 1 part par enfant après le 2ème
  
  // Parent isolé
  if (parentIsole && enfantsACharge > 0) parts += 0.5
  
  return parts
}
```

---

## 💰 FLAT TAX (PFU)

### Prélèvement Forfaitaire Unique (30%)
```typescript
const PFU = {
  ir: 0.128,        // 12.8% IR
  csg: 0.097,       // 9.7% CSG
  crds: 0.005,      // 0.5% CRDS
  prelevement_solidarite: 0.075, // 7.5% Prélèvement de solidarité
  total: 0.30,      // 30% total
}

function calculerPFU(plusValue: number): {
  ir: number
  prelevementsSociaux: number
  total: number
} {
  return {
    ir: Math.round(plusValue * PFU.ir),
    prelevementsSociaux: Math.round(plusValue * (PFU.csg + PFU.crds + PFU.prelevement_solidarite)),
    total: Math.round(plusValue * PFU.total),
  }
}
```

### Option Barème Progressif
```typescript
function optionBaremeVsPFU(
  plusValue: number,
  revenuImposable: number,
  parts: number
): 'pfu' | 'bareme' {
  // PFU
  const impotPFU = calculerPFU(plusValue)
  
  // Barème avec abattement de 40% pour dividendes
  const pvApresAbattement = plusValue * 0.60
  const revenuTotalAvecPV = revenuImposable + pvApresAbattement
  const impotBareme = calculateIR(revenuTotalAvecPV, parts) - calculateIR(revenuImposable, parts)
  const psBareme = plusValue * 0.172 // Prélèvements sociaux à 17.2%
  
  const totalBareme = impotBareme + psBareme
  
  return totalBareme < impotPFU.total ? 'bareme' : 'pfu'
}
```

---

## 🏠 IFI (Impôt Fortune Immobilière)

### Seuil et Barème 2024
```typescript
const SEUIL_IFI = 1300000

const BAREME_IFI = [
  { min: 0,         max: 800000,   rate: 0 },
  { min: 800000,    max: 1300000,  rate: 0.005 },
  { min: 1300000,   max: 2570000,  rate: 0.007 },
  { min: 2570000,   max: 5000000,  rate: 0.01 },
  { min: 5000000,   max: 10000000, rate: 0.0125 },
  { min: 10000000,  max: Infinity, rate: 0.015 },
]

function calculerIFI(patrimoineNetImposable: number): number {
  if (patrimoineNetImposable < SEUIL_IFI) return 0
  
  let impot = 0
  
  for (const tranche of BAREME_IFI) {
    if (patrimoineNetImposable <= tranche.min) break
    
    const taxableInTranche = Math.min(patrimoineNetImposable, tranche.max) - tranche.min
    impot += taxableInTranche * tranche.rate
  }
  
  // Décote si patrimoine entre 1.3M et 1.4M
  if (patrimoineNetImposable <= 1400000) {
    const decote = 17500 - (0.0125 * patrimoineNetImposable)
    impot = Math.max(0, impot - decote)
  }
  
  return Math.round(impot)
}
```

---

## 📜 ASSURANCE-VIE

### Fiscalité des Rachats
```typescript
interface ContratAssuranceVie {
  dateOuverture: Date
  versementsTotaux: number
  valeurActuelle: number
}

function calculerFiscaliteRachat(
  contrat: ContratAssuranceVie,
  montantRachat: number,
  dateRachat: Date = new Date()
): { 
  plusValue: number
  fiscalite: 'exonere' | 'pfu' | 'bareme_reduit'
  abattement: number
  tauxApplicable: number
} {
  const anciennete = (dateRachat.getTime() - contrat.dateOuverture.getTime()) / (1000 * 60 * 60 * 24 * 365)
  
  // Calcul de la plus-value proportionnelle
  const tauxPV = (contrat.valeurActuelle - contrat.versementsTotaux) / contrat.valeurActuelle
  const plusValue = Math.round(montantRachat * tauxPV)
  
  // Après 8 ans: abattement + taux réduit
  if (anciennete >= 8) {
    const abattement = 4600 // 9200 pour un couple
    return {
      plusValue,
      fiscalite: 'bareme_reduit',
      abattement,
      tauxApplicable: 0.075 + 0.172, // 7.5% IR + 17.2% PS = 24.7%
    }
  }
  
  // Avant 8 ans: PFU à 30%
  return {
    plusValue,
    fiscalite: 'pfu',
    abattement: 0,
    tauxApplicable: 0.30,
  }
}
```

---

## 🔒 SUCCESSION

### Abattements 2024
```typescript
const ABATTEMENTS_SUCCESSION = {
  ligne_directe: 100000,        // Parents/enfants
  freres_soeurs: 15932,
  neveux_nieces: 7967,
  autres: 1594,
  handicape: 159325,            // Cumulable
  assurance_vie_avant_70: 152500, // Par bénéficiaire
}

const BAREME_SUCCESSION_LIGNE_DIRECTE = [
  { min: 0,        max: 8072,    rate: 0.05 },
  { min: 8072,     max: 12109,   rate: 0.10 },
  { min: 12109,    max: 15932,   rate: 0.15 },
  { min: 15932,    max: 552324,  rate: 0.20 },
  { min: 552324,   max: 902838,  rate: 0.30 },
  { min: 902838,   max: 1805677, rate: 0.40 },
  { min: 1805677,  max: Infinity, rate: 0.45 },
]

function calculerDroitsSuccession(
  montantNet: number,
  lienParente: 'enfant' | 'frere_soeur' | 'autre'
): number {
  const abattement = lienParente === 'enfant' 
    ? ABATTEMENTS_SUCCESSION.ligne_directe
    : lienParente === 'frere_soeur'
    ? ABATTEMENTS_SUCCESSION.freres_soeurs
    : ABATTEMENTS_SUCCESSION.autres
  
  const baseImposable = Math.max(0, montantNet - abattement)
  
  if (lienParente !== 'enfant') {
    // Taxation forfaitaire pour non-ligne-directe
    return Math.round(baseImposable * (lienParente === 'frere_soeur' ? 0.35 : 0.60))
  }
  
  // Barème progressif ligne directe
  let droits = 0
  for (const tranche of BAREME_SUCCESSION_LIGNE_DIRECTE) {
    if (baseImposable <= tranche.min) break
    const taxable = Math.min(baseImposable, tranche.max) - tranche.min
    droits += taxable * tranche.rate
  }
  
  return Math.round(droits)
}
```

---

## ⚠️ RÈGLES NON-NÉGOCIABLES

1. **Toujours arrondir** les impôts à l'euro inférieur
2. **Dates critiques:**
   - Clôture fiscale: 31 décembre
   - Déclaration IR: Mai (en ligne)
   - IFI: même calendrier que l'IR
3. **Ne JAMAIS donner de conseil fiscal** — orienter vers un expert-comptable
4. **Les barèmes changent chaque année** — toujours vérifier

---

## ✅ CHECKLIST IMPLÉMENTATION

- [ ] Barème IR à jour (Loi de Finances en vigueur)
- [ ] Prélèvements sociaux à 17.2%
- [ ] Quotient familial plafonné
- [ ] Décote IFI implémentée
- [ ] Abattements succession corrects
- [ ] Tests unitaires pour chaque calcul
- [ ] Arrondis à l'euro inférieur
