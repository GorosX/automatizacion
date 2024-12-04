#!/bin/bash

# Solicitar al usuario los directorios de origen y destino
read -p "Ingrese el directorio que desea respaldar (por defecto: /home/usuarios/documentos): " BACKUP_DIR
BACKUP_DIR=${BACKUP_DIR:-/home/usuarios/documentos}

read -p "Ingrese el directorio donde desea guardar las copias de seguridad (por defecto: /home/usuario/backups): " DEST_DIR
DEST_DIR=${DEST_DIR:-/home/usuario/backups}

# Fecha actual
DATE=$(date +%Y-%m-%d)

# Crear el directorio de backups si no existe
mkdir -p "$DEST_DIR"

# Realizar la copia de seguridad
tar -czf "$DEST_DIR/backup-$DATE.tar.gz" "$BACKUP_DIR"

# Mensaje de éxito
echo "Copia de seguridad creada: $DEST_DIR/backup-$DATE.tar.gz" | tee -a /var/log/backup.log
