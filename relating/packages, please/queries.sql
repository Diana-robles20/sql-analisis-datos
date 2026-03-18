-- *** La Carta Perdida ***
-- ¿En qué tipo de dirección terminó la carta perdida?: residential

-- Obtener el id de la dirección desde donde se envió el paquete (tabla addresses)
-- Obtener el id del paquete buscando con el id de la dirección anterior (tabla packages)
   -- Considerar que la persona de esa dirección pudo haber enviado varios paquetes, por lo que podemos tener varios package_id.
   -- Debemos filtrar por su contenido: "Congratulatory letter"
-- Obtener el id de la dirección donde el paquete fue escaneado, y donde la acción es "Drop"
-- Obtener el tipo de la dirección anterior

SELECT "type" FROM "addresses" WHERE "id" = (
  SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
      SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue')
      AND "contents" LIKE '%ongratulatory%'
  )
  ORDER BY "timestamp" DESC LIMIT 1
)

-- ¿En qué dirección terminó la carta perdida?: 2 Finnigan Street

-- Las mismas consultas anteriores pero cambiando "type" por "address" al inicio

SELECT "address" FROM "addresses" WHERE "id" = (
  SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
      SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue')
      AND "contents" LIKE '%ongratulatory'
  )
  ORDER BY "timestamp" DESC LIMIT 1
)

-- *** La Entrega Engañosa ***
-- ¿En qué tipo de dirección terminó la entrega engañosa?: Police Station
-- Para responder esto, encontrar el package_id donde from_address_id sea NULL, ya que el cliente reportó que no había dirección de origen
   -- Considerando que puede haber muchos paquetes sin "from_address_id", agregamos una restricción por contenido
-- Una vez encontrado el package_id, buscar el address_id en la tabla scans. Como resultado, obtenemos varios registros
   -- Considerando que la última acción no necesariamente es "Drop", obtenemos el último escaneo según el timestamp
-- Finalmente, buscar el tipo de dirección

SELECT "type" FROM "addresses" WHERE "id" = (
  SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL AND "contents" LIKE '%uck%')
    ORDER BY "timestamp" DESC LIMIT 1
  )

-- ¿Cuál era el contenido de la entrega engañosa?: Duck debugger

SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL AND "contents" LIKE '%uck%'

-- *** El Regalo Olvidado ***
-- ¿Cuál es el contenido del regalo olvidado?: Flowers
-- Considerar que no es suficiente buscar el contenido solo por "from_address_id", ya que esa persona pudo haber enviado otros paquetes,
-- por lo que también agregamos "to_address_id" para obtener un resultado único

SELECT "contents" FROM "packages" WHERE "from_address_id"=(
  SELECT "id" FROM "addresses" WHERE "address"='109 Tileston Street'
)
  AND "to_address_id"=(
    SELECT "id" FROM "addresses" WHERE "address"='728 Maple Place'
  )

-- ¿Quién tiene el regalo olvidado?:

SELECT "name" FROM "drivers" WHERE "id" = (
  SELECT "driver_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
      SELECT "id" FROM "addresses" WHERE "address"='109 Tileston Street'
    )
    AND "to_address_id" = (
      SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
    )
  )
  ORDER BY "timestamp" DESC LIMIT 1
)


