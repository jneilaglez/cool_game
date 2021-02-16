FROM alpine:3
USER root

RUN apk update && \
      apk add --no-cache cmake g++ make git

ENV COOLGAME_PATH /tmp/cool_game

COPY ${PWD} ${COOLGAME_PATH}

RUN if [ ! -d "${COOLGAME_PATH}/build" ] ; then mkdir ${COOLGAME_PATH}/build ; fi
RUN if [ ! -d "${COOLGAME_PATH}/test/lib" ] ; then mkdir ${COOLGAME_PATH}/test/lib && \
      git clone https://github.com/google/googletest.git ${COOLGAME_PATH}/test/lib/googletest ; fi

WORKDIR ${COOLGAME_PATH}
