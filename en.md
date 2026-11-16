# NEU Thesis
|[中文](https://github.com/sci-m-wang/NEU-Thesis/blob/main/README.md)|[English](https://github.com/sci-m-wang/NEU-Thesis/blob/main/en.md)|

LaTex version of Northeastern University (Shenyang)'s thesis (common to master's and doctoral degrees), which can be imported directly into [Overleaf](https://www.overleaf.com/). Chinese and English theses now share one template and can be switched in `Thesis.tex`.

## Language switch

Set the `language` option in `Thesis.tex`:

```tex
\documentclass[printcopy,fontset=windows,language=chinese]{Style/neuthesis}
\documentclass[printcopy,fontset=windows,language=english]{Style/neuthesis}
```

This switch controls fixed labels, title pages, declarations, table/list names, and the default sample chapters.

## Page layout and running headers

With the default `geometry` setting enabled, the body text area is **160mm × 247mm**, as specified in the formatting guide. Page numbers use the normal body font size. Roman front-matter numbering and Arabic main-matter numbering are unchanged.

The default `headerstyle=legacy` preserves the university/degree prefix on the left, the chapter title on the right, and automatic degree-based prefix selection. To use centered chapter headers instead, select:

```tex
\documentclass[printcopy,fontset=windows,language=english,headerstyle=centered]{Style/neuthesis}
```

Centered front/back-matter headers display only the title, without a main-matter chapter number. `headerstyle` controls only running-header layout; it does not certify full compliance with a particular university template revision. Titles, the contents, declarations, and blank pages still need to be checked against the applicable requirements.

## Local build

With XeLaTeX, BibTeX, and the selected fonts installed, run `bash build.sh a` from the repository root. The script creates `Tmp/` automatically and writes `Tmp/Thesis.pdf`. Run `bash tests/build-smoke.sh` to test fresh/repeated builds and custom document names without requiring TeX or fonts.

If this template has been helpful to you, a **star** would be greatly appreciated.

The ease of layout in LaTex is far superior to that of text editing software such as Word, and the required formatting and layout can be achieved easily and without error when templates are available. However, LaTex is cumbersome in terms of template design and environment configuration. There are now several well-designed templates available and there is an online Overleaf platform that greatly simplifies getting started with LaTex and improves research efficiency. However, I have found that these two templates give some errors when imported into Overleaf and are not directly usable. I have made changes and added fonts to make this template directly usable by importing it into Overleaf, which I hope will provide convenience for everyone.

## Contribution
My capabilities are limited. It takes all of us working together to make the project better. If you find problems with this project as you use it. You can contribute in two ways:

### A. If you know how to solve these problems.
1. [Fork](https://github.com/sci-m-wang/NEU-Thesis/fork) this project.
2. Modify the corresponding codes to correct them.
3. [Pull requests](https://github.com/sci-m-wang/NEU-Thesis/pulls).

### B. If you don't know how to solve these problems.
- You can just add an [issue](https://github.com/sci-m-wang/NEU-Thesis/issues). Helping us to identify problems is also a very important contribution.

## Acknowledgment
This template is based on [mervin0502/neuthesis](https://github.com/mervin0502/neuthesis) and [NEUAI/neuthesis-enhanced](https://github.com/NEUAI/neuthesis-enhanced).
