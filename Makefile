.PHONY: help start fix plan status

help:
	@echo "🔥 Beast Mode Commands:"
	@echo "  make start   -> Load the Orchestrator"
	@echo "  make fix     -> Start a Micro-Fix (Bug)"
	@echo "  make plan    -> Start a Feature Plan (PRD)"
	@echo "  make status  -> Check workflow status"

start:
	# Simulating /bmad:start
	@echo "Run: *start"

fix:
	@echo "⛽ Loading Context Fuel..."
	@cat templates/00-context-fuel.tmpl.md
	@echo "--------------------------------"
	@echo "Run: *workflow-init workflow: micro-fix"

plan:
	@echo "Run: *workflow-init workflow: standard-feature"

status:
	@echo "Run: *status"
