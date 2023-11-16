ARG TAG=alpha
FROM smartgic/ovos-skill-base:${TAG}

ARG BUILD_DATE="13.11.2023"
ARG VERSION="1.0"

LABEL org.opencontainers.image.title="Open Voice OS OCI Rasa Skill image"
LABEL org.opencontainers.image.description="Integrate Rasa chatbot capabilities with Open Voice OS"
LABEL org.opencontainers.image.version=${VERSION}
LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.documentation="https://github.com/YourGithubRepo/rasa-skill"
LABEL org.opencontainers.image.source="https://github.com/OpenVoiceOS/ovos-docker"
LABEL org.opencontainers.image.vendor="Open Voice OS"

# Copy your requirements.txt file and install Python dependencies
COPY ./requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

# Copy your skill directory into the container
COPY ./rasa_skill /opt/mycroft/skills/rasa-skill

ENTRYPOINT ["ovos-skill-launcher", "rasa_skill.openvoiceos"]

