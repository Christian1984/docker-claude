FROM node:23-alpine

RUN apk add --no-cache bash curl

# Create non-root user first
RUN adduser -D -h /home/claude claude

# Install claude as the claude user
USER claude
RUN curl -fsSL https://claude.ai/install.sh | bash

ENV SHELL=/bin/bash
ENV PATH="/home/claude/.local/bin:${PATH}"

WORKDIR /srv
CMD ["claude", "--dangerously-skip-permissions"]