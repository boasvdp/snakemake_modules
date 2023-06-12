from snakemake.utils import min_version
min_version("6.14")

SAMPLES = ["4", "5", "6"]

rule all:
    input:
        "simple_C_out.txt"

module simple:
    snakefile:
        github("boasvdp/snakemake_playground", path="modules/library/simple.smk", branch="master")

use rule A, B, C from simple as simple_*

use rule C from simple as simple_C with:
    input:
        expand(rules.simple_B.output, sample=SAMPLES)
    output:
        "simple_C_out.txt"

