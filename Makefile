SCRIPT_NAME = kwekash
BIN_SRC = bin/$(SCRIPT_NAME)
MAN_SRC = man/$(SCRIPT_NAME).1
INSTALL_BIN_DIR = $(if $(wildcard $(HOME)/bin),$(HOME)/bin,$(HOME)/.local/bin)
INSTALL_MAN_DIR = $(HOME)/.local/share/man/man1
BIN_TARGET = $(INSTALL_BIN_DIR)/$(SCRIPT_NAME)
MAN_TARGET = $(INSTALL_MAN_DIR)/$(SCRIPT_NAME).1.gz

install:
	@echo "📦 Installing $(SCRIPT_NAME)..."
	@mkdir -p $(INSTALL_BIN_DIR)
	cp $(BIN_SRC) $(BIN_TARGET)
	chmod +x $(BIN_TARGET)
	@echo "✅ Installed binary to $(BIN_TARGET)"
	@mkdir -p $(INSTALL_MAN_DIR)
	cp $(MAN_SRC) $(INSTALL_MAN_DIR)/$(SCRIPT_NAME).1
	gzip -f $(INSTALL_MAN_DIR)/$(SCRIPT_NAME).1
	@echo "✅ Installed man page to $(MAN_TARGET)"
	@echo ""
	@echo "📘 To enable man page on macOS:"
	@echo "   echo 'export MANPATH=\$$HOME/.local/share/man:\$$MANPATH' >> ~/.zshrc && source ~/.zshrc"

uninstall:
	rm -f $(HOME)/bin/$(SCRIPT_NAME)
	rm -f $(HOME)/.local/bin/$(SCRIPT_NAME)
	rm -f $(INSTALL_MAN_DIR)/$(SCRIPT_NAME).1.gz
	@echo "✅ Uninstalled $(SCRIPT_NAME)"
