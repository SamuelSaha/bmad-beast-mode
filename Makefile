# Beast Mode Automation
# Add this file to your project root!

.PHONY: help update start plan code fix

help:
	@echo "🔥 Beast Mode Available Commands:"
	@echo "  make start   -> Initialize BMAD in this repo"
	@echo "  make update  -> Update Beast Mode module"
	@echo "  make plan    -> Run Analyst (Planning)"
	@echo "  make code    -> Run Developer (Coding)"
	@echo "  make fix     -> Micro-fix workflow"

start:
	npx bmad-method@alpha install

update:
	# Pulls the latest version of your custom module
	# Adjust path if different
	cd .bmad/modules/beast-mode && git pull origin main
	@echo "✅ Agents updated."

plan:
	@echo "🧠 Loading Analyst..."
	# Assumes 'opencode' or your IDE CLI is available
	# Or just prints instruction
	@echo "Run: *analyze-problem"

code:
	@echo "👨‍💻 Loading Dev..."
	@echo "Run: *implement-fix"

fix:
	@echo "🩹 Loading Micro-Fix..."
	@echo "Run: *workflow-init workflow: micro-fix"
