FROM carla-prerequisites:latest

ARG GIT_BRANCH

USER carla
WORKDIR /home/carla

RUN cd /home/carla/ && \
  if [ -z ${GIT_BRANCH+x} ]; then git clone --depth 1 https://github.com/senfu/carla.git; \
  else git clone --depth 1 --branch $GIT_BRANCH https://github.com/senfu/carla.git; fi && \
  cd /home/carla/carla && \
  ./Update.sh && \
  make CarlaUE4Editor && \
  make PythonAPI && \
  make build.utils && \
  rm -rf /home/carla/carla/Dist

WORKDIR /home/carla/carla
