---
layout: default
title: "4.5 Algoritmo Evolutivo (Rastrigin 2D)"
parent: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 2
---

# Límite Superior de Confianza (UCB)

Esta sección introduce el método UCB (*Upper Confidence Bound*), una estrategia matemática mucho más inteligente e intencional para resolver el dilema de Exploración vs. Explotación, superando las limitaciones de la aleatoriedad ciega del método $\epsilon$-greedy.

## 1. El Concepto Central (La Puntuación de Confianza)

En lugar de explorar al azar, UCB calcula un puntaje para cada acción (o "brazo") sumando dos cosas: lo que ya sabemos que funciona (Explotación) más un "bono de curiosidad" o incertidumbre (Exploración). El algoritmo siempre elige la acción con el puntaje total más alto.

## 2. La Ecuación Desglosada

La fórmula rectora de esta estrategia es:

$$A_t = \arg\max_a \left[ Q_t(a) + c \sqrt{\frac{\ln t}{N_t(a)}} \right]$$

* **$Q_t(a)$ (El lado de Explotación):** Es la recompensa promedio que ha dado esa acción hasta ahora. Recompensa a las acciones que han demostrado ser buenas.
* **La Raíz Cuadrada (El lado de Exploración):** Funciona como el bono de incertidumbre, compuesto por:
  * **$N_t(a)$ (Conteo):** Está en el denominador. Si una acción se ha probado muy pocas veces, este número es pequeño, lo que hace que el bono de exploración se dispare (el algoritmo siente "curiosidad" por lo desconocido). Si se ha probado mucho, el bono se encoge.
  * **$\ln t$ (Tiempo total):** Está en el numerador. A medida que pasa el tiempo general, el logaritmo crece lentamente, asegurando que ninguna acción sea ignorada para siempre, incluso si falló al principio.
* **El Hiperparámetro Clave ($c$):** Es el coeficiente de exploración definido por el diseñador. Un $c$ alto fuerza al agente a probar casi todas las opciones repetidamente antes de decidirse; un $c$ bajo hace que el agente confíe rápidamente en la mejor opción encontrada.

---

> ### ⚖️ Ventajas vs. Desventajas
> Su gran **ventaja** es que se adapta dinámicamente y converge más rápido a la opción óptima porque su exploración es sistemática, no aleatoria. Su **desventaja** es la sensibilidad matemática: elegir un mal valor para el coeficiente $c$ puede arruinar el balance del aprendizaje.

Para que este concepto quede completamente claro antes de pasar a la programación de los ejercicios, he generado un simulador interactivo donde puedes poner a prueba la ecuación de UCB en tiempo real:
