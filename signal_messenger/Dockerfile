ARG BUILD_FROM
# hadolint ignore=DL3006
FROM bbernhard/signal-cli-rest-api:0.100

COPY options.sh /options.sh

RUN ["chmod", "+x", "/options.sh"]

RUN apt-get clean \
        && apt-get update \
        && apt-get install -y --no-install-recommends jq

ENTRYPOINT ["/options.sh"]

VOLUME ["/config"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Signal Messenger" \
    io.hass.description="Signal Messenger" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    maintainer="Megaterion" \
    org.label-schema.description="Signal Messenger" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.name="Signal Messenger" \
    org.label-schema.schema-version="${BUILD_VERSION}" \
    org.label-schema.url="https://github.com/megaterion/ha_addons" \
    org.label-schema.usage="https://github.com/megaterion/ha_addons" \
    org.label-schema.vcs-ref="${BUILD_REF}" \
    org.label-schema.vcs-url="https://github.com/megaterion/ha_addons" \
    org.label-schema.vendor="Megaterion"
