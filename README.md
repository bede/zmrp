## ZeptoMetrix Respiratory Panel 2.1 genome sequences

Draft quality genome sequences for virus genomes included in the [ZeptoMetrix Respiratory Panel 2.1](https://www.zeptometrix.com/us/en/nattrol-respiratory-panel-21-rp21-controls-12-x-03ml-3084), a DNA & RNA positive control panel for metagenomics. Bacterial genomes and coronaviruses HKU-1 and NL63 are excluded due to poor coverage, despite deep sequencing using a variety of protocols.

DNA libraries were prepared with SMART-9N and ONT protocols for sequencing using ONT Promethion. Dorado 4.3 HAC was used for basecalling. Reads were mapped to nearby references with Minimap2, consensus called with Kindel, and polished with Medaka.

Use with [knownknowns](https://github.com/bede/knownknowns) to quickly estimate positive control containment in a FASTQ file.

## Genomes

| Genome | Abbreviation | Reference | Type | Status |
|----------|-------------|-------------------|-------------|--------|
| Adenovirus Type 1 | AdV-1 | AC_000017.1 | DNA | ✅ |
| Adenovirus Type 3 | AdV-B | DQ099432.4 | DNA | ✅ |
| Adenovirus Type 31 | AdV-31 | AM749299.1 | DNA | ✅ |
| *Bordetella parapertussis* A747 |  |  | DNA | ❌ (low cov) |
| *Bordetella pertussis* A639 |  |  | DNA | ❌ (low cov) |
| *Chlamydia pneumoniae* IOL-207 |  |  | DNA | ❌ (low cov) |
| Coronavirus 229E | HCoV-229E | OZ035244.1 | RNA | ✅ |
| Coronavirus HKU-1 | | | RNA | ❌ (low cov) |
| Coronavirus NL63 |  |  | RNA | ❌ (low cov) |
| Influenza A 2009 H1N1pdm A/NY/02/2009 | Flu-A-H1N1-S | KT180555.1 | RNA | ✅ |
| Influenza A H3N2 A/Brisbane/10/07 | Flu-A-H3N2 | KJ609211.1 | RNA | ✅ |
| Influenza AH1 A/New Caledonia/20/99 | Flu-A-H1N1-F | CY033629.1 | RNA | ✅ |
| Influenza B B/Florida/02/06 | Flu-B | CY018371.1 | RNA | ✅ |
| Metapneumovirus 8 Peru6-2003 | HMPV | OL794390.1 | RNA | ✅ |
| *Mycoplasma pneumoniae* M129 |  |  | DNA | ❌ (low cov) |
| Parainfluenza Type 1 | HPIV-1 | PV660323.1 | RNA | ✅ |
| Parainfluenza Type 2 | HPIV-2 | AF533012.1 | RNA | ✅ |
| Parainfluenza Type 3 | HPIV-3 | KY674922.1 | RNA | ✅ |
| Parainfluenza Type 4 | HPIV-4 | EU627591.1 | RNA | ✅ |
| Rhinovirus 1A | HRV-1A | KC894166.1 | RNA | ✅ |
| RSV A | RSV-A | KY967364.1 | RNA | ✅ |
| SARS-CoV-2 USA-WA1/2020 | SARS-CoV-2 | ON311149.1 | RNA | ✅ |