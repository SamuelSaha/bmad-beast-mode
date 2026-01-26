---
name: Frontend Engineering Mastery
description: Production-grade UI engineering at Vercel/Linear/Stripe quality bar - semantic HTML, a11y, SVG systems, React patterns, performance
version: 1.0.0
primary_agents: [beast-dev, beast-ux, beast-architect]
---

# ⚛️ Frontend Engineering Mastery Skill

> **ACTIVATION:** The bar is production-grade UI engineering, not browser-driven code generation.

---

## 🎯 Core Philosophy

```
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║   YOU DO NOT RELY ON A BROWSER TO THINK.                        ║
║                                                                  ║
║   You simulate DOM and layout mentally.                         ║
║   You predict CSS conflicts by inspection.                      ║
║   You detect a11y failures without tooling.                     ║
║   You find bugs before opening DevTools.                        ║
║                                                                  ║
║   Browser automation is for CONFIRMATION, not DISCOVERY.        ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## 📐 1. Semantic & Structural Mastery

### Principles

| Principle | Rule |
|-----------|------|
| **Semantic HTML by default** | Use correct elements, not divs with roles |
| **Minimal DOM depth** | Every node must justify its existence |
| **Zero redundant wrappers** | If a wrapper has no style or semantic role, remove it |
| **ARIA as last resort** | Correct element > ARIA role |

### Element Selection Guide

| Need | Wrong | Correct |
|------|-------|---------|
| Clickable action | `<div onClick>` | `<button>` |
| Navigation | `<div><a>` | `<nav><a>` |
| List of items | `<div><div>` | `<ul><li>` |
| Form field label | `<span>Name</span>` | `<label htmlFor="name">` |
| Section heading | `<div className="title">` | `<h2>` |
| Emphasized text | `<span className="bold">` | `<strong>` |

### DOM Reduction Protocol

Before shipping any component, ask:

```
1. Can this wrapper be removed? (No style, no semantic role = remove)
2. Can children absorb parent's styles? (Flatten the tree)
3. Is this div actually a section, article, or aside? (Semantic upgrade)
4. Does this span exist only for styling? (Use CSS selectors instead)
```

**Skill Signal:** Can reduce a component's DOM by 20–40% without changing behavior.

### Invalid Layout Combinations

Detect and reject immediately:

```tsx
// ❌ Invalid: inline elements can't have flex children
<span style={{ display: 'flex' }}>
  <div>Child</div>  // Invalid: block in inline
</span>

// ❌ Invalid: mixing incompatible display contexts
<a style={{ display: 'flex' }}>
  <span style={{ float: 'left' }}>  // Float inside flex is ignored
</a>

// ✅ Correct
<div style={{ display: 'flex' }}>
  <span>Child</span>
</div>
```

---

## ♿ 2. Accessibility Engineering (WCAG 2.2 AA+)

### Element Classification

**Every element is one of three types:**

| Type | Definition | Treatment |
|------|------------|-----------|
| **Decorative** | Visual only, no information | `aria-hidden="true"` or CSS background |
| **Informative** | Conveys meaning | Needs text alternative |
| **Interactive** | User can operate | Needs label + keyboard support |

### ARIA Decision Tree

```
Can semantic HTML express this?
│
├── YES → Use semantic HTML (button, nav, main)
│         DO NOT add redundant ARIA
│
└── NO → Apply ARIA attributes
         Document WHY semantic HTML was insufficient
```

### When ARIA is REQUIRED

| Pattern | Semantic Limit | ARIA Solution |
|---------|----------------|---------------|
| Custom dropdown | No native `<select>` behavior | `role="listbox"`, `aria-expanded` |
| Tab interface | No native tab element | `role="tablist"`, `role="tab"` |
| Live region | No semantic live content | `aria-live="polite"` |
| Modal dialog | Focus trap needed | `role="dialog"`, `aria-modal` |

### When ARIA is FORBIDDEN

| Pattern | Why ARIA is Wrong |
|---------|-------------------|
| `<button role="button">` | Redundant, already has role |
| `<a href="#" role="link">` | Redundant, `<a>` is a link |
| `<div role="button">` | Use `<button>` instead |
| `aria-label` on `<div>` | Divs aren't labelable |

### Keyboard Navigation Checklist

```
□ All interactive elements focusable (tabindex="0" if custom)
□ Focus order matches visual order
□ Focus is visible (no outline:none without replacement)
□ Enter/Space activates buttons and links
□ Escape closes modals/dropdowns
□ Arrow keys navigate within composite widgets
□ No keyboard traps (focus can always escape)
```

### Screen Reader Clarity

| Element | Requirement |
|---------|-------------|
| **Icons (decorative)** | `aria-hidden="true"` |
| **Icons (meaningful)** | `aria-label="Close"` on parent button |
| **SVGs** | `role="img"` or `aria-hidden` |
| **Images** | `alt=""` (decorative) or descriptive alt |
| **Buttons with icon only** | `aria-label` mandatory |

**Skill Signal:** Can explain why an ARIA attribute is required or forbidden.

---

## 🎨 3. SVG & Icon Systems

### SVGs Are First-Class UI Primitives

**NOT assets. NOT images. UI primitives.**

### Normalization Rules

```tsx
// Raw SVG (BAD)
<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" 
     xmlns:xlink="http://www.w3.org/1999/xlink" fill="none">
  <g id="Layer_1">
    <path id="Path_1" d="M12 2L2 19h20L12 2z" fill="#000000"/>
  </g>
</svg>

// Normalized SVG (GOOD)
<svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
  <path d="M12 2L2 19h20L12 2z" fill="currentColor"/>
</svg>
```

### Attributes to REMOVE

| Attribute | Reason |
|-----------|--------|
| `xmlns`, `xmlns:xlink` | Not needed in JSX |
| `width`, `height` (fixed) | Use CSS or props |
| `id` on internal elements | Causes duplicate ID issues |
| Unnecessary `<g>` wrappers | Flatten unless grouping is semantic |
| `fill="#000000"` | Use `currentColor` for theming |
| `stroke="#000000"` | Use `currentColor` for theming |

### Icon Component Pattern

```tsx
// ✅ Production-grade icon component
interface IconProps {
  size?: number | string;
  className?: string;
  'aria-label'?: string;
}

export function ChevronIcon({ 
  size = 24, 
  className,
  'aria-label': ariaLabel 
}: IconProps) {
  return (
    <svg
      viewBox="0 0 24 24"
      width={size}
      height={size}
      fill="none"
      stroke="currentColor"
      strokeWidth={2}
      strokeLinecap="round"
      strokeLinejoin="round"
      className={className}
      aria-hidden={!ariaLabel}
      aria-label={ariaLabel}
      role={ariaLabel ? 'img' : undefined}
    >
      <path d="M9 18l6-6-6-6" />
    </svg>
  );
}
```

### Icon Props to Expose

| Prop | Purpose |
|------|---------|
| `size` | Single dimension (icons are square) |
| `className` | Style override |
| `aria-label` | Accessibility (makes visible to SR) |

### Props to NOT Expose

| Prop | Reason |
|------|--------|
| `color` | Use `currentColor` + CSS |
| `fill`, `stroke` separately | Internal implementation |
| `width`, `height` separately | Use single `size` |

### Icon Button Pattern

```tsx
// ✅ Correct: aria-label on button, icon hidden
<button aria-label="Close dialog">
  <CloseIcon aria-hidden="true" />
</button>

// ❌ Wrong: No label
<button>
  <CloseIcon />
</button>

// ❌ Wrong: Wrapper div
<button aria-label="Close">
  <div className="icon-wrapper">
    <CloseIcon aria-hidden="true" />
  </div>
</button>
```

**Skill Signal:** Can refactor an SVG icon component to fewer nodes with better a11y.

---

## ⚛️ 4. React Component Engineering

### Pure, Deterministic Components

```tsx
// ✅ Pure: Output depends only on props
function Button({ label, onClick }: Props) {
  return <button onClick={onClick}>{label}</button>;
}

// ❌ Impure: Reads external state
function Button({ label }: Props) {
  const theme = window.__theme__; // NO
  return <button style={{ color: theme.primary }}>{label}</button>;
}
```

### Composition Over Props

```tsx
// ❌ Prop explosion
<Card
  title="Hello"
  subtitle="World"
  icon={<Icon />}
  footer={<Footer />}
  headerAction={<Button />}
  variant="elevated"
  size="large"
  padding="medium"
/>

// ✅ Composition
<Card variant="elevated">
  <Card.Header>
    <Icon />
    <Card.Title>Hello</Card.Title>
    <Button />
  </Card.Header>
  <Card.Body>World</Card.Body>
  <Card.Footer>
    <Footer />
  </Card.Footer>
</Card>
```

### Re-render Prevention

| Cause | Solution |
|-------|----------|
| New object/array in render | `useMemo` or lift to module scope |
| New function in render | `useCallback` or lift to module scope |
| Context value changes | Split contexts by update frequency |
| Parent re-render | `React.memo` if props are stable |

```tsx
// ❌ Creates new object every render
<Component style={{ color: 'red' }} />

// ✅ Stable reference
const style = { color: 'red' }; // Module scope
<Component style={style} />

// ❌ Creates new function every render
<Button onClick={() => setCount(c => c + 1)} />

// ✅ Stable callback
const handleClick = useCallback(() => setCount(c => c + 1), []);
<Button onClick={handleClick} />
```

### SSR & Hydration Safety

```tsx
// ❌ Hydration mismatch: different on server vs client
function Component() {
  return <div>{typeof window !== 'undefined' ? 'Client' : 'Server'}</div>;
}

// ✅ Safe: Use useEffect for client-only code
function Component() {
  const [mounted, setMounted] = useState(false);
  useEffect(() => setMounted(true), []);
  if (!mounted) return null;
  return <div>Client</div>;
}
```

### Minimal, Stable APIs

| Good | Bad |
|------|-----|
| `size: 'sm' \| 'md' \| 'lg'` | `size: number` (too many values) |
| `variant: 'primary' \| 'secondary'` | `color: string` (unlimited values) |
| Required props explicit | Everything optional with defaults |

**Skill Signal:** Can explain why a component re-renders and how to prevent it.

---

## 🎛️ 5. Styling Systems & Layout Discipline

### Flexbox Mastery

```css
/* ✅ Correct patterns */
.row {
  display: flex;
  gap: 8px;
}

.column {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.center {
  display: flex;
  align-items: center;
  justify-content: center;
}

.space-between {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
```

### Grid Mastery

```css
/* ✅ Correct patterns */
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 16px;
}

.two-column {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.sidebar-layout {
  display: grid;
  grid-template-columns: 250px 1fr;
  gap: 24px;
}
```

### Layout Bugs by Inspection

| Symptom | Cause | Fix |
|---------|-------|-----|
| Item doesn't stretch | Missing `align-items: stretch` or child has fixed height | Check flex container settings |
| Gap doesn't work | Browser support or wrong display type | Verify flex/grid display |
| Items overflow | Missing `min-width: 0` on flex children | Add `min-width: 0` |
| Grid item spans wrong | Wrong `grid-column` value | Check column count |

### Inline Styles: When Allowed

| Allowed | Forbidden |
|---------|-----------|
| Truly dynamic values (`style={{ '--progress': value }}`) | Static layout (`style={{ display: 'flex' }}`) |
| Animation keyframes (`style={{ transform }}`) | Spacing (`style={{ marginTop: 8 }}`) |
| Server-rendered theme values | Colors (`style={{ color: 'red' }}`) |

### Style System Preference Order

1. **CSS Modules** — Scoped, static, no runtime cost
2. **Utility classes** — Consistent spacing/colors
3. **CSS Variables** — Theme values
4. **Inline styles** — Only for dynamic values

**Skill Signal:** Can identify layout bugs by inspection alone.

---

## ⚡ 6. Performance-Aware UI Design

### Predict Re-render Costs

| Pattern | Cost | Solution |
|---------|------|----------|
| List of 1000 items | HIGH | Virtualization (react-window) |
| Complex form | MEDIUM | Isolated controlled inputs |
| Modal with backdrop | LOW | Portal + lazy render |

### Layout Shift Prevention

```tsx
// ❌ Causes layout shift: icon loads later
<button>
  {isLoading ? <Spinner /> : <Icon />}
  Save
</button>

// ✅ Reserve space: same dimensions
<button style={{ width: 100 }}>
  {isLoading ? <Spinner size={16} /> : <Icon size={16} />}
  Save
</button>
```

### Bundle Size Awareness

| Pattern | Impact | Alternative |
|---------|--------|-------------|
| Import entire lodash | +70kb | `lodash-es` or native |
| Import entire date-fns | +40kb | Import specific functions |
| Icon library (all icons) | +100kb | Individual icon imports |
| moment.js | +300kb | date-fns or native Intl |

### Mount Cost Minimization

```tsx
// ❌ Expensive: renders all tabs
<Tabs>
  <Tab><ExpensiveComponent /></Tab>
  <Tab><AnotherExpensive /></Tab>
</Tabs>

// ✅ Cheap: renders only active tab
<Tabs>
  {activeTab === 0 && <ExpensiveComponent />}
  {activeTab === 1 && <AnotherExpensive />}
</Tabs>
```

### Unnecessary Abstraction Detection

| Pattern | Problem | Fix |
|---------|---------|-----|
| `<Box p={4}>` | Runtime style calculation | Use CSS class |
| `<Flex direction="column">` | Runtime prop processing | Use CSS `.flex-column` |
| `<Icon name="arrow" />` | Dynamic import, bundle entire set | Static import specific icon |

**Skill Signal:** Can justify every DOM node and prop in a component.

---

## 🧠 7. Browser-Independent Reasoning

### Mental Simulation

**Before writing code, visualize:**

1. What is the DOM tree structure?
2. What styles apply to each element?
3. What is the visual layout?
4. What is the keyboard focus order?
5. What does a screen reader announce?

### CSS Conflict Prediction

```css
/* What wins? Predict before testing. */
.button { color: blue; }       /* Specificity: 0,1,0 */
button.primary { color: red; } /* Specificity: 0,1,1 - WINS */
#submit { color: green; }      /* Specificity: 1,0,0 - HIGHEST */
```

### Hydration Mismatch Detection

**Inspect code to find:**

```tsx
// ❌ Mismatch: Date differs on server/client
<span>{new Date().toLocaleString()}</span>

// ❌ Mismatch: window check
{typeof window !== 'undefined' && <ClientComponent />}

// ❌ Mismatch: Math.random
<div key={Math.random()}>Content</div>
```

### A11y Failure Identification (No Tooling)

**Look for:**

- `<div onClick>` without `role="button"` and `tabIndex`
- Images without `alt`
- Forms without `<label>`
- Color contrast issues (light gray on white)
- Focus indicators removed (`outline: none`)
- Auto-playing media without controls

**Skill Signal:** Finds bugs before opening DevTools.

---

## 🔧 8. Refactoring & Code Judgment

### Reject Ambiguous Requirements

**If requirements are unclear:**

```
STOP.
Ask for constraints.
DO NOT GUESS.
```

Questions to ask:

- "What is the expected keyboard behavior?"
- "What should screen readers announce?"
- "What happens on mobile?"
- "What is the loading/error state?"

### Automatic Refactoring

**When you see this, fix it immediately:**

| Pattern | Refactor To |
|---------|-------------|
| `<div onClick>` | `<button>` |
| `<div className="list"><div className="item">` | `<ul><li>` |
| `style={{ marginTop: 16 }}` | CSS class |
| Wrapper div with no purpose | Remove wrapper |
| `useEffect` for derived state | `useMemo` |

### Simpler Solution Preference

```tsx
// ❌ Over-engineered
const [state, dispatch] = useReducer(reducer, initialState);
const handleClick = useCallback(() => {
  dispatch({ type: 'INCREMENT' });
}, [dispatch]);

// ✅ Simple (if no complex state)
const [count, setCount] = useState(0);
const handleClick = () => setCount(c => c + 1);
```

### Say "This is Incorrect"

**Technical justifications:**

- "This `div` should be a `button` because it's an interactive element."
- "This ARIA attribute is redundant because `button` already has the role."
- "This inline style should be a CSS class because it's static."
- "This wrapper adds DOM depth without semantic or layout value."

**Skill Signal:** Improves code quality even when not explicitly asked to.

---

## 🚫 9. Anti-Patterns (Instinctive Detection)

### Recognize Instantly

| Anti-Pattern | Why It's Wrong | Fix |
|--------------|----------------|-----|
| `<div>` with no semantic or layout role | Bloats DOM, confuses SR | Remove or use semantic element |
| Inline styles for non-dynamic layout | Harder to maintain, no caching | CSS class or CSS Module |
| SVGs without explicit a11y intent | SR confusion | `aria-hidden` or `role="img"` |
| Blind adherence to design output | Designs aren't code specs | Interpret semantically |
| Browser-first debugging | Slow, reactive | Reason about code first |
| Over-engineered abstractions | Runtime cost, complexity | Keep it simple |

### Code Smells

```tsx
// 🚨 Wrapper with no purpose
<div>
  <button>Click</button>
</div>

// 🚨 Span styling a block
<span style={{ display: 'block', marginTop: 16 }}>
  Content
</span>

// 🚨 ARIA on semantic element
<button role="button" aria-pressed="false">
  Toggle
</button>

// 🚨 onClick without keyboard
<div onClick={handleClick}>
  Click me
</div>
```

---

## 🏆 10. Quality Bar

### Your Output Must Match

- **Vercel** — Clean, minimal, performant
- **Linear** — Precise, accessible, refined
- **Stripe** — Robust, documented, production-ready

### NOT Acceptable

- Demos or prototypes
- "Works on my machine"
- Browser-tested but not reasoned

### The Standard

```
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║   Every DOM node justifies its existence.                       ║
║   Every ARIA attribute has a documented reason.                 ║
║   Every style follows a system.                                 ║
║   Every component is pure and deterministic.                    ║
║   Every keyboard interaction is planned.                        ║
║   Every re-render is intentional.                               ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## ✅ Frontend Engineering Checklist

### Before Every Component

```markdown
□ Semantic HTML used (no div soup)
□ DOM depth minimized
□ Accessibility classified (decorative/informative/interactive)
□ Keyboard navigation works
□ Screen reader announces correctly
□ No redundant ARIA
□ SVGs normalized and accessible
□ No inline styles for static values
□ No unnecessary re-renders
□ Bundle impact considered
□ SSR/hydration safe
```

### Before Shipping

```markdown
□ Can justify every DOM node
□ Can explain every ARIA attribute
□ Can predict re-render behavior
□ Can identify layout bugs by inspection
□ Browser automation confirms human reasoning
```

---

## 🔒 SKILL VERSION

```
Skill: Frontend Engineering Mastery
Version: 1.0.0
Last Updated: 2026-01-22
Quality Bar: Vercel/Linear/Stripe
Compatible Agents: beast-dev, beast-ux, beast-architect
```
