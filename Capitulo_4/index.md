---
layout: default
title: "Capítulo 4: Algoritmos Evolutivos"
has_children: true
nav_order: 5
---


#  Capitulo 4: Aprendizaje por Refuerzo (RL)

Esta sección expande el panorama de la inteligencia artificial hacia el control interactivo: cómo un agente autónomo aprende a tomar decisiones óptimas en un entorno desconocido a base de prueba, error y recompensas (*Model-Free learning*).

## 1. Estimación de Valor: ¿Cómo aprende el agente?

Antes de tomar decisiones informadas, el agente debe aprender a evaluar matemáticamente qué tan "bueno" es encontrarse en un estado particular <span class="math">V(s)</span>.

* **Monte Carlo (MC):** El agente aprende en retrospectiva. Obliga a jugar un episodio completo hasta el final para sumar la recompensa total y, solo entonces, actualizar sus valores. Es lento y no es aplicable a tareas infinitas o continuas.
* **Diferencia Temporal - TD(0):** El agente aprende sobre la marcha (*Bootstrapping*). Actualiza su estimación paso a paso utilizando la recompensa inmediata observada más su propia predicción del siguiente estado.

## 2. Parámetros de Comportamiento

* **Tasa de Aprendizaje (<span class="math">\alpha</span>):** Regula la velocidad a la que el agente actualiza su conocimiento. Un valor bajo pondera el error gradualmente garantizando estabilidad; un valor alto genera un aprendizaje inestable y sensible al ruido.
* **Factor de Descuento (<span class="math">\gamma</span>):** Define el horizonte de planificación del agente. Si <span class="math">\gamma = 0</span>, el agente es "miope" y solo busca la gratificación instantánea. Si <span class="math">\gamma \to 1</span>, el agente es estratega y sacrifica el presente por mayores recompensas futuras.

## 3. Del Valor a la Acción: SARSA vs. Q-Learning

Para controlar físicamente un sistema, evaluar el estado no basta; el agente necesita aprender la función Valor-Acción <span class="math">Q(s,a)</span> (qué tan bueno es ejecutar una acción <span class="math">a</span> específica en un estado <span class="math">s</span>).

* **SARSA (On-Policy / El enfoque cauteloso):** El agente actualiza sus valores evaluando la acción que realmente va a tomar a continuación, incluyendo sus propios errores de exploración. Ante un peligro (ej. un acantilado), aprenderá a dar un rodeo seguro para no caerse por accidente.
* **Q-Learning (Off-Policy / El enfoque agresivo):** El agente actualiza sus valores asumiendo que en el futuro siempre tomará la decisión perfecta (el valor máximo posible), ignorando que actualmente sigue explorando y cometiendo errores. Buscará la ruta óptima y más rápida, aunque camine peligrosamente al borde del abismo.

## 4. Escalabilidad: Deep Q-Learning (DQN)

* **El Límite Tabular:** Guardar valores <span class="math">Q</span> en una matriz (*Q-Table*) es imposible en sistemas físicos reales con estados continuos (ej. ángulos infinitos en un motor o millones de píxeles en una cámara).
* **La Solución Neuronal:** DQN sustituye la tabla tradicional por una Red Neuronal Artificial <span class="math">Q(s,a;w)</span>. El estado físico entra a la red, y esta predice los valores de las acciones en la salida, ajustando sus pesos <span class="math">w</span> para minimizar el error respecto a la ecuación de Bellman.

---

> ### ⚙️ Caso Práctico (Péndulo Invertido)
> En el control físico, el diseño de la red lo es todo. Faltar de "profundidad" (pocas capas) causa amnesia y oscilaciones erráticas. Asimismo, limitar al agente a acciones binarias (fuerza máxima a la izquierda o derecha) genera un control violento (*Bang-Bang*); discretizar finamente el espacio de acción es vital para lograr movimientos mecánicos suaves y precisos.
