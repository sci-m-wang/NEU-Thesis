#!/bin/bash

set -e

if [[ "$#" == "1" ]]; then
    FileName="Thesis"
elif [[ "$#" == "2" ]]; then
    FileName="$2"
fi


TexCompiler="xelatex"

if [[ $1 == *'a'* ]]; then
    BibCompiler="bibtex"
elif [[ $1 == *'b'* ]]; then
    BibCompiler="biber"
fi


Tmp="Tmp"


$TexCompiler --output-directory=$Tmp $FileName || exit


if [[ -n $BibCompiler ]]; then

    $BibCompiler $Tmp/$FileName

    $TexCompiler --output-directory=$Tmp $FileName || exit
    $TexCompiler --output-directory=$Tmp $FileName || exit
fi

echo "build finished..."



