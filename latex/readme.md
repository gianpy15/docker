# Latex Compiler
Texlive distribution for scientific papers and more

## Usage
```
$ docker run --rm -it -v $(pwd):/source gianpy15/latex
```
This command will create the container with the current directory mounted in `/source`, if you want to change the directory replace `$(pwd)`

### Compiling a latex document
```
$ pdflatex my-document.tex
```

