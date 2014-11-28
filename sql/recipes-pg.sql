/*

Database: recipes

DROP DATABASE recipes;

% createdb -E UTF8 -l ro_RO.UTF-8 -T template0 -O username -U postgres recipes

CREATE LANGUAGE plpgsql; # as super user

*/


CREATE TABLE categories (
    id_categ  SERIAL,
    categ     VARCHAR(150) NOT NULL,
    CONSTRAINT pk_categories_id_categ
               PRIMARY KEY (id_categ)
);


CREATE TABLE recipes (
    id_recipe SERIAL,
    title     VARCHAR(50) NOT NULL,
    descr     VARCHAR(150),
    id_categ  INTEGER,
    notes     TEXT,
    ingred    TEXT,
    prepar    TEXT,
    noedit    BOOLEAN,              -- reteta needitata
    tried     BOOLEAN,              -- reteta incercata
    CONSTRAINT pk_recipes_id_recipe
               PRIMARY KEY (id_recipe),
    CONSTRAINT fk_recipes_categ_id_categ
               FOREIGN KEY (id_categ)
                    REFERENCES categories (id_categ)
                        ON DELETE NO ACTION
                        ON UPDATE NO ACTION
);


CREATE TABLE ingredients (
    id_recipe INTEGER NOT NULL,
    id_ing    INTEGER NOT NULL,
    qty       VARCHAR(20),
    unit      VARCHAR(20),
    grup      VARCHAR(50),
    item      VARCHAR(100),
    CONSTRAINT pk_ingredients_id_ing
               PRIMARY KEY (id_recipe, id_ing),
    CONSTRAINT fk_ingredients_id_recipe
               FOREIGN KEY (id_recipe)
                    REFERENCES recipes (id_recipe)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE
);


CREATE TABLE directions (
    id_recipe INTEGER NOT NULL,
    id_step   INTEGER NOT NULL,
    grup      VARCHAR(50),
    step      TEXT,
    CONSTRAINT pk_directions_id_step
               PRIMARY KEY (id_recipe, id_step),
    CONSTRAINT fk_directions_id_recipe
               FOREIGN KEY (id_recipe)
                    REFERENCES recipes (id_recipe)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE
);


CREATE TABLE glossary (
    id_def      SERIAL,
    term        VARCHAR(100) NOT NULL,
    definition  TEXT,
    CONSTRAINT pk_glossary_id_def
               PRIMARY KEY (id_def)
);


CREATE OR REPLACE VIEW v_recipes (
    id_recipe
  , title
  , descr
  , id_categ, categ
  , notes
  , ingred
  , prepar
  , noedit
  , tried
)
AS
SELECT
    recipes.id_recipe
  , recipes.title
  , recipes.descr
  , recipes.id_categ, categories.categ
  , recipes.notes
  , recipes.ingred
  , recipes.prepar
  , CASE
        WHEN (recipes.noedit = 't')   THEN 1
        WHEN (recipes.noedit = 'f')   THEN 0
        WHEN (recipes.noedit IS NULL) THEN 0
    END AS noedit
  , CASE
        WHEN (recipes.tried = 't')   THEN 1
        WHEN (recipes.tried = 'f')   THEN 0
        WHEN (recipes.tried IS NULL) THEN 0
    END AS tried
FROM recipes
    LEFT OUTER JOIN categories ON recipes.id_categ = categories.id_categ;


CREATE OR REPLACE VIEW v_ingredients (
    id_recipe
  , id_ing
  , qty
  , unit
  , item
)
AS
SELECT
    ingredients.id_recipe
  , ingredients.id_ing
  , ingredients.qty
  , ingredients.unit
  , ingredients.item
FROM ingredients;

/*
 * Name: p_ingredients_id_ing, t_ingredients_id_ing
 * Table: ingredients
 * Trigger and procedure to insert id_ing only if not provided
 */

CREATE OR REPLACE FUNCTION p_ingredients_id_ing()
    RETURNS TRIGGER AS $BODY$
DECLARE
    v_id_ing INTEGER;
BEGIN
    IF NEW.id_ing IS NULL THEN

        SELECT INTO v_id_ing MAX(id_ing)
            FROM ingredients
            WHERE id_recipe = NEW.id_recipe;

        NEW.id_ing := v_id_ing + 1;

        IF v_id_ing IS NULL THEN
            v_id_ing = 0;
        END IF;
    END IF;

    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;
-- trigger
DROP TRIGGER IF EXISTS t_ingredients_id_ing ON ingredients;
CREATE TRIGGER t_ingredients_id_ing BEFORE INSERT ON ingredients
    FOR EACH ROW EXECUTE PROCEDURE p_ingredients_id_ing();
