---------------------------------------------------------------------------------------------------------------------------------
-- JOINS BÁSICOS
---------------------------------------------------------------------------------------------------------------------------------

-- Nombres de distritos escolares y número de alumnos inscritos
SELECT "name","pupils" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id";


---------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAS CON VALORES EXTREMOS
---------------------------------------------------------------------------------------------------------------------------------

-- Distrito con el menor número de alumnos
SELECT "name" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "pupils" = (
    SELECT MIN("pupils") FROM "expenditures"
);


---------------------------------------------------------------------------------------------------------------------------------
-- ORDENAMIENTO Y TOP N
---------------------------------------------------------------------------------------------------------------------------------

-- Top 10 distritos públicos con mayor gasto por alumno
SELECT "name","per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "type" = 'Public School District'
ORDER BY "per_pupil_expenditure" DESC LIMIT 10;


--------------------------------------------------------------------------------------------------------------------------------
-- ANÁLISIS RELACIONAL
--------------------------------------------------------------------------------------------------------------------------------

-- Relación entre gasto por alumno y tasa de graduación
SELECT "name","per_pupil_expenditure","graduated" FROM "schools"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
JOIN "expenditures" ON "schools"."district_id" = "expenditures"."district_id"
ORDER BY "per_pupil_expenditure" DESC, "name" ASC;


--------------------------------------------------------------------------------------------------------------------------------
-- ANÁLISIS CON PROMEDIOS
--------------------------------------------------------------------------------------------------------------------------------

-- Distritos públicos con gasto por alumno y evaluación ejemplar por encima del promedio
SELECT "name","per_pupil_expenditure","exemplary" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE ("type" = 'Public School District' AND "per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"
)
AND "exemplary" > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
)
ORDER BY "exemplary" DESC , "per_pupil_expenditure" DESC;


--------------------------------------------------------------------------------------------------------------------------------
-- ANÁLISIS EXPLORATORIO
--------------------------------------------------------------------------------------------------------------------------------

-- Análisis de relación entre tasa de abandono escolar y evaluación insatisfactoria del distrito
-- Esta consulta busca obtener las 10 escuelas con mayor tasa de abandono,
-- junto con el porcentaje de abandono y la evaluación insatisfactoria del distrito

SELECT "name", "unsatisfactory" AS "District Unsatisfactory", "dropped" AS "School Dropped" FROM "schools"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "schools"."district_id"
JOIN "graduation_rates" ON "graduation_rates"."school_i
