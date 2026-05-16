---
layout: default
title: "Ejercicio 1"
parent: "Señal de Recompensa (Sección 4.1.3)"
grand_parent: "Capítulo 4: Computación Evolutiva y Aprendizaje Reforzado"
nav_order: 1
---

## Generador de Recompensas Estocásticas (MATLAB)

**Proyecto:** Simulador de Entorno Multi-Armed Bandit con Distribuciones Gaussianas  
**Objetivo general:** Simular un entorno estocástico mediante la generación de recompensas basadas en distribuciones normales, evaluando el impacto de la varianza y aplicando restricciones de no negatividad.

---

## Objetivos de la práctica
- Implementar una función en MATLAB que simule el comportamiento probabilístico de múltiples máquinas tragamonedas.
- Generar valores aleatorios continuos utilizando distribuciones normales definiendo medias y desviaciones estándar.
- Analizar el efecto de la varianza alta frente a la varianza baja en la consistencia de los retornos estocásticos.
- Aplicar funciones de truncamiento matemático para garantizar un límite inferior y evitar recompensas negativas.

---

## Descripción del ejercicio

En este ejercicio se implementa un modelo de simulación para generar recompensas aleatorias dentro de un entorno clásico de toma de decisiones conocido como **Multi-Armed Bandit**.

El modelo recibe como entrada el identificador numérico de una máquina (1, 2 o 3) y, utilizando una estructura condicional `switch`, define los parámetros estadísticos exactos para generar un retorno:

- **Asignación de Parámetros** → Cada máquina cuenta con una configuración específica de rendimiento esperado (media) y volatilidad (desviación estándar).
- **Generación Estocástica** → Se utiliza una función de distribución normal para calcular la recompensa final en cada iteración del sistema.

La clave del ejercicio es modelar correctamente la incertidumbre de un entorno de aprendizaje. Permite observar cómo opciones con un rendimiento promedio menor pueden ser más estables, mientras que opciones más lucrativas o intermedias pueden presentar una dispersión que dificulte su predicción inmediata.

---

### Rangos y Parámetros Estadísticos

| Máquina (Input) | Media (`mu`) | Desviación Est. (`sigma`) | Perfil de Recompensa |
| :--- | :--- | :--- | :--- |
| 1 | 1.0 | 0.5 | Baja y Estable |
| 2 | 2.0 | 0.5 | Alta y Estable |
| 3 | 1.5 | 1.5 | Moderada y Volátil |

---

### Proceso de Cálculo y Visualización

El algoritmo en MATLAB procesa la entrada recibida para ubicar el caso correspondiente y establecer las variables estadísticas. Posteriormente, ejecuta el siguiente flujo:

- Evalúa la función `normrnd(mu, sigma, 1, 1)` para extraer una única muestra aleatoria basada en la campana de Gauss de la máquina elegida.
- Aplica una corrección mediante `max(0, recompensa)`.

Esto último es vital para la simulación, ya que elimina matemáticamente cualquier valor que caiga por debajo de cero, acumulando esa probabilidad directamente en el eje de origen y asegurando que las recompensas representen ganancias o intentos nulos, pero nunca deudas.

---

## Código
```matlab
function recompensa = generarRecompensa(maquina)
% Genera una recompensa aleatoria basada en una distribución de
% probabilidad normal (gaussiana)
switch maquina
    case 1
        mu = 1.0;
        sigma = 0.5;
    case 2
        mu = 2.0;
        sigma = 0.5;
    case 3
        mu = 1.5;
        sigma = 1.5;
    otherwise
        error('Maquina no válida')
end

% Genera la recompensa
recompensa = normrnd(mu, sigma, 1, 1);

% Elimina valores negativos
recompensa = max(0, recompensa);

end
