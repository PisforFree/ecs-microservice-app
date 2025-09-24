# Dockerfile (root of repo)
FROM httpd:2.4-alpine

# Quiet AH00558 and make the server name explicit
RUN printf "ServerName localhost\n" >> /usr/local/apache2/conf/httpd.conf

# Copy the static site used for Day-3 verification
# Keep site/ at repo root so this path works:
COPY site/ /usr/local/apache2/htdocs/

EXPOSE 80
