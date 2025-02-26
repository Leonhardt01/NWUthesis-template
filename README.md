# 平时作业论文模板自用



使用XeLaTeX编译，其中-synctex=1参数可有可无，如使用会生成.synctex.gz文件，在某些编辑器中(如vscode)实现正反向定位，main为文件名

```bash
xelatex -synctex=1 main
```

如果带有参考文献，需要在.bib文件内更改并在main.tex中引用，编译顺序如下，具体原理参考LaTeX交叉引用

```bash
xelatex main.tex
bibtex main.aux
xelatex main.tex
xelatex main.tex
```

或者也可以使用如下命令，其中-interaction=nonstopmode代表出现错误时候不停止编译，知道最后才显示错误位置，同样也是可以根据自己需求选择

```bash
latexmk -pdfxe -synctex=1 -interaction=nonstopmode main
```
注意，如果在引用参考文献的情况下，如果出现以下错误
- `"Package natbib: Bibliography not compatible with author-year citations."`

则需要删除文件中的bbl文件，再重新编译

参考文献样式为GB/T 7714-2005，在`texlive/(your version)/texmf-dist/bibtex/bst/gbt7714`中是有现成的
