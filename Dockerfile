FROM ghcr.io/prefix-dev/pixi:0.33.0 AS env-builder
RUN pixi global install conda
ENV PATH=/root/.pixi/bin:${PATH}

RUN ls /root/.pixi/bin

RUN conda create -p /root/.pixi/envs/jupyter -y jupyter

FROM ubuntu:24.04
COPY --from=env-builder /root/.pixi /root/.pixi
ENV PATH=/root/.pixi/bin:${PATH}
