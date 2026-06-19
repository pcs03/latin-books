# Default to the /content directory, but can be overridden
BOOK_DIR ?= content
OUTPUT_DIR ?= output

# Source Files
METADATA = $(BOOK_DIR)/metadata.yaml
TEMPLATE = pandoc-templates/book.latex

# Explicit order of files to ensure correct book structure
CONTENT = \
	$(BOOK_DIR)/copyright.md \
	$(BOOK_DIR)/preface.md \
	$(BOOK_DIR)/ack.md \
	$(BOOK_DIR)/body.md \
	$(BOOK_DIR)/backmatter.md

# Output File
OUTPUT_PDF = $(OUTPUT_DIR)/book.pdf

.PHONY: all clean

all: $(OUTPUT_PDF)

$(OUTPUT_PDF): $(CONTENT) $(METADATA) $(TEMPLATE)
	@mkdir -p $(OUTPUT_DIR)
	@echo "Compiling $(OUTPUT_PDF) via XeLaTeX..."
	pandoc \
		--pdf-engine=xelatex \
		--template=$(TEMPLATE) \
		--metadata-file=$(METADATA) \
		--top-level-division=chapter \
		--resource-path=.:$(BOOK_DIR) \
		-o $(OUTPUT_PDF) \
		$(CONTENT)
	@echo "Compilation successful!"

clean:
	rm -rf $(OUTPUT_DIR)
