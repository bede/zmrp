#!/bin/bash

# Concatenate genomes from genomes/ and genomes/segmented/

# Concatenate genomes ensuring proper line breaks between files
> zmrp21.fa
for file in genomes/*.fa genomes/segmented/*.fa; do
    if [ -f "$file" ]; then
        cat "$file" >> zmrp21.fa
        # Ensure file ends with newline
        if [ -n "$(tail -c1 "$file")" ]; then
            echo >> zmrp21.fa
        fi
    fi
done

> zmrp21.combined.fa

# Add all non-segmented genomes
cat genomes/*.fa >> zmrp21.combined.fa

# Process each segmented genome
for file in genomes/segmented/*.fa; do
    if [ -f "$file" ]; then
        echo "Processing segmented file: $file"
        
        # Extract the first header line
        first_header=$(grep -m 1 "^>" "$file")
        
        # Extract all sequence lines (non-header lines)
        sequences=$(grep -v "^>" "$file" | tr -d '\n')
        
        # Write the first header and concatenated sequences
        echo "$first_header" >> zmrp21.combined.fa
        echo "$sequences" >> zmrp21.combined.fa
    fi
done

# Count sequence lengths and output to lengths.csv
echo "id,length" > lengths.csv

# Process the combined segments file to count sequence lengths
awk '
BEGIN { 
    header = ""
    seq = ""
}
/^>/ {
    if (header != "") {
        # Remove the ">" from header and print previous sequence length
        gsub(/^>/, "", header)
        print header "," length(seq)
    }
    header = $0
    seq = ""
}
!/^>/ {
    seq = seq $0
}
END {
    if (header != "") {
        # Process the last sequence
        gsub(/^>/, "", header)
        print header "," length(seq)
    }
}' zmrp21.combined.fa >> lengths.csv

# Separate DNA viruses, RNA viruses, and bacteria from combined file
> zmrp21.combined.dna-viruses.fa
> zmrp21.combined.rna-viruses.fa
> zmrp21.combined.bacteria.fa

awk '
/^>/ {
    header = $0
    is_adv = (header ~ /AdV/)
    is_bacteria = (header ~ /Cpneu|Bpert|Bpara|Mpneu/)
    printed_header = 0
    next
}
{
    if (is_bacteria) {
        if (!printed_header) { print header >> "zmrp21.combined.bacteria.fa"; printed_header = 1 }
        print $0 >> "zmrp21.combined.bacteria.fa"
    } else if (is_adv) {
        if (!printed_header) { print header >> "zmrp21.combined.dna-viruses.fa"; printed_header = 1 }
        print $0 >> "zmrp21.combined.dna-viruses.fa"
    } else {
        if (!printed_header) { print header >> "zmrp21.combined.rna-viruses.fa"; printed_header = 1 }
        print $0 >> "zmrp21.combined.rna-viruses.fa"
    }
}' zmrp21.combined.fa

echo "Done"
echo "- zmrp21.fa: Contains all individual genome files"
echo "- zmrp21.combined.fa: Contains individual genomes plus segmented genomes with segments combined"
echo "- zmrp21.combined.dna-viruses.fa: Contains adenovirus genomes (DNA viruses)"
echo "- zmrp21.combined.rna-viruses.fa: Contains all other viral genomes (RNA viruses)"
echo "- zmrp21.combined.bacteria.fa: Contains bacterial genomes"
echo "- lengths.csv: Contains sequence IDs and their lengths in base pairs"