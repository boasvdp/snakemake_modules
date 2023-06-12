FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="47070b6af48a3f4baa8c9014a528aced85c953452de97591614518f53ce1c831"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: envs/fastp.yaml
#   prefix: /conda-envs/bd54b8bbb10dda998f3614f42f795afa
#   channels:
#   - bioconda
#   - conda-forge
#   dependencies:
#   - fastp=0.20.0
RUN mkdir -p /conda-envs/bd54b8bbb10dda998f3614f42f795afa
COPY envs/fastp.yaml /conda-envs/bd54b8bbb10dda998f3614f42f795afa/environment.yaml

# Conda environment:
#   source: envs/fastqc.yaml
#   prefix: /conda-envs/9750aee182b09ec066acfdcd6d2b8a0c
#   channels:
#   - bioconda
#   - conda-forge
#   dependencies:
#   - fastqc=0.11.9
RUN mkdir -p /conda-envs/9750aee182b09ec066acfdcd6d2b8a0c
COPY envs/fastqc.yaml /conda-envs/9750aee182b09ec066acfdcd6d2b8a0c/environment.yaml

# Conda environment:
#   source: envs/spades.yaml
#   prefix: /conda-envs/ea5499fdfdd8dca765fb26a6669d13e3
#   channels:
#   - bioconda
#   - conda-forge
#   dependencies:
#   - spades=3.13.0
RUN mkdir -p /conda-envs/ea5499fdfdd8dca765fb26a6669d13e3
COPY envs/spades.yaml /conda-envs/ea5499fdfdd8dca765fb26a6669d13e3/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/bd54b8bbb10dda998f3614f42f795afa --file /conda-envs/bd54b8bbb10dda998f3614f42f795afa/environment.yaml && \
    mamba env create --prefix /conda-envs/9750aee182b09ec066acfdcd6d2b8a0c --file /conda-envs/9750aee182b09ec066acfdcd6d2b8a0c/environment.yaml && \
    mamba env create --prefix /conda-envs/ea5499fdfdd8dca765fb26a6669d13e3 --file /conda-envs/ea5499fdfdd8dca765fb26a6669d13e3/environment.yaml && \
    mamba clean --all -y
