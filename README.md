# SQL Portfolio: Querying, Relating & Designing

## Objetivo
Aplicar SQL para explorar, analizar y estructurar datos en bases relacionales.

---

## Estructura del portafolio

## Querying
Consultas sobre múltiples datasets:

### Cyberchase

Cyberchase es una serie animada educativa transmitida por el Public Broadcasting Service (PBS) desde 2002. Su objetivo es mostrar que las matemáticas están presentes en la vida cotidiana y que cualquier persona puede aprenderlas. A lo largo de los episodios, se abordan conceptos de matemáticas, ciencia y resolución de problemas.

En este proyecto se analiza la base de datos (`cyberchase.db`) que contiene información de los episodios en la tabla `episodes`.

#### Estructura de la tabla `episodes`

- `id`: identificador único de cada episodio  
- `season`: número de temporada en la que se emitió el episodio  
- `episode_in_season`: número del episodio dentro de su temporada  
- `title`: título del episodio  
- `topic`: tema o concepto que el episodio busca enseñar  
- `air_date`: fecha de emisión del episodio (formato YYYY-MM-DD)  
- `production_code`: identificador único utilizado internamente por PBS para cada episodio  

### Players

El béisbol es un deporte en el que dos equipos de 9 jugadores se turnan para batear y defender. El objetivo es anotar carreras (“runs”) al recorrer todas las bases antes de ser eliminado por el equipo contrario. Es especialmente popular en Estados Unidos y Canadá, donde la Major League Baseball (MLB) ha sido la principal liga profesional desde 1876.

En este proyecto se utiliza una base de datos (`players.db`) con información de jugadores de la MLB que han participado entre 1871 y 2023. La tabla `players` contiene datos históricos y físicos de los jugadores.

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

## Habilidades demostradas

- Filtrado de datos (WHERE)
- Búsqueda con patrones (LIKE)
- Manejo de fechas
- Ordenamiento (ORDER BY)
- Agregaciones (COUNT, DISTINCT, AVG)
- Análisis estructurado de datos

---

## Relating

En esta sección se trabaja con relaciones entre tablas para resolver problemas más complejos mediante SQL.

### Contexto

Se simula un sistema de entrega de correo en la ciudad de Boston. Como responsable del seguimiento de paquetes, el objetivo es investigar casos de paquetes perdidos reportados por clientes.

Para cada caso, se busca determinar:
- La ubicación actual del paquete
- El tipo de ubicación (residencial, negocio, etc.)
- El contenido del paquete

La información disponible es limitada, por lo que es necesario analizar la base de datos (`packages.db`) que contiene registros del tránsito de paquetes en la ciudad.

### Enfoque

Para resolver los casos, se utilizan consultas SQL que relacionan múltiples tablas mediante:
- JOINs 
- Claves primarias y foráneas
- Filtros combinados
- Subconsultas

---
### Habilidades demostradas

- Análisis relacional de datos  
- Uso de JOINs para combinar información  
- Resolución de problemas a partir de datos incompletos  
- Pensamiento lógico aplicado a bases de datos  
---

## Datasets

Bases de datos proporcionadas por curso de Harvard (CS50 Introduction to Databases with SQL).

---

## Cómo usar este proyecto

```bash
sqlite3 (nombre de la base de datos).db
.read queries.sql
