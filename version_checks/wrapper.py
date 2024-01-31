from snakemake import snakemake
from pathlib import Path
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("-s", type=Path, default="Snakefile", dest="snakefile")
parser.add_argument("-c", type=int, default=1)
parser.add_argument("--dryrun", action="store_true")
parser.add_argument("--output", type=Path, default="output")
parser.add_argument("--deployment", type=str, default="singularity", choices=["singularity", "conda"])

args = parser.parse_args()

if args.deployment == "singularity":
    use_singularity = True
    use_conda = False
elif args.deployment == "conda":
    use_singularity = False
    use_conda = True
else:
    raise ValueError("Unknown deployment option")

class TestPipeline:
    def test_pipeline(self):
        snakemake(
            snakefile=args.snakefile,
            dryrun=args.dryrun,
            printshellcmds=True,
            cores=args.c,
            config={"output": args.output},
            use_conda=use_conda,
            use_singularity=use_singularity,
        )

if __name__ == "__main__":
    TestPipeline().test_pipeline()