FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache wget unzip

# Télécharger le binaire PocketBase (dernière version stable)
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.14/pocketbase_0.22.14_linux_amd64.zip \
    -O pb.zip && \
    unzip pb.zip && \
    rm pb.zip

# Créer le volume pour les données persistantes
VOLUME /app/pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]