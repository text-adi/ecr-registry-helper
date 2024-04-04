ARG BASE_IMAGE

# hadolint ignore=DL3006
FROM $BASE_IMAGE as builder

COPY --chown=root:root --chmod=700 entrypoint /

FROM builder as local

LABEL version="2"
LABEL repository="https://github.com/text-adi/aws-kubectl"
LABEL homepage="https://github.com/text-adi"
LABEL maintainer="text-adi <text-adi@github.com>"

ENTRYPOINT ["sh","/docker-entrypoint.sh"]