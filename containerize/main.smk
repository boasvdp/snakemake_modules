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
        "echo fastqc > {output}"

rule fastp:
    input:
        "input/{sample}.fq"
    output:
        "output/fastp/{sample}.fq"
    conda:
        "envs/fastp.yaml"
    shell:
        "cat {input} > {output}"

rule spades:
    input:
        "output/fastp/{sample}.fq"
    output:
        "output/spades/{sample}.fasta"
    conda:
        "envs/spades.yaml"
    shell:
        "cat {input} > {output}"