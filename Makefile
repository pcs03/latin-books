# Default to the /content directory, but can be overridden

BOOK_DIR ?= ./books/Augustus/Res-Gestae-Divi-Augusti

CONTENT_DIR = $(BOOK_DIR)/content
OUTPUT_DIR = $(BOOK_DIR)/output

# Source Files
METADATA = $(CONTENT_DIR)/metadata.yaml
TEMPLATE = pandoc-templates/book.latex

# Explicit order of files to ensure correct book structure
CONTENT = \
	$(CONTENT_DIR)/copyright.md \
	$(CONTENT_DIR)/ack.md \
	$(CONTENT_DIR)/preface.md \
	$(CONTENT_DIR)/introduction.md \
	$(CONTENT_DIR)/body.md \
	$(CONTENT_DIR)/backmatter.md

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
		--resource-path=.:$(CONTENT_DIR) \
		-o $(OUTPUT_PDF) \
		$(CONTENT)
	@echo "Compilation successful!"

clean:
	rm -rf $(OUTPUT_DIR)
