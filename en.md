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

The layout follows the university requirements: the graduate format of June 2026 for master's and doctoral theses, and the undergraduate thesis format for bachelor's theses.

- The text area is **160mm × 247mm** (excluding the header and page-number lines), i.e. 25mm margins.
- Page numbers use the body font size, are centered at the bottom and decorated with one-dash lines, e.g. `－3－`. Front matter uses Roman numerals and the main text starts at Arabic 1.
- The running header starts at the abstract, in 5-point KaiTi with a single rule. The declaration pages have no header.
- The Chinese and English title pages use 30mm side margins as in the university sample.

The header layout is selected by the `headerstyle` class option, which defaults to `auto` and follows the degree:

| Degree | Header |
| --- | --- |
| Doctor, Master | chapter number and title, centered (2026 graduate format) |
| Bachelor | university prefix on the left, chapter number and title on the right |

A single layout can also be forced for every degree. `legacy` is the left/right layout (the pre-2026 graduate format) with the degree-based prefix:

```tex
\documentclass[printcopy,fontset=windows,language=english,headerstyle=centered]{Style/neuthesis}
\documentclass[printcopy,fontset=windows,language=english,headerstyle=legacy]{Style/neuthesis}
```

Centered front/back-matter headers display only the title, without a main-matter chapter number.

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
