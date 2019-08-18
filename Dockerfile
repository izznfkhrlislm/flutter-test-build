FROM runmymind/docker-android-sdk

ENV FLUTTER_CHANNEL=stable
ENV FLUTTER_VERSION=1.7.8+hotfix.4-${FLUTTER_CHANNEL}

RUN wget --quiet --output-document=flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_v${FLUTTER_VERSION}.tar.xz \
    && tar xf flutter.tar.xz -C / \
    && rm flutter.tar.xz

RUN apt-get update && apt-get install -y lcov

ENV PATH=$PATH:/flutter/bin

RUN flutter doctor -v
