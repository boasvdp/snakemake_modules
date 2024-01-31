rule version:
    output:
        "dummy.txt",
    conda:
        "envs/dummy.yaml"
    container:
        "dummy"
    shell:
        """
        {params.version_command} > {output}
        """
