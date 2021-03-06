#!/bin/bash

mkdir -p data

## should we consider switching to Rfam 12 (27/01/2015)?
if [ ! -e data/Rfam_11_0.fasta ]; then
    
    cd data

    echo Downloading dataset
    
    wget -nv ftp://ftp.ebi.ac.uk/pub/databases/Rfam/11.0/Rfam.fasta.gz

    gunzip Rfam.fasta.gz
    
    mv Rfam.fasta Rfam_11_0.fasta
    
    cd ..
    
fi
