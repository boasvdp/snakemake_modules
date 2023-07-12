SAMPLES, = glob_wildcards("input/{sample}.fq")

rule all:
    input:
        expand("output/fastqc/{sample}.html", sample=SAMPLES),
        expand("output/spades/{sample}.fasta", sample=SAMPLES),

rule fastqc:
    input:
        "input/{sample}.fq"
    output:
        "output/fastqc/{sample}.html"
    conda:
        "envs/fastqc.yaml"
    shell:
        """
        fastqc --version
        which fastqc
        echo fastqc > {output}
        """

rule fastp:
    input:
        "input/{sample}.fq"
    output:
        "output/fastp/{sample}.fq"
    container:
        "docker://staphb/fastp:0.23.4"
    conda:
        "envs/fastp.yaml"
    shell:
        """
        fastp --version
        which fastp
        cat {input} > {output}
        """

rule spades:
    input:
        "output/fastp/{sample}.fq"
    output:
        "output/spades/{sample}.fasta"
    conda:
        "envs/spades.yaml"
    shell:
        """
        spades.py --version
        which spades.py
        cat {input} > {output}
        """