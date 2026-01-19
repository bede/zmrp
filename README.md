## ZeptoMetrix Respiratory Panel 2.1 genome sequences

Draft quality genome sequences for viruses included in the [ZeptoMetrix Respiratory Panel 2.1](https://www.zeptometrix.com/us/en/nattrol-respiratory-panel-21-rp21-controls-12-x-03ml-3084), a DNA & RNA verification panel for metagenomics. Bacterial genomes and coronaviruses HKU-1 and NL63, and OC43 are excluded due to poor coverage, despite deep sequencing using a variety of protocols.

DNA libraries were prepared with SMART-9N and ONT protocols for sequencing using ONT Promethion by Mia Weaver at the University of Birmingham. High accuracy basecalling was performed with Dorado. Reads were mapped to nearby references with Minimap2, consensus called with Kindel, and polished with Medaka. Bacterial reads were basecalled (`sup`) and polished in `--bacteria` mode using Dorado 1.3.1.

Use [grate](https://github.com/bede/grate) or [knownknowns](https://github.com/bede/knownknowns) to estimate containment of these genomes within read datasets.

## Genomes

| Genome | Abbreviation | Reference | Type | Length | Pool | Assembly |
|----------|-------------|-------------------|-------------|--------|--------|--------|
| Adenovirus Type 1 | AdV-1 | AC_000017.1 | DNA | 35,676 | 1 | ✅ |
| Adenovirus Type 3 | AdV-3 | DQ099432.4 | DNA | 35,072 | 1 | ✅ |
| Adenovirus Type 31 | AdV-31 | AM749299.1 | DNA | 33,755 | 1 | ✅ |
| Influenza A H1N1 A/NY/02/2009 | Flu-A-H1N1-NY | KT180555.1 | RNA | 13,130 | 1 | ✅ |
| Influenza A H3N2 A/Brisbane/10/07 | Flu-A-H3N2 | KJ609211.1 | RNA | 13,290 | 1 | ✅ |
| Influenza AH1 A/New Caledonia/20/99 | Flu-A-H1N1-NC | CY033629.1 | RNA | 13,292 | 2 | ✅ |
| Influenza B B/Florida/02/06 | Flu-B | CY018371.1 | RNA | 14,222 | 2 | ✅ |
| Metapneumovirus 8 Peru6-2003 | HMPV | OL794390.1 | RNA | 13,149 | 1 | ✅ |
| Parainfluenza Type 1 | HPIV-1 | PV660323.1 | RNA | 15,412 | 1 | ✅ |
| Parainfluenza Type 2 | HPIV-2 | AF533012.1 | RNA | 15,654 | 2 | ✅ |
| Parainfluenza Type 3 | HPIV-3 | KY674922.1 | RNA | 15,382 | 2 | ✅ |
| Parainfluenza Type 4 | HPIV-4 | EU627591.1 | RNA | 17,132 | 1 | ⚠️ gaps |
| Rhinovirus 1A | HRV-1A | KC894166.1 | RNA | 7,096 | 1 | ✅ |
| RSV A | RSV-A | KY967364.1 | RNA | 14,855 | 2 | ✅ |
| SARS-CoV-2 USA-WA1/2020 | SARS-CoV-2 | ON311149.1 | RNA | 29,778 | 1 | ✅ |
| Coronavirus 229E | HCoV-229E | OZ035244.1 | RNA | 26,841 | 2 | ✅ |
| Coronavirus HKU-1 (partial) |  |  | RNA |  | 2 | ❌ |
| Coronavirus NL63 |  |  | RNA |  | 2 | ❌ |
| Coronavirus OC43 |  |  | RNA |  | 2 | ❌ |
| *Bordetella parapertussis* A747 | Bpara | NZ_CP020655.1 | DNA | 4,773,555 | 2 | ⚠️ polished using 31% read cov |
| *Bordetella pertussis* A639 | Bpert | CP046993.1 | DNA | 4,181,399 | 2 | ⚠️ polished using 31% read cov |
| *Chlamydia pneumoniae* IOL-207 | Cpneu | AE001363.1 | DNA | 1,245,525 | 1 | ⚠️ polished using 32% read cov |
| *Mycoplasma pneumoniae* M129 | Mpneu | U00089.2 | DNA | 816,284 | 1 | ⚠️ polished using 32% read cov |



## Development

Rebuild outputs:

```
uv run build.py
```

