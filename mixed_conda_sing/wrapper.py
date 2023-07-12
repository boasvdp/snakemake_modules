#!/usr/bin/env python3

from snakemake import snakemake
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("--snakefile", "-s",
                    default="main.smk")

args = parser.parse_args()

snakemake(args.snakefile, listrules=True, forcerun=["fastp"])