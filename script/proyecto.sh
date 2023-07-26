#!/bin/bash
run() 
{
    cd ..
    code Project.ipynb
}

report()
{
    cd ..
    cd informe
    pdflatex informe.tex
}

slides()
{
    cd ..
    cd presentacion
    pdflatex presentacion.tex
}
show_report(){
  
    cd ..
    cd informe
    if [ ! -f informe.pdf ]
    then
    pdflatex informe.tex
    fi

    echo "Desea ejecutar el archivo por defecto (y-> yes , n -> no)"
    read respuesta
    if [ $respuesta = "y" ]
    then
    start informe.pdf
    else
    echo "Introduzca el visualizador que desea"
    read salida
    $salida informe.pdf
    fi
}
show_slides()
{
    cd ..
    cd presentacion
    if [ ! -f presentacion.pdf ]
    then
    pdflatex presentacion.tex
    fi

    echo "Desea ejecutar el archivo por defecto (y-> yes , n -> no)"
    read respuesta
    if [ $respuesta = "y" ]
    then
    start presentacion.pdf
    else
    echo "Introduzca el visualizador que desea"
    read salida
    $salida main.pdf
    fi
}
clean()
{
    cd ..
    cd informe
    rm -f *.aux *.lot *.lof *.log *.toc *.dvi *.ps *.bbl *.out *.synctex.gz *.fls *.fdb_latexmk
    rm -f *.nav *.snm *.vrb *.bib
    cd ..
    cd presentacion
    rm -f *.aux *.lot *.lof *.log *.toc *.dvi *.ps *.bbl *.out *.synctex.gz *.fls *.fdb_latexmk 
    rm -f *.nav *.snm *.vrb
}
case "$1" in
  "run")
    run ;;
  "report")
    report ;;
  "slides")
    slides ;;
  "show_report")
    show_report "$2" ;;
  "show_slides")
    show_slides "$2" ;;
  "clean")
    clean ;;
  *)
    echo "Opción no válida" ;;
esac
    
