## Comparativa de Arquitecturas NNET en Simulink

**Proyecto:** Aproximación de una Función No Lineal para Cinemática Inversa utilizando Redes Neuronales
**Objetivo general:** Comparar el desempeño de tres arquitecturas de redes neuronales en Simulink para aproximar una función no lineal y evaluar su precisión en la cinemática inversa de un robot 2GDL.


---

## Objetivo de la práctica
- Comparar tres arquitecturas de redes neuronales en Simulink para la aproximación de una función no lineal.
- Evaluar la precisión de cada arquitectura en la cinemática inversa de un robot de 2 GDL, mapeando coordenadas angulares a espaciales.
- Determinar cuál arquitectura minimiza el error cuadrático medio (MSE) en el proceso de predicción.

---

## Descripción del ejercicio

Este ejercicio consiste en comparar tres arquitecturas de redes neuronales (ANN) en Simulink para resolver un problema de aproximación de una función no lineal, en el contexto de la **cinemática inversa** de un robot de 2 grados de libertad (2 GDL). El objetivo es mapear las coordenadas angulares (\( \theta_1 \), \( \theta_2 \)) a coordenadas espaciales (X, Y) en el espacio de trabajo del robot.

### Arquitecturas de redes neuronales utilizadas

Se utilizan tres configuraciones de redes neuronales:

1. **Función de ajuste de red neuronal (2 capas)**:  
   Red con una capa oculta y una capa de salida.

2. **Red neuronal Feed-Forward (3 capas)**:  
   Red con dos capas ocultas para capturar no linealidades más complejas.

3. **Red neuronal personalizada (3 capas)**:  
   Similar a la anterior, pero con configuraciones de activación personalizadas y posibilidad de variar el número de neuronas por capa.

---

## Imagenes 



<a href="redes_preentrenadas.m" class="btn" style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;">
   Descargar redes_preentrenadas.m
</a>
