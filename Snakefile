SAMPLES = ['1', '2', '3']

rule all:
    input:
        expand("out_C.txt"

rule A:
    output:
        "out_A/{sample}.txt"
    shell:
        "echo A > {output}"

rule B:
    input:
        "out_A/{sample}.txt"
    output:
        "out_B/{sample}.txt"
    shell:
        "cat {input} > {output}"

rule C:
    input:
        expand("out_B/{sample}.txt", sample=SAMPLES)
    output:
        "out_C.txt"
    shell:
        "cat {input} > {output}"
