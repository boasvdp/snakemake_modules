import argparse
from pathlib import Path

parser = argparse.ArgumentParser(description='QC map decision')

parser.add_argument('--input', type=Path, help='Input file', nargs='+')
parser.add_argument('--agg', type=str, help='Input agg file')
parser.add_argument('--min_lines', type=int, help='Minimum number of lines')
parser.add_argument('--output', type=Path, help='Output file')

args = parser.parse_args()

import pandas as pd
import shutil as sh

# Read input files
df = pd.read_csv(args.agg, sep='\t', header=None, names=["sample", "nr_lines"])

list_qc_passed = df[df['nr_lines'] >= args.min_lines]['sample'].to_list()

args.output.mkdir(parents=True, exist_ok=True)

# if sample is in list_qc_passed, copy the corresponding file from input to the output directory
for f in args.input:
    print(f"check if {f.stem} is in {list_qc_passed}")
    if f.stem in list_qc_passed:
        sh.copyfile(f, args.output / f.name)