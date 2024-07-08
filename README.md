# 平时作业论文模板自用



使用XeLaTeX编译，其中-synctex=1参数可有可无，如使用会生成.synctex.gz文件，在某些编辑器中(如vscode)实现正反向定位，paper为文件名

```bash
xelatex -synctex=1 paper
```

如果带有参考文献，需要在.bib文件内更改并在paper.tex中引用，编译顺序如下，具体原理参考LaTeX交叉引用

```bash
xelatex paper.tex
bibtex paper.aux
xelatex paper.tex
xelatex paper.tex
```

或者也可以使用如下命令，其中-interaction=nonstopmode代表出现错误时候不停止编译，知道最后才显示错误位置，同样也是可以根据自己需求选择

```bash
latexmk -pdfxe -synctex=1 -interaction=nonstopmode main
```
注意，如果在引用参考文献的情况下，如果出现以下错误
- `"Package natbib: Bibliography not compatible with author-year citations."`

则需要删除文件中的bbl文件，再重新编译
