#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = ["dnaio"]
# ///
"""Build ZMRP21 reference files from genome sequences."""

import csv
import re
from pathlib import Path

import dnaio


def extract_segment_number(header: str) -> int:
    """Extract segment number from FASTA header for sorting."""
    # Match trailing segment number like "Flu-A-H1N1-NY-1" or "segment 1"
    match = re.search(r'-(\d+)$', header.split()[0])
    if match:
        return int(match.group(1))
    match = re.search(r'segment\s*(\d+)', header, re.IGNORECASE)
    if match:
        return int(match.group(1))
    return 0  # Default for non-segmented


def read_fasta(path: Path, sort_segments: bool = False) -> list[tuple[str, str]]:
    """Read FASTA file and return list of (header, sequence) tuples."""
    sequences = []
    with dnaio.open(path) as f:
        for record in f:
            sequences.append((f">{record.name}", record.sequence))
    if sort_segments:
        sequences.sort(key=lambda x: extract_segment_number(x[0]))
    return sequences


def write_fasta(path: Path, sequences: list[tuple[str, str]]) -> None:
    """Write sequences to FASTA file."""
    with dnaio.open(path, mode='w') as f:
        for header, seq in sequences:
            name = header[1:] if header.startswith('>') else header
            f.write(dnaio.SequenceRecord(name, seq))


def load_metadata(path: Path) -> dict[str, dict]:
    """Load genome metadata from TSV file, keyed by accession."""
    genomes = {}
    with open(path) as f:
        for row in csv.DictReader(f, delimiter='\t'):
            genomes[row['accession']] = row
    return genomes


def get_genome_path(accession: str, metadata: dict) -> Path:
    """Return path to genome file based on whether it's segmented."""
    if metadata['segmented'] == 'yes':
        return Path('genomes/segmented') / f"{accession}.fa"
    return Path('genomes') / f"{accession}.fa"


def main():
    # Load metadata
    metadata = load_metadata(Path('genomes.tsv'))

    # Collect all sequences for zmrp21.fa (including individual segments)
    all_sequences = []
    # Collect sequences for zmrp21.combined.fa (segments merged)
    combined_sequences = []

    for accession, info in metadata.items():
        path = get_genome_path(accession, info)
        is_segmented = info['segmented'] == 'yes'
        sequences = read_fasta(path, sort_segments=is_segmented)

        # Add all individual sequences to zmrp21.fa
        all_sequences.extend(sequences)

        if is_segmented:
            # Merge all segments into single sequence
            first_header = sequences[0][0]
            merged_seq = ''.join(seq for _, seq in sequences)
            combined_sequences.append((first_header, merged_seq))
        else:
            # Non-segmented: add as-is
            combined_sequences.extend(sequences)

    # Write zmrp21.fa
    write_fasta(Path('zmrp21.fa'), all_sequences)
    print(f"zmrp21.fa: {len(all_sequences)} sequences")

    # Write zmrp21.combined.fa
    write_fasta(Path('zmrp21.combined.fa'), combined_sequences)
    print(f"zmrp21.combined.fa: {len(combined_sequences)} sequences")

    # Write lengths.csv
    with open('lengths.csv', 'w') as f:
        f.write("id,length\n")
        for header, seq in combined_sequences:
            seq_id = header[1:]  # Remove leading '>'
            f.write(f"{seq_id},{len(seq)}\n")
    print(f"lengths.csv: {len(combined_sequences)} entries")

    # Split by category using metadata lookup
    category_sequences = {
        'dna-viruses': [],
        'rna-viruses': [],
        'bacteria': [],
    }

    # Map category values to output file categories
    category_map = {
        'dna-virus': 'dna-viruses',
        'rna-virus': 'rna-viruses',
        'bacteria': 'bacteria',
    }

    for header, seq in combined_sequences:
        # Extract accession from header (format: ">ACCESSION ABBREV" or ">ACCESSION ABBREV-N")
        accession = header[1:].split()[0]
        info = metadata[accession]
        category = category_map[info['category']]
        category_sequences[category].append((header, seq))

    # Write category files
    for category, sequences in category_sequences.items():
        path = Path(f'zmrp21.combined.{category}.fa')
        write_fasta(path, sequences)
        print(f"{path}: {len(sequences)} sequences")

    print("\nDone!")


if __name__ == '__main__':
    main()
