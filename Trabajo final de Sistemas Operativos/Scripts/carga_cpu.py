#!/usr/bin/env python3
"""
Script: carga_cpu.py
Descripción: Genera una carga de CPU suave y controlada para pruebas de monitoreo.
"""
import os
import sys
import time

# Duración de la prueba en segundos (por defecto 20s o pasado por argumento)
duracion = int(sys.argv[1]) if len(sys.argv) > 1 else 20
tiempo_fin = time.time() + duracion

print(f" Generando carga de CPU controlada...")
print(f" PID del proceso: {os.getpid()}")
print(f"  Duración: {duracion} segundos")
print(f" Abre 'top', 'htop' o 'pidstat -p {os.getpid()}' en otra terminal.\n")

# Bucle liviano de cálculo matemático para elevar el uso de CPU sin colgar el sistema
while time.time() < tiempo_fin:
    _ = 123456 * 654321

print("✅ Carga de CPU finalizada exitosamente.")
