#!/bin/bash

# Script de Monitoreo Básico con Colores para Sistemas Operativos
# Proyecto Final - UNFV

# Definición de Colores ANSI
VERDE='\033[0;32m'
AZUL='\033[0;34m'
CIAN='\033[0;36m'
AMARILLO='\033[1;33m'
ROJO='\033[0;31m'
NC='\033[0m' # Sin Color (Reset)

echo -e "${AZUL}=============================================${NC}"
echo -e "${CIAN}        REPORTE DE ESTADO DEL SISTEMA        ${NC}"
echo -e "${AZUL}=============================================${NC}"
echo -e "${VERDE}Fecha y hora:${NC} $(date)"
echo -e "${VERDE}Host:${NC}       $(hostname)"
echo -e "${VERDE}Kernel:${NC}     $(uname -r)"
echo -e "${VERDE}Uptime:${NC}     $(uptime -p)"
echo -e "${AZUL}---------------------------------------------${NC}"

echo -e "\n${AMARILLO}1. USO DE CPU Y MEMORIA RAM:${NC}"
free -h

echo -e "\n${AMARILLO}2. USO DE DISCO Y ESPACIO:${NC}"
df -h /

echo -e "\n${AMARILLO}3. TOP 5 PROCESOS POR CONSUMO DE CPU:${NC}"
ps aux --sort=-%cpu | head -n 6 | awk '{print $1, $2, $3, $4, $11}'

echo -e "\n${AMARILLO}4. TOP 5 PROCESOS POR CONSUMO DE MEMORIA:${NC}"
ps aux --sort=-%mem | head -n 6 | awk '{print $1, $2, $3, $4, $11}'

echo -e "\n${AMARILLO}5. PUERTOS Y CONEXIONES ABIERTAS (SS):${NC}"
sudo ss -tulnp

echo -e "\n${AMARILLO}6. ESTADO DE CONTENEDORES (DOCKER):${NC}"
if command -v docker &> /dev/null; then
    # Se usa sudo para garantizar el acceso al socket de Docker si el usuario no tiene permisos directos
    sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
else
    echo -e "${ROJO}Docker no está instalado o no está ejecutándose.${NC}"
fi

echo -e "\n${AZUL}=============================================${NC}"