---
layout: default
title: "1.2 Control Convencional e Inteligente"
parent: "Capítulo 1: Redes Neuronales"
has_children: true
nav_order: 4
---

# Control Convencional vs. Control Inteligente

Esta sección define los criterios de selección entre metodologías clásicas y modernas para el control de plantas físicas, destacando que ninguna reemplaza a la otra, sino que se aplican según el nivel de incertidumbre del sistema.

## Control Convencional (Precisión Analítica)
* **Cuándo usarlo:** Cuando el sistema es lineal (o linealizable) y se cuenta con un modelo matemático exacto.
* **Ventaja principal:** Ofrece garantías teóricas de estabilidad matemática (mediante criterios como Lyapunov o Nyquist) y sus parámetros son totalmente interpretables. El controlador PID es su mayor exponente.

## Control Inteligente (Adaptabilidad)
* **Cuándo usarlo:** Cuando el sistema es altamente complejo, no lineal, o presenta ruido e incertidumbre que impiden modelarlo físicamente.
* **Ventaja principal:** Permite manejar imprecisiones y adaptarse en tiempo real utilizando herramientas como lógica difusa, redes neuronales o algoritmos genéticos a partir de datos experimentales.

---

> ### 🔍 Punto Crítico de Validación
> A diferencia del control convencional que se comprueba con ecuaciones, la robustez del control inteligente (caja negra/gris) debe validarse estadísticamente mediante simulaciones masivas y experimentación (ej. Método de Monte Carlo) para garantizar su confiabilidad en la industria.
