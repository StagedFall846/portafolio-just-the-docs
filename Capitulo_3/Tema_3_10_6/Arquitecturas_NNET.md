---
layout: default
title: "Comparativa de Arquitecturas NNET"
parent: "3.10.6 Implementación de la red"
grand_parent: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
nav_order: 1
---
# Comparativa de Arquitecturas NNET en Simulink

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
<p align="center">
  <img src="https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_3/Tema_3_10_6/redes_preentrenadas1.png?raw=true" width="90%" style="border: 2px solid #9673a6; border-radius: 10px;">
  <br><i>Diagrama general del sistema en Simulink</i>
</p>

<p align="center">
  <img src="https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_3/Tema_3_10_6/Function%20Fitting%20Neural%20Network.png?raw=true" width="90%" style="border: 2px solid #9673a6; border-radius: 10px;">
  <br><i>Arquitectura de la Red de Ajuste de Funciones (2 capas)</i>
</p>

<p align="center">
  <img src="https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_3/Tema_3_10_6/Feed-Forward%20Neural%20Network.png?raw=true" width="90%" style="border: 2px solid #9673a6; border-radius: 10px;">
  <br><i>Arquitectura de la Red Feed-Forward (3 capas)</i>
</p>

<p align="center">
  <img src="https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_3/Tema_3_10_6/Custom%20Neural%20Network.png?raw=true" width="90%" style="border: 2px solid #9673a6; border-radius: 10px;">
  <br><i>Arquitectura de la Red Neuronal Personalizada</i>
</p>


[Descargar.slx](https://github.com/StagedFall846/portafolio-just-the-docs/blob/main/Capitulo_3/Tema_3_10_6/redes_preentrenadas.slx){: .btn style="text-decoration: none; display: inline-block; background-color: #e1d5e7; color: #6a1b9a; border: 1px solid #9673a6;" }
