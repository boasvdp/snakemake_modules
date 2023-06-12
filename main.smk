from snakemake.utils import min_version
min_version("6.0")

SAMPLES = ["4", "5", "6"]

rule all:
    input:
        "simple_C_out.txt"

module simple:
    snakefile:
        github("boasvdp/snakemake_modules", path="library/simple.smk", commit="b28e8c3")

use rule A, B, C from simple as simple_*

use rule C from simple as simple_C with:
    input:
        expand(rules.simple_B.output, sample=SAMPLES)
    output:
        "simple_C_out.txt"

