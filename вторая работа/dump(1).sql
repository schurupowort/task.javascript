/*
 Navicat Premium Data Transfer

 Source Server         : localhost PostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 150001 (150001)
 Source Host           : localhost:5432
 Source Catalog        : films
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150001 (150001)
 File Encoding         : 65001

 Date: 17/03/2023 21:46:45
*/


-- ----------------------------
-- Sequence structure for Person_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Person_id_seq";
CREATE SEQUENCE "public"."Person_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."Person_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for country_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."country_id_seq";
CREATE SEQUENCE "public"."country_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."country_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for film_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."film_id_seq";
CREATE SEQUENCE "public"."film_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."film_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for genre_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."genre_id_seq";
CREATE SEQUENCE "public"."genre_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."genre_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_id_seq";
CREATE SEQUENCE "public"."role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."role_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS "public"."country";
CREATE TABLE "public"."country" (
  "id" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."country" OWNER TO "postgres";

-- ----------------------------
-- Records of country
-- ----------------------------
BEGIN;
INSERT INTO "public"."country" ("id", "name") OVERRIDING SYSTEM VALUE VALUES (1, 'Россия');
COMMIT;

-- ----------------------------
-- Table structure for film
-- ----------------------------
DROP TABLE IF EXISTS "public"."film";
CREATE TABLE "public"."film" (
  "id" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."film" OWNER TO "postgres";

-- ----------------------------
-- Records of film
-- ----------------------------
BEGIN;
INSERT INTO "public"."film" ("id", "name") OVERRIDING SYSTEM VALUE VALUES (1, 'Титаник');
COMMIT;

-- ----------------------------
-- Table structure for filmcountry
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmcountry";
CREATE TABLE "public"."filmcountry" (
  "film_id" int8 NOT NULL,
  "country_id" int8 NOT NULL,
  "amount" int8 DEFAULT 0
)
;
ALTER TABLE "public"."filmcountry" OWNER TO "postgres";

-- ----------------------------
-- Records of filmcountry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for filmpersons
-- ----------------------------
DROP TABLE IF EXISTS "public"."filmpersons";
CREATE TABLE "public"."filmpersons" (
  "film_id" int8 NOT NULL,
  "person_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
ALTER TABLE "public"."filmpersons" OWNER TO "postgres";

-- ----------------------------
-- Records of filmpersons
-- ----------------------------
BEGIN;
INSERT INTO "public"."filmpersons" ("film_id", "person_id", "role_id") VALUES (1, 1, 1);
INSERT INTO "public"."filmpersons" ("film_id", "person_id", "role_id") VALUES (1, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS "public"."genre";
CREATE TABLE "public"."genre" (
  "id" int4 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."genre" OWNER TO "postgres";

-- ----------------------------
-- Records of genre
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS "public"."person";
CREATE TABLE "public"."person" (
  "id" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "firstname" varchar(255) COLLATE "pg_catalog"."default",
  "surname" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."person" OWNER TO "postgres";

-- ----------------------------
-- Records of person
-- ----------------------------
BEGIN;
INSERT INTO "public"."person" ("id", "username", "firstname", "surname") OVERRIDING SYSTEM VALUE VALUES (1, 'germanklein', 'german', 'klein');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "public"."role";
CREATE TABLE "public"."role" (
  "id" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."role" OWNER TO "postgres";

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO "public"."role" ("id", "name") OVERRIDING SYSTEM VALUE VALUES (1, 'Главная роль');
INSERT INTO "public"."role" ("id", "name") OVERRIDING SYSTEM VALUE VALUES (2, 'Каскадер');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Person_id_seq"
OWNED BY "public"."person"."id";
SELECT setval('"public"."Person_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."country_id_seq"
OWNED BY "public"."country"."id";
SELECT setval('"public"."country_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."film_id_seq"
OWNED BY "public"."film"."id";
SELECT setval('"public"."film_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."genre_id_seq"
OWNED BY "public"."genre"."id";
SELECT setval('"public"."genre_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_id_seq"
OWNED BY "public"."role"."id";
SELECT setval('"public"."role_id_seq"', 2, true);

-- ----------------------------
-- Auto increment value for country
-- ----------------------------
SELECT setval('"public"."country_id_seq"', 1, true);

-- ----------------------------
-- Uniques structure for table country
-- ----------------------------
ALTER TABLE "public"."country" ADD CONSTRAINT "name_unique" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table country
-- ----------------------------
ALTER TABLE "public"."country" ADD CONSTRAINT "country_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Auto increment value for film
-- ----------------------------
SELECT setval('"public"."film_id_seq"', 1, true);

-- ----------------------------
-- Primary Key structure for table film
-- ----------------------------
ALTER TABLE "public"."film" ADD CONSTRAINT "film_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table filmcountry
-- ----------------------------
ALTER TABLE "public"."filmcountry" ADD CONSTRAINT "filmcountry_pkey" PRIMARY KEY ("film_id", "country_id");

-- ----------------------------
-- Primary Key structure for table filmpersons
-- ----------------------------
ALTER TABLE "public"."filmpersons" ADD CONSTRAINT "filmpersons_pkey" PRIMARY KEY ("film_id", "person_id", "role_id");

-- ----------------------------
-- Auto increment value for genre
-- ----------------------------
SELECT setval('"public"."genre_id_seq"', 1, false);

-- ----------------------------
-- Uniques structure for table genre
-- ----------------------------
ALTER TABLE "public"."genre" ADD CONSTRAINT "genre_name_unique" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table genre
-- ----------------------------
ALTER TABLE "public"."genre" ADD CONSTRAINT "genre_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Auto increment value for person
-- ----------------------------
SELECT setval('"public"."Person_id_seq"', 1, true);

-- ----------------------------
-- Uniques structure for table person
-- ----------------------------
ALTER TABLE "public"."person" ADD CONSTRAINT "username_unique" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table person
-- ----------------------------
ALTER TABLE "public"."person" ADD CONSTRAINT "Person_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Auto increment value for role
-- ----------------------------
SELECT setval('"public"."role_id_seq"', 2, true);

-- ----------------------------
-- Uniques structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_name_unique" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table filmcountry
-- ----------------------------
ALTER TABLE "public"."filmcountry" ADD CONSTRAINT "filmcountry_country_id" FOREIGN KEY ("country_id") REFERENCES "public"."country" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."filmcountry" ADD CONSTRAINT "filmcountry_film_id" FOREIGN KEY ("film_id") REFERENCES "public"."film" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table filmpersons
-- ----------------------------
ALTER TABLE "public"."filmpersons" ADD CONSTRAINT "filmpersons_film_id" FOREIGN KEY ("film_id") REFERENCES "public"."film" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."filmpersons" ADD CONSTRAINT "filmpersons_person_id" FOREIGN KEY ("person_id") REFERENCES "public"."person" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."filmpersons" ADD CONSTRAINT "filmpersons_role_id" FOREIGN KEY ("role_id") REFERENCES "public"."role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
