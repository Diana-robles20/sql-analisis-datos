-- *** The Lost Letter ***
-- At what type of address did the Lost Letter end up?: residential

-- Get the address id where the package was sent from (addresses table)
-- Get the package id by searching for the previous address id (packages table)
   -- Consider that the person from the address id might have sent many packages, so we might have many packages id's.
   -- We should filter out by its content: "Congratulatory letter"
-- Get the address id, where the package was scanned , and the action is "Drop"
-- Get the type of the previous address

SELECT "type" FROM "addresses" WHERE "id" = (
  SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
      SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue')
      AND "contents" LIKE '%ongratulatory%'
  )
  ORDER BY "timestamp" DESC LIMIT 1
)

-- At what address did the Lost Letter end up?: 2 Finnigan Street

-- The same previous queries but changing "type" to "address" at the beggining

SELECT "address" FROM "addresses" WHERE "id" = (
  SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
      SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue')
      AND "contents" LIKE '%ongratulatory'
  )
  ORDER BY "timestamp" DESC LIMIT 1
)

-- *** The Devious Delivery ***
-- At what type of address did the Devious Delivery end up?: Police Station
-- To answer this, find the package_id where from_address_id is null since the client reported that there was not a "From" address
   -- Considering that there could be many packages with "from_address_id" missing, we add a content restriction
-- Once the package_id is found, search for the address_id in the scans table. As a result, we get many scans
   -- Considering that the last action doesn´t necessarilly need to be "Drop", we get the last scanned given by timestamp
-- Finally, search for the type of address

SELECT "type" FROM "addresses" WHERE "id" = (
  SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL AND "contents" LIKE '%uck%')
    ORDER BY "timestamp" DESC LIMIT 1
  )

-- What were the contents of the Devious Delivery?: Duck debugger

SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL AND "contents" LIKE '%uck%'

-- *** The Forgotten Gift ***
-- What are the contents of the Forgotten Gift?: Flowers
-- Consider that is not enough to search for the contents just by the "from_address_id" since that person might have sent many other packages,
-- so we also add the "to_address_id" in order to get a unique answer

SELECT "contents" FROM "packages" WHERE "from_address_id"=(
  SELECT "id" FROM "addresses" WHERE "address"='109 Tileston Street'
)
  AND "to_address_id"=(
    SELECT "id" FROM "addresses" WHERE "address"='728 Maple Place'
  )

-- Who has the Forgotten Gift?:

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


CHATGPT TRADUCCION 

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

