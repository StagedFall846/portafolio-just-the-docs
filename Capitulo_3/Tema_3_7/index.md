---
layout: default
title: "3.7 Perceptrón"
parent: "Capítulo 3: Redes Neuronales Artificiales (ANN)"
has_children: true
nav_order: 7
---

# 3.7. El Perceptrón

El perceptrón es la red neuronal más básica y fundamental. Es una arquitectura de tipo supervisada y unidireccional, propuesta originalmente por **Frank Rosenblatt en 1957**. Se considera el algoritmo de aprendizaje más simple para la clasificación binaria de datos linealmente separables.

## Definición Matemática
Para el funcionamiento del perceptrón, se consideran los siguientes componentes:
* **Vector de entradas:** <span class="math">X = [x_1, x_2, \dots, x_n]</span>
* **Vector de pesos:** <span class="math">W = [w_1, w_2, \dots, w_n]</span>
* **Salida binaria:** <span class="math">y \in \{-1, +1\}</span>

### Función de Activación
La respuesta de la neurona depende de la **función signo**, la cual actúa como un limitador rígido:

<p align="center">
  <img src="{{ site.baseurl }}/Capitulo_3/Tema_3_7/H.png" alt="Definición de la función matemática H(v)" width="250px">
  <br>
  <em><b>Figura X:</b> Función H(v).</em>
</p>


<p align="center">
  <img src="Capitulo_3/Tema_3_7/FS.png" alt="Icono de la gráfica de la función signo" width="250px">
  <br>
  <em><b>Figura X:</b> Función signo.</em>
</p>


## Cálculo de la Salida
La salida del perceptrón se obtiene calculando la suma ponderada de todas las entradas y aplicando la función de activación sobre el resultado:

<p align="center">
  <img src="Capitulo_3/Tema_3_7/S.png" alt="Ecuación de la salida y aplicando la función signo a la sumatoria de pesos por entradas" width="250px">
  <br>
  <em><b>Figura X:</b> Ecuación de salida con función signo.</em>
</p>

---

### 🧠 Arquitectura Estructural
El siguiente diagrama muestra el flujo de información desde los nodos de entrada, pasando por la suma de pesos sinápticos, hasta llegar al nodo de salida:

<p align="center">
  <img src="Capitulo_3/Tema_3_7/P.png" alt="Diagrama de una neurona artificial mostrando nodos de entrada, pesos, sumatoria, función de activación y nodo de salida" width="350px">
  <br>
  <em><b>Figura X:</b> Modelo de una neurona artificial (perceptrón).</em>
</p>

---

> ### 💡 Nota Histórica
> Aunque el perceptrón de Rosenblatt fue un hito en la IA, su limitación principal es que solo puede resolver problemas **linealmente separables**. Esto significa que no puede resolver funciones lógicas complejas como la **XOR**, limitación que fue superada años después con la llegada del Perceptrón Multicapa (MLP).
