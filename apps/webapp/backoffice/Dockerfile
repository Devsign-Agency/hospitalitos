FROM kaad/base:latest as builder

WORKDIR /app

COPY . ./

RUN npx nx build webapp-backoffice


FROM nginx:alpine

ARG PORT=80
ENV PORT $PORT

# Copy the build output to replace the default nginx contents.
COPY --from=builder /app/dist/apps/webapp/backoffice /usr/share/nginx/html/
COPY --from=builder /app/apps/webapp/backoffice/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE $PORT
