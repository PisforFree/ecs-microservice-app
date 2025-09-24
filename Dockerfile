# Apache on Alpine (keep the alpine variant)
FROM httpd:2.4-alpine3.22

# Patch libexpat (fixes the Trivy finding) and keep image small
RUN apk update \
 && apk upgrade --no-cache expat \
 && rm -rf /var/cache/apk/*

# Copy your site content into Apache’s web root
# (Assumes your repo has: app/ or site/ with index.html. Adjust the left path if needed.)
COPY site/ /usr/local/apache2/htdocs/

# Optional: simple container-level healthcheck hitting "/"
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -q -O - http://localhost/ || exit 1

# Expose port 80 (the base image already runs httpd in foreground)
EXPOSE 80
