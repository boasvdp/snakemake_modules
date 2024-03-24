# Exclude samples based on QC

This example uses a checkpoint to exclude samples for further analyses if a certain threshold is not met.

The Snakefile gets line counts from the mock fastq files (rule map). This is aggregated over with an expand function (qc_map). Next, a checkpoint function takes the aggregated input and copies files based on a "qc" threshold (number of lines) to an output directory. The input function used several steps later by another aggregating rule globs wildcards from the checkpoint output folder based on an expected pattern.

Use case: map reads onto a reference, count mapped reads/calculate coverage etc --> exclude samples if they e.g. have empty BAM files. This way any further analyses that cannot handle empty BAM files (variant calling, extra QC) does not have to run on it/create dummy outputs.