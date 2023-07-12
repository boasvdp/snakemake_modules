#!/bin/bash
exec > versions.txt 2>&1

set -x
singularity --version
snakemake --version
mamba --version
