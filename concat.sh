#!/bin/bash

# Concatenate genomes from genomes/ and genomes/segmented/

cat genomes/*.fa genomes/segmented/*.fa > zmrp21.fa

> zmrp21.combined-segments.fa

# Add all non-segmented genomes
cat genomes/*.fa >> zmrp21.combined-segments.fa

# Process each segmented genome
for file in genomes/segmented/*.fa; do
    if [ -f "$file" ]; then
        echo "Processing segmented file: $file"
        
        # Extract the first header line
        first_header=$(grep -m 1 "^>" "$file")
        
        # Extract all sequence lines (non-header lines)
        sequences=$(grep -v "^>" "$file" | tr -d '\n')
        
        # Write the first header and concatenated sequences
        echo "$first_header" >> zmrp21.combined-segments.fa
        echo "$sequences" >> zmrp21.combined-segments.fa
    fi
done

echo "Done"
echo "- zmrp21.fa: Contains all individual genome files"
echo "- zmrp21.combined-segments.fa: Contains individual genomes plus segmented genomes with segments combined"