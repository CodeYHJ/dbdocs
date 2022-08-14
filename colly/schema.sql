-- SQL dump generated using DBML (dbml-lang.org)
-- Database: PostgreSQL
-- Generated at: 2022-08-14T14:11:24.241Z

CREATE TABLE "brand" (
  "id" bigserial PRIMARY KEY,
  "p_brand_id" int NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "factories" (
  "id" bigserial PRIMARY KEY,
  "name" varchar NOT NULL,
  "p_factory_id" int NOT NULL
);

CREATE TABLE "cars" (
  "id" bigserial PRIMARY KEY,
  "name" varchar NOT NULL,
  "p_car_id" int NOT NULL
);

CREATE TABLE "sales" (
  "id" bigserial PRIMARY KEY,
  "num" decimal NOT NULL,
  "date" timestampsz NOT NULL,
  "sales_type" int NOT NULL
);

CREATE TABLE "relations" (
  "id" bigserial PRIMARY KEY,
  "sales_id" bigserial NOT NULL,
  "factory_id" bigserial NOT NULL,
  "brand_id" bigserial NOT NULL,
  "car_id" bigserial NOT NULL
);

COMMENT ON COLUMN "brand"."p_brand_id" IS '平台id';

COMMENT ON COLUMN "brand"."name" IS '品牌名字';

COMMENT ON COLUMN "factories"."name" IS '厂家';

COMMENT ON COLUMN "factories"."p_factory_id" IS '平台id';

COMMENT ON COLUMN "cars"."name" IS '汽车名字';

COMMENT ON COLUMN "cars"."p_car_id" IS '平台id';

COMMENT ON COLUMN "sales"."num" IS '销量';

COMMENT ON COLUMN "sales"."date" IS '销售月份';

COMMENT ON COLUMN "sales"."sales_type" IS '销量类型';

ALTER TABLE "relations" ADD FOREIGN KEY ("sales_id") REFERENCES "sales" ("id");

ALTER TABLE "relations" ADD FOREIGN KEY ("factory_id") REFERENCES "factories" ("id");

ALTER TABLE "relations" ADD FOREIGN KEY ("brand_id") REFERENCES "brand" ("id");

ALTER TABLE "relations" ADD FOREIGN KEY ("car_id") REFERENCES "cars" ("id");
