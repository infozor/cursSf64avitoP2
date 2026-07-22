CREATE TABLE public."mBest4" (
  good_id NUMERIC(10,0) NOT NULL,
  profil CHAR(6),
  catnumber CHAR(25),
  name CHAR(250),
  kol NUMERIC(10,0),
  kolsklad NUMERIC(10,0),
  price NUMERIC(12,2),
  producer CHAR(100),
  analogs CHAR(250),
  brkol NUMERIC(10,0),
  brkol2 NUMERIC(10,0),
  supplier_id CHAR(6),
  days NUMERIC(3,0),
  priceopt NUMERIC(12,2),
  priceinet NUMERIC(12,2),
  priceinet2 NUMERIC(12,2),
  priceinet3 NUMERIC(12,2),
  width NUMERIC(12,2),
  height NUMERIC(12,2),
  length NUMERIC(12,2),
  weight NUMERIC(12,2),
  "group" CHAR(10),
  group1 CHAR(10),
  mksprstr_id INTEGER,
  prodmarka CHAR(25),
  minprice NUMERIC(12,2),
  nalnow NUMERIC(10,0),
  pricekol NUMERIC(10,0),
  outsklad1 NUMERIC(10,0),
  n409 NUMERIC(10,0),
  "order" NUMERIC(10,0),
  flagsite BOOLEAN,
  cloudanchor BOOLEAN,
  cloudprop NUMERIC(1,0),
  filter1 BOOLEAN,
  ks CHAR(64),
  stopdirect BOOLEAN,
  store CHAR(10) DEFAULT ''::bpchar,
  store1 CHAR(10) DEFAULT ''::bpchar,
  store12 CHAR(10) DEFAULT ''::bpchar,
  store2 CHAR(10) DEFAULT ''::bpchar,
  instore CHAR(2) DEFAULT ''::bpchar,
  kolclosed NUMERIC(10,0) DEFAULT 0,
  group2 CHAR(30),
  codedeliv CHAR(30),
  CONSTRAINT "mBest4_good_id" PRIMARY KEY(good_id)
) 
WITH (oids = false);

COMMENT ON TABLE public."mBest4"
IS 'Таблица для затяжки mBest4 из Маяка и SupplierPrice в едином формате для манипуляции сайта.';

COMMENT ON COLUMN public."mBest4".good_id
IS 'Ключ товара из Маяка';

COMMENT ON COLUMN public."mBest4".profil
IS 'Ключ товара пришедшего в продажу';

COMMENT ON COLUMN public."mBest4".catnumber
IS 'Каталожный номер';

COMMENT ON COLUMN public."mBest4".name
IS 'Наименование товара';

COMMENT ON COLUMN public."mBest4".kol
IS 'Количество';

COMMENT ON COLUMN public."mBest4".kolsklad
IS 'Количество на складе';

COMMENT ON COLUMN public."mBest4".price
IS 'Цена';

COMMENT ON COLUMN public."mBest4".producer
IS 'Производитель';

COMMENT ON COLUMN public."mBest4".analogs
IS 'Список каталожных номеров аналогов через @';

COMMENT ON COLUMN public."mBest4".brkol
IS 'Количество в филиале';

COMMENT ON COLUMN public."mBest4".brkol2
IS 'Количество в филиале 2';

COMMENT ON COLUMN public."mBest4".supplier_id
IS 'Ключ поставщика из Маяка';

COMMENT ON COLUMN public."mBest4".days
IS 'Число дней поставки';

COMMENT ON COLUMN public."mBest4".priceopt
IS 'Оптовая цена';

COMMENT ON COLUMN public."mBest4".priceinet
IS 'Цена в сети';

COMMENT ON COLUMN public."mBest4".priceinet2
IS 'Цена в сети 2';

COMMENT ON COLUMN public."mBest4".priceinet3
IS 'Цена в сети 3';

COMMENT ON COLUMN public."mBest4".width
IS 'ширина';

COMMENT ON COLUMN public."mBest4".height
IS 'Высота';

COMMENT ON COLUMN public."mBest4".length
IS 'Длинна';

COMMENT ON COLUMN public."mBest4".weight
IS 'Вес';

COMMENT ON COLUMN public."mBest4"."group"
IS 'Группа';

COMMENT ON COLUMN public."mBest4".group1
IS 'Группа 1';

COMMENT ON COLUMN public."mBest4".mksprstr_id
IS 'Разделы товаров для сайта';

COMMENT ON COLUMN public."mBest4".prodmarka
IS 'Каталожный номер';

COMMENT ON COLUMN public."mBest4".minprice
IS 'Приходная цена';

COMMENT ON COLUMN public."mBest4".flagsite
IS 'Разрешенние на сайт';

COMMENT ON COLUMN public."mBest4".cloudanchor
IS 'Флаг якоря облака';

COMMENT ON COLUMN public."mBest4".cloudprop
IS 'облачное свойство';

COMMENT ON COLUMN public."mBest4".filter1
IS 'Флаг "НА ПРИХОДЕ"';

COMMENT ON COLUMN public."mBest4".ks
IS 'Контрольная сумма строки MD5';

COMMENT ON COLUMN public."mBest4".stopdirect
IS 'Флаг остановки показов в Яндекс.Директ';

COMMENT ON COLUMN public."mBest4".store
IS 'Место хранения товара в магазине';

COMMENT ON COLUMN public."mBest4".store1
IS 'Место хранения';

COMMENT ON COLUMN public."mBest4".store12
IS 'Место хранения';

COMMENT ON COLUMN public."mBest4".store2
IS 'Место хранения';

COMMENT ON COLUMN public."mBest4".instore
IS 'Модификация кода места хранения';

COMMENT ON COLUMN public."mBest4".kolclosed
IS '''Количество закрытое для торговли. В подразделениях с PodrVid.Kod = 5.''';

COMMENT ON COLUMN public."mBest4".group2
IS 'Код классификатора 2';

CREATE INDEX "Good_ID" ON public."mBest4"
  USING btree (good_id);

CREATE INDEX "Profil_idx" ON public."mBest4"
  USING btree (profil COLLATE pg_catalog."default");

ALTER TABLE public."mBest4"
  OWNER TO postgreadmin;
CREATE TABLE public."PodrMesto" (
  "PodrMesto_ID" SERIAL,
  "Podr_ID" INTEGER NOT NULL,
  "IsActual" BOOLEAN DEFAULT true NOT NULL,
  "Kod" CHAR(10) DEFAULT ''::bpchar NOT NULL,
  "Name" CHAR(50) DEFAULT ''::bpchar NOT NULL,
  "Remark" CHAR(250) DEFAULT ''::bpchar NOT NULL,
  CONSTRAINT "PodrMest_ID" PRIMARY KEY("PodrMesto_ID"),
  CONSTRAINT "PodrMesto_fk" FOREIGN KEY ("Podr_ID")
    REFERENCES public."Podr"("Podr_ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) 
WITH (oids = false);

COMMENT ON COLUMN public."PodrMesto"."PodrMesto_ID"
IS 'Ключ места хранения';

COMMENT ON COLUMN public."PodrMesto"."Podr_ID"
IS 'Ключ подразделения';

COMMENT ON COLUMN public."PodrMesto"."Kod"
IS 'Код места хранения';

COMMENT ON COLUMN public."PodrMesto"."Name"
IS 'наименование места хранения';

COMMENT ON COLUMN public."PodrMesto"."Remark"
IS 'Примечание';

CREATE INDEX "PodrMesto_Kod_idx" ON public."PodrMesto"
  USING btree ("Kod" COLLATE pg_catalog."default");

CREATE INDEX "PodrMesto_Podr_ID_idx" ON public."PodrMesto"
  USING btree ("Podr_ID");

ALTER TABLE public."PodrMesto"
  OWNER TO postgreadmin;

CREATE TABLE public."TovarPart" (
  "TovarPart_ID" SERIAL,
  "PodrMesto_ID" INTEGER NOT NULL,
  "TovarStr_ID" INTEGER,
  "Good_ID" INTEGER NOT NULL,
  "KVO" NUMERIC(10,0) DEFAULT 0 NOT NULL,
  "KVOout" NUMERIC(10,0) DEFAULT 0 NOT NULL,
  "KVOin" NUMERIC(10,0) DEFAULT 0 NOT NULL,
  "SumR" NUMERIC(12,2) DEFAULT 0.00 NOT NULL,
  "SumRout" NUMERIC(12,2) DEFAULT 0.00 NOT NULL,
  "SumRin" NUMERIC(12,2) DEFAULT 0.00 NOT NULL,
  "PriceIn" NUMERIC(12,2) DEFAULT 0.00 NOT NULL,
  "DT" TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  CONSTRAINT "TovarPart_ID" PRIMARY KEY("TovarPart_ID"),
  CONSTRAINT "TovarPart_fk" FOREIGN KEY ("PodrMesto_ID")
    REFERENCES public."PodrMesto"("PodrMesto_ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE
) 
WITH (oids = false);

COMMENT ON TABLE public."TovarPart"
IS 'Товарные остатки по партиям и местам хранения';

COMMENT ON COLUMN public."TovarPart"."TovarPart_ID"
IS 'Ключ строки';

COMMENT ON COLUMN public."TovarPart"."PodrMesto_ID"
IS 'Ключ места хранения';

COMMENT ON COLUMN public."TovarPart"."TovarStr_ID"
IS 'Ключ партии товара';

COMMENT ON COLUMN public."TovarPart"."Good_ID"
IS 'Ключ товара';

COMMENT ON COLUMN public."TovarPart"."KVO"
IS 'Количество остатка';

COMMENT ON COLUMN public."TovarPart"."KVOout"
IS 'Количество остатка в резерве прихода';

COMMENT ON COLUMN public."TovarPart"."KVOin"
IS 'Количество остатка в резерве расхода';

COMMENT ON COLUMN public."TovarPart"."SumR"
IS 'Сумма свободного остатка';

COMMENT ON COLUMN public."TovarPart"."SumRout"
IS 'Сумма резерва расхода';

COMMENT ON COLUMN public."TovarPart"."SumRin"
IS 'Сумма резерва прихода';

COMMENT ON COLUMN public."TovarPart"."PriceIn"
IS 'Цена единицы в партии прихода';

COMMENT ON COLUMN public."TovarPart"."DT"
IS 'Дата и время выполнения крайней операции';

CREATE INDEX "TovarPart_DT_idx" ON public."TovarPart"
  USING btree ("DT");

CREATE INDEX "TovarPart_Good_ID_idx" ON public."TovarPart"
  USING btree ("Good_ID");

CREATE INDEX "TovarPart_PodrMesto_ID_idx" ON public."TovarPart"
  USING btree ("PodrMesto_ID");

CREATE INDEX "TovarPart_TovarStr_ID_idx" ON public."TovarPart"
  USING btree ("TovarStr_ID");

ALTER TABLE public."TovarPart"
  OWNER TO postgreadmin;


CREATE OR REPLACE FUNCTION public."TovarPart_Select_Ost_PodrMesto_Avito" (
  ppodr_id integer = NULL::integer,
  pprofil char = NULL::character(6),
  pgood_id integer = NULL::integer
)
RETURNS TABLE (
  "Good_ID" integer,
  "Profil" char,
  "Podr_ID" integer,
  "PodrMesto_ID" integer,
  "MestoKod" char,
  "MestoName" char,
  "KVO" numeric,
  "KVOin" numeric,
  "KVOout" numeric,
  "MinPrice" numeric
) LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
PARALLEL UNSAFE
COST 100 ROWS 1000
AS
$body$
DECLARE
BEGIN

    RETURN QUERY

    SELECT
         t."Good_ID"         AS "Good_ID"
        ,b.profil            AS "Profil"
        ,m."Podr_ID"         AS "Podr_ID"
        ,t."PodrMesto_ID"    AS "PodrMesto_ID"
        ,m."Kod"             AS "MestoKod"
        ,m."Name"            AS "MestoName"
        ,SUM(t."KVO")        AS "KVO"
        ,SUM(t."KVOin")      AS "KVOin"
        ,SUM(t."KVOout")     AS "KVOout"
        ,MAX(b.minprice)     AS "MinPrice"

    FROM "TovarPart" t

        INNER JOIN "PodrMesto" m
            ON m."PodrMesto_ID" = t."PodrMesto_ID"

        INNER JOIN "mBest4" b
            ON b.good_id = t."Good_ID"

    WHERE
            m."Podr_ID" = COALESCE(ppodr_id, m."Podr_ID")
        AND (
                CASE
                    WHEN pprofil IS NOT NULL
                        THEN pprofil = b.profil

                    WHEN pgood_id IS NOT NULL
                        THEN pgood_id = t."Good_ID"

                    ELSE TRUE
                END
            )

    GROUP BY
         m."Podr_ID"
        ,t."PodrMesto_ID"
        ,m."Kod"
        ,m."Name"
        ,t."Good_ID"
        ,b.profil

    HAVING
           SUM(t."KVO")    <> 0
        OR SUM(t."KVOin")  <> 0
        OR SUM(t."KVOout") <> 0

    ORDER BY
         t."Good_ID"
        ,t."PodrMesto_ID";

    RETURN;

END;
$body$;

ALTER FUNCTION public."TovarPart_Select_Ost_PodrMesto_Avito" (ppodr_id integer, pprofil char, pgood_id integer)
  OWNER TO postgreadmin;

CREATE OR REPLACE FUNCTION public.get_total_kvo_by_profil_store19 (
  p_profils text []
)
RETURNS TABLE (
  profil text,
  total_kvo numeric
) LANGUAGE 'sql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
PARALLEL UNSAFE
COST 100 ROWS 1000
AS
$body$
/*
 * taskp4643 Автозагрузка Авито 
 *
-- Функция расчета суммарного KVO по профилям товаров для склада 19.
-- Назначение:
--   Расчет агрегированного значения KVO по списку профилей товаров для склада 19.
--
-- Параметры:
--   p_profils  - массив профилей товаров (text[])
--
-- Логика:
--   1. По складу 19 выполняется агрегация SUM(KVO) по каждому профилю.
--   2. Из полученного значения вычитается 2 единицы.
--   3. Результат ограничивается снизу значением 0 (GREATEST).
--
-- Формула:
--   total_kvo = GREATEST(SUM(KVO) - 2, 0)
--
-- Особенности:
--   - Корректировка (-2) применяется один раз на профиль (после агрегации).
--   - Профили, отсутствующие в данных склада, в результат не попадают.
--
-- Возвращает:
--   profil     - профиль товара
--   total_kvo  - итоговое значение KVO

 * коротко простым языком:
 * берём склад 19
 * считаем SUM(KVO) - 2
 * если < 0 → 0
 * возвращаем

 * (c) Alexander Ionov <magneticsun@gmail.com>
 *
 * 
 * Date: 10.04.2026г.
 * Time: 10:38:00 
 *
 */
SELECT
    t."Profil"::text AS profil,
    --GREATEST(SUM(t."KVO") - 2, 0) AS total_kvo
    SUM(t."KVO") AS total_kvo  -- временно: без корректировки
FROM public."TovarPart_Select_Ost_PodrMesto"(19) t
WHERE t."Profil" = ANY(p_profils)
GROUP BY t."Profil"
ORDER BY profil;
$body$;

COMMENT ON FUNCTION public.get_total_kvo_by_profil_store19(p_profils text [])
IS 'Рассчитывает суммарный KVO по профилям для склада 19: SUM(KVO) - 2 с ограничением не ниже 0. Корректировка применяется на уровне агрегата.';

ALTER FUNCTION public.get_total_kvo_by_profil_store19 (p_profils text [])
  OWNER TO postgreadmin;

CREATE OR REPLACE FUNCTION public.get_total_kvo_by_profil_store19_with_price (
  p_profils text []
)
RETURNS TABLE (
  profil text,
  total_kvo numeric,
  "MinPrice" numeric
) LANGUAGE 'sql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
PARALLEL UNSAFE
COST 100 ROWS 1000
AS
$body$
/*
 * taskp5362 Автозагрузка Авито Необходимо выгружать себестоимость товаров
 *
-- Функция расчета суммарного KVO по профилям товаров для склада 19.
-- Назначение:
--   Расчет агрегированного значения KVO по списку профилей товаров для склада 19.
--
-- Параметры:
--   p_profils  - массив профилей товаров (text[])
--
-- Логика:
--   1. По складу 19 выполняется агрегация SUM(KVO) по каждому профилю.
--   2. Из полученного значения вычитается 2 единицы.
--   3. Результат ограничивается снизу значением 0 (GREATEST).
--
-- Формула:
--   total_kvo = GREATEST(SUM(KVO) - 2, 0)
--
-- Особенности:
--   - Корректировка (-2) применяется один раз на профиль (после агрегации).
--   - Профили, отсутствующие в данных склада, в результат не попадают.
--
-- Возвращает:
--   profil     - профиль товара
--   total_kvo  - итоговое значение KVO
--   MinPrice   - приходная цена

 * коротко простым языком:
 * берём склад 19
 * считаем SUM(KVO) - 2
 * если < 0 → 0
 * возвращаем
 *
 * 
 * Date: 10.04.2026г.
 * Time: 10:38:00 
 *
 */
SELECT
    t."Profil"::text AS profil,
    --GREATEST(SUM(t."KVO") - 2, 0) AS total_kvo
    SUM(t."KVO") AS total_kvo  -- временно: без корректировки
    ,MIN(t."MinPrice") AS minprice 
FROM public."TovarPart_Select_Ost_PodrMesto_Avito"(19) t
WHERE t."Profil" = ANY(p_profils)
GROUP BY t."Profil"
ORDER BY profil;
$body$;

ALTER FUNCTION public.get_total_kvo_by_profil_store19_with_price (p_profils text [])
  OWNER TO postgreadmin;

