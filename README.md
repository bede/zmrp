## ZeptoMetrix Respiratory Panel 2.1 genome sequences

Draft quality genome sequences for virus genomes included in the [ZeptoMetrix Respiratory Panel 2.1](https://www.zeptometrix.com/us/en/nattrol-respiratory-panel-21-rp21-controls-12-x-03ml-3084), a DNA & RNA positive control panel for metagenomics. Bacterial genomes and coronaviruses HKU-1 and NL63 are excluded due to poor coverage, despite deep sequencing using a variety of protocols.

DNA libraries were prepared with SMART-9N and ONT protocols for sequencing using ONT Promethion. Dorado 4.3 HAC was used for basecalling. Reads were mapped to nearby references with Minimap2, consensus called with Kindel, and polished with Medaka.

Use with [knownknowns](https://github.com/bede/knownknowns) to quickly estimate positive control containment in a FASTQ file.

## Genomes

| Genome | Abbreviation | Reference | Type | Length | Assembly |
|----------|-------------|-------------------|-------------|--------|--------|
| Adenovirus Type 1 | AdV-1 | AC_000017.1 | DNA | 35,676 | ✅ |
| Adenovirus Type 3 | AdV-B | DQ099432.4 | DNA | 35,072 | ✅ |
| Adenovirus Type 31 | AdV-31 | AM749299.1 | DNA | 33,755 | ✅ |
| *Bordetella parapertussis* A747 |  |  | DNA |  |  |
| *Bordetella pertussis* A639 |  |  | DNA |  |  |
| *Chlamydia pneumoniae* IOL-207 |  |  | DNA |  |  |
| Coronavirus 229E | HCoV-229E | OZ035244.1 | RNA | 26,841 | ✅ |
| Coronavirus HKU-1 | | | RNA |  |  |
| Coronavirus NL63 |  |  | RNA |  |  |
| Influenza A H1N1 A/NY/02/2009 | Flu-A-H1N1-S | KT180555.1 | RNA | 13,130 | ✅ |
| Influenza A H3N2 A/Brisbane/10/07 | Flu-A-H3N2 | KJ609211.1 | RNA | 13,290 | ✅ |
| Influenza AH1 A/New Caledonia/20/99 | Flu-A-H1N1-F | CY033629.1 | RNA | 13,292 | ✅ |
| Influenza B B/Florida/02/06 | Flu-B | CY018371.1 | RNA | 14,222 | ✅ |
| Metapneumovirus 8 Peru6-2003 | HMPV | OL794390.1 | RNA | 13,149 | ✅ |
| *Mycoplasma pneumoniae* M129 |  |  | DNA |  |  |
| Parainfluenza Type 1 | HPIV-1 | PV660323.1 | RNA | 15,412 | ✅ |
| Parainfluenza Type 2 | HPIV-2 | AF533012.1 | RNA | 15,654 | ✅ |
| Parainfluenza Type 3 | HPIV-3 | KY674922.1 | RNA | 15,382 | ✅ |
| Parainfluenza Type 4 | HPIV-4 | EU627591.1 | RNA | 17,132 | ⚠️ gaps |
| Rhinovirus 1A | HRV-1A | KC894166.1 | RNA | 7,096 | ✅ |
| RSV A | RSV-A | KY967364.1 | RNA | 14,855 | ✅ |
| SARS-CoV-2 USA-WA1/2020 | SARS-CoV-2 | ON311149.1 | RNA | 29,778 | ✅ |