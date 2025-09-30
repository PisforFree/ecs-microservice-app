# Use Debian-based Apache (smaller: bookworm-slim also works)
FROM public.ecr.aws/docker/library/httpd:2.4

# Install curl for the health check (bookworm images don't include it by default)
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl \
 && rm -rf /var/lib/apt/lists/*

# Copy your site content
COPY site/ /usr/local/apache2/htdocs/

# Simple healthcheck hitting "/"
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD curl -fsS http://localhost/ || exit 1

EXPOSE 80
