## Document Conversion

### Epub to Markdown

Use calibre's `ebook-convert`:

```
ebook-convert source.epub output.txtz --txt-output-formatting markdown --keep-image-references
```

## Vim Macros

### Removing Escape from Brackets

```
:%s/\\\([()\[\]{}]\)/\1/g
```

### 
