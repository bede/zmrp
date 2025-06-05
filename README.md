## ZeptoMetrix Respiratory Panel 2.1 genome sequences

Draft quality genome sequences for 16/18 virus genomes included in the [ZeptoMetrix Respiratory Panel 2.1](https://www.zeptometrix.com/us/en/nattrol-respiratory-panel-21-rp21-controls-12-x-03ml-3084), a DNA & RNA positive control panel for metagenomics. Bacterial genomes and coronaviruses HKU-1 and NL63 are excluded due to poor coverage, despite deep sequencing using a variety of protocols.

DNA libraries were prepared with SMART-9N and ONT protocols for sequencing using ONT Promethion. Dorado 5 HAC was used for basecalling. Consensus sequences were generated using Minimap2 and Kindel.

Use with [knownknowns](https://github.com/bede/knownknowns) to rapidly validate positive control containment.

## Genomes

| Genome | Abbreviation | Type | Status |
|----------|-------------|-------------|--------|
| Adenovirus Type 1 | AdV-1 | DNA | ✅ |
| Adenovirus Type 3 | AdV-B | DNA | ✅ |
| Adenovirus Type 31 | AdV-31 | DNA | ✅ |
| *Bordetella parapertussis* A747 |  | DNA | ❌ (low cov) |
| *Bordetella pertussis* A639 |  | DNA | ❌ (low cov) |
| *Chlamydia pneumoniae* IOL-207 |  | DNA | ❌ (low cov) |
| Coronavirus 229E | HCoV-229E | RNA | ✅ |
| Coronavirus HKU-1 | | RNA | ❌ (low cov) |
| Coronavirus NL63 |  | RNA | ❌ (low cov) |
| Influenza A 2009 H1N1pdm A/NY/02/2009 | Flu-A-H1N1-S | RNA | ✅ |
| Influenza A H3N2 A/Brisbane/10/07 | Flu-A-H3N2 | RNA | ✅ |
| Influenza AH1 A/New Caledonia/20/99 | Flu-A-H1N1-F | RNA | ✅ |
| Influenza B B/Florida/02/06 | Flu-B | RNA | ✅ |
| Metapneumovirus 8 Peru6-2003 | HMPV | RNA | ✅ |
| *Mycoplasma pneumoniae* M129 |  | DNA | ❌ (low cov) |
| Parainfluenza Type 1 | HPIV-1 | RNA | ✅ |
| Parainfluenza Type 2 | HPIV-2 | RNA | ✅ |
| Parainfluenza Type 3 | HPIV-3 | RNA | ✅ |
| Parainfluenza Type 4 | HPIV-4 | RNA | ✅ |
| Rhinovirus 1A | HRV-1A | RNA | ✅ |
| RSV A | RSV-A | RNA | ✅ |
| SARS-CoV-2 USA-WA1/2020 | SARS-CoV-2 | RNA | ✅ |