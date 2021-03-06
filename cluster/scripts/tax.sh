#!/bin/bash

THREADS=8

for M in even uneven; do

    if [ ! -e results/$M/$M.spec.ualn ]; then

        echo Running usearch on $M dataset

        usearch --usearch_global results/$M/$M.derep.fasta \
            --db data/rrna_reference.fasta \
            --id 0.95 --blast6out results/$M/$M.spec.ualn \
            --strand plus --threads $THREADS

    fi

    if [ ! -e results/$M/$M.spec.u8aln ]; then

        echo Running usearch8 on $M dataset

        usearch8 --usearch_global results/$M/$M.derep.fasta \
            --db data/rrna_reference.fasta \
            --id 0.95 --blast6out results/$M/$M.spec.u8aln \
            --strand plus --threads $THREADS

    fi

    if [ ! -e results/$M/$M.spec.valn ]; then

        echo Running vsearch on $M dataset

        vsearch --usearch_global results/$M/$M.derep.fasta \
            --db data/rrna_reference.fasta \
            --id 0.95 --blast6out results/$M/$M.spec.valn \
            --strand plus --threads $THREADS

    fi

done
