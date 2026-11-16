# 东北大学学位论文
|[中文](https://github.com/sci-m-wang/NEU-Thesis/blob/main/README.md)|[English](https://github.com/sci-m-wang/NEU-Thesis/blob/main/en.md)|

东北大学(沈阳)学位论文LaTex版(硕博士通用)，可直接导入[Overleaf](https://www.overleaf.com/)。现在中英文共用同一套模板，通过 `Thesis.tex` 中的 `language` 选项切换。

## 中英文切换

在 `Thesis.tex` 中设置 `language` 选项：

```tex
\documentclass[printcopy,fontset=windows,language=chinese]{Style/neuthesis}
\documentclass[printcopy,fontset=windows,language=english]{Style/neuthesis}
```

该选项会切换固定标签、封面、声明页、目录/图表/参考文献名称，以及默认示例正文。

## 版芯与页眉

启用默认的 `geometry` 设置时，正文版芯为格式说明要求的 **160mm × 247mm**；页码使用正文的默认字号。前置部分罗马数字、正文阿拉伯数字的编号方式不变。

默认 `headerstyle=legacy` 保留左侧学校／学位信息、右侧章题的布局，以及根据学位自动切换前缀的功能。需要五号楷体、章号章题居中的页眉时，可选择：

```tex
\documentclass[printcopy,fontset=windows,language=chinese,headerstyle=centered]{Style/neuthesis}
```

前置／后置部分的居中页眉只显示标题，不拼接正文的章号。`headerstyle` 只控制页眉布局，不代表已经完整复现某一新版学校模板；标题、目录、声明页与空白页等仍需按适用的格式要求检查。

## 本地编译

安装 XeLaTeX、BibTeX 及所选字体后，在仓库根目录运行 `bash build.sh a`。脚本会自动创建 `Tmp/` 并输出 `Tmp/Thesis.pdf`。可运行 `bash tests/build-smoke.sh` 检查首次构建、重复构建及自定义文件名的脚本逻辑，此测试不需要 TeX 或字体。

如果这个模板对您有帮助的话，非常希望得到您的**小星星**。

LaTex的排版的便利程度远高于Word等文字编辑软件，在有模板的情况下可以轻松地实现要求的格式和版式，并且不容易出错。但是LaTex的模板设计和环境配置都比较麻烦，现在有几个设计好的模板可供使用，并且有在线的Overleaf平台，极大地简化了LaTex的上手难度，提高了科研效率。然而，我发现这两个模板导入Overleaf后会出现一些错误，并不能直接使用，我进行了修改，并添加了字体，使得这个模板可以直接导入Overleaf使用，希望能给大家提供便利。

## Contribution
我个人能力有限，需要我们所有人的共同努力，才能让项目变得更好。如果您在使用本项目时发现问题，可以通过以下两种方式作出贡献：

### A. 如果你知道如何解决问题
1. [Fork](https://github.com/sci-m-wang/NEU-Thesis/fork)这个项目
2. 修改对应部分代码
3. 提交修改代码[Pull requests](https://github.com/sci-m-wang/NEU-Thesis/pulls)

### B. 如果你不知道如何解决问题
- 您可以仅提交一个[issue](https://github.com/sci-m-wang/NEU-Thesis/issues)。帮助我们发现问题也是非常重要的贡献！

## Acknowledgment
这个模板是在[mervin0502/neuthesis](https://github.com/mervin0502/neuthesis)和[NEUAI/neuthesis-enhanced](https://github.com/NEUAI/neuthesis-enhanced)两个项目基础上修改的。
