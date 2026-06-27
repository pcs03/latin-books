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

### Convert to Inline Footnotes

/\v^\d+.^M"nyt.<80><fd>5WW"aDdd?\v\[^Rn\]^Mcf]<80><fd>5^[^Ra]^[

