----------------------------------------------------------------------------------------------------------------------------
-- SUBCONSULTAS
----------------------------------------------------------------------------------------------------------------------------

-- Equipos en los que jugó Satchel Paige
SELECT "name" FROM "teams" WHERE "id" IN (
    SELECT "team_id" FROM "performances" WHERE "player_id" = (
        SELECT "id" FROM "players" 
        WHERE "first_name" = 'Satchel' AND "last_name" = 'Paige'
    )
);

-- IN: se utiliza cuando la subconsulta devuelve múltiples valores (team_id)


-----------------------------------------------------------------------------------------------------------------------------
-- AGREGACIONES Y GROUP BY
-----------------------------------------------------------------------------------------------------------------------------

-- Top 5 equipos con mayor número total de hits en 2001
SELECT "name", SUM("H") AS "Total Hits" FROM "teams"
JOIN "performances" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001 -- Necesario cuando una columna existe en múltiples tablas
GROUP BY "performances"."team_id"
ORDER BY "Total Hits" DESC
LIMIT 5;


----------------------------------------------------------------------------------------------------------------------------
-- SUBCONSULTAS ANIDADAS
----------------------------------------------------------------------------------------------------------------------------

-- Salario total en 2001 del jugador con más home runs ese año
SELECT SUM("salary") FROM "salaries" WHERE "player_id" = (
  SELECT "player_id" FROM (
    SELECT "player_id", SUM("HR") AS "Sum of HR in 2001" FROM "performances"
    WHERE "year" = 2001
    GROUP BY "player_id"
    ORDER BY "Sum of HR in 2001" DESC
    LIMIT 1
  )
)
AND "year" = 2001;

-- Lógica:
-- 1. Sumar todos los HR por jugador en 2001
-- 2. Identificar el jugador con más HR
-- 3. Sumar todos los salarios que recibió ese jugador en 2001


----------------------------------------------------------------------------------------------------------------------------
-- JOINS Y EFICIENCIA
----------------------------------------------------------------------------------------------------------------------------

-- Top 10 jugadores menos costosos por hit en 2001
SELECT "first_name","last_name", "salary"/"H" AS "Dollars per hit"
FROM "salaries" 
JOIN "players" ON "salaries"."player_id" = "players"."id"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"

-- No es necesario unir por team_id, ya que se asume que cada jugador tiene
-- un único salario y desempeño en 2001 (un solo equipo)

AND "performances"."year" = "salaries"."year"
WHERE "salaries"."year" = 2001 AND "H" > 0
ORDER BY "Dollars per hit" ASC , "first_name" ASC, "last_name" ASC
LIMIT 10;

