FROM ghcr.io/prefix-dev/pixi:0.33.0 AS env-builder
USER root

RUN pixi global install conda
ENV PATH=/root/.pixi/bin:${PATH}

RUN ls /root/.pixi/bin

RUN conda create -p /root/.pixi/envs/jupyter -y jupyter  # This environment is only needed to show that activate doesn't work.

FROM ubuntu:24.04
COPY --from=env-builder /root/.pixi /root/.pixi
ENV PATH=/root/.pixi/bin:${PATH}
ENV CONDA_ROOT_PREFIX=/root/.pixi
