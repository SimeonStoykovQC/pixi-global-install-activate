FROM ghcr.io/mamba-org/micromamba:2.0.2 AS env-builder
USER root

RUN micromamba install -n base conda
ENV PATH=/opt/conda/bin:${PATH}

RUN micromamba create -p /opt/conda/envs/jupyter -y jupyter  # This environment is only needed to show that activate doesn't work.

FROM ubuntu:24.04
COPY --from=env-builder /opt/conda /opt/conda
ENV PATH=/opt/conda/bin:${PATH}
ENV CONDA_ROOT_PREFIX=/opt/conda
