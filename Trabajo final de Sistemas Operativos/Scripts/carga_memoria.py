import time

# --- EL CÓDIGO DE CARGAR MEMORIA CON LÍMITE ---
data = []
limite = 50  # Se detiene automáticamente al acumular 40 MB
peso=1024*1024*2

while len(data) < limite:
    data.append("AB" * peso)

    print(f"Ocupado: {len(data)*4} MB")
    time.sleep(0.5)  # Tiempo de espera (medio segundo) para poder observar


# --- LIBERACIÓN DE DATOS AL FINAL ---
print("¡Límite alcanzado! Liberando memoria...")
data.clear()
print("Sistema limpio.")
