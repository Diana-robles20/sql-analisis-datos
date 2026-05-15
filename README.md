# SQL Portfolio: Querying, Relating & Designing

## Objetivo
Aplicar SQL para explorar, analizar y estructurar datos en bases relacionales.

---

## Estructura del portafolio

## Querying
Consultas sobre múltiples datasets:

### Players

En este proyecto se utiliza una base de datos (`players.db`) con información de jugadores de la MLB (Major League Baseball) que han participado entre 1871 y 2023. La tabla `players` contiene datos históricos y físicos de los jugadores.

#### Estructura de la tabla `players`

- `id`: identificador único del jugador  
- `first_name`: nombre  
- `last_name`: apellido  
- `bats`: lado de bateo (R = derecha, L = izquierda)  
- `throws`: mano con la que lanza (R = derecha, L = izquierda)  
- `weight`: peso en libras  
- `height`: altura en pulgadas  
- `debut`: fecha en la que el jugador comenzó su carrera en MLB (YYYY-MM-DD)  
- `final_game`: fecha del último juego (YYYY-MM-DD)  
- `birth_year`: año de nacimiento  
- `birth_month`: mes de nacimiento  
- `birth_day`: día de nacimiento  
- `birth_city`: ciudad de nacimiento  
- `birth_state`: estado de nacimiento  
- `birth_country`: país de nacimiento  

---

### Habilidades demostradas

- Filtrado de datos (WHERE)
- Búsqueda con patrones (LIKE)
- Manejo de fechas
- Ordenamiento (ORDER BY)
- Agregaciones (COUNT, DISTINCT, AVG)
- Análisis estructurado de datos

---

## Relating

En esta sección se trabaja con relaciones entre tablas para resolver problemas más complejos mediante SQL.

---

### Moneyball

Este dataset contiene información sobre jugadores, equipos, desempeño y salarios en la MLB, permitiendo analizar la relación entre rendimiento deportivo y costo económico.

---

### Estructura de la base de datos

#### players
Contiene información básica de los jugadores.
- `id`: identificador del jugador  
- `first_name`: nombre  
- `last_name`: apellido  

---

#### teams
Información de los equipos.
- `id`: identificador del equipo  
- `name`: nombre del equipo  

---

#### performances
Registra el desempeño de los jugadores por equipo y año.
- `player_id`: jugador  
- `team_id`: equipo  
- `year`: año  
- `H`: número de hits  
- `HR`: número de home runs  

---

#### salaries
Información de salarios de los jugadores.
- `player_id`: jugador  
- `team_id`: equipo  
- `year`: año  
- `salary`: salario en dólares  

---

### Relaciones clave

- Un **jugador** genera múltiples **performances**  
- Cada **performance** está asociada a un **equipo**  
- Un **jugador** puede recibir múltiples **salarios** dependiendo del equipo y año  
- Los **equipos** pagan salarios a los jugadores  

---

### Habilidades demostradas

- Uso de SQL para análisis de datos relacionales, integrando información de múltiples tablas mediante JOINs y subconsultas  
- Capacidad para resolver problemas del mundo real a partir de datos (seguimiento de paquetes, análisis educativo y deportivo)  
- Aplicación de funciones de agregación y análisis por grupos (AVG, SUM, COUNT, GROUP BY, HAVING)  
- Uso de lógica analítica y secuencial para construir soluciones paso a paso  
- Manejo de datos incompletos o ambiguos mediante filtros y condiciones adecuadas  
- Desarrollo de métricas e indicadores para evaluar desempeño (ej. eficiencia, promedios, comparaciones)  
- Comprensión de modelos relacionales y relaciones entre entidades   

---

## Datasets

Bases de datos proporcionadas por curso de Harvard (CS50 Introduction to Databases with SQL).

---

## Cómo usar este proyecto

```bash
sqlite3 (nombre de la base de datos).db
.read queries.sql
