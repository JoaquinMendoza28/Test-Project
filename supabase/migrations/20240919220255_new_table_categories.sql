create table "public"."categories" (
    "id" bigint generated always as identity not null,
    "name" text not null,
    "created_at" timestamp with time zone default CURRENT_TIMESTAMP
);


alter table "public"."products" add column "category_id" bigint;

CREATE UNIQUE INDEX categories_pkey ON public.categories USING btree (id);

insert into "public"."categories" (name) values ('uncategorized');

UPDATE "public"."products"
SET
  category_id = (
    SELECT
      id
    FROM
      "public"."categories"
    WHERE
      name = 'uncategorized'
  )
WHERE
  category_id IS NULL;

ALTER TABLE public.products
ALTER COLUMN category_id
SET NOT NULL;

alter table "public"."categories" add constraint "categories_pkey" PRIMARY KEY using index "categories_pkey";

alter table "public"."products" add constraint "products__categories_fk" FOREIGN KEY (category_id) REFERENCES categories(id) not valid;

alter table "public"."products" validate constraint "products__categories_fk";

grant delete on table "public"."categories" to "anon";

grant insert on table "public"."categories" to "anon";

grant references on table "public"."categories" to "anon";

grant select on table "public"."categories" to "anon";

grant trigger on table "public"."categories" to "anon";

grant truncate on table "public"."categories" to "anon";

grant update on table "public"."categories" to "anon";

grant delete on table "public"."categories" to "authenticated";

grant insert on table "public"."categories" to "authenticated";

grant references on table "public"."categories" to "authenticated";

grant select on table "public"."categories" to "authenticated";

grant trigger on table "public"."categories" to "authenticated";

grant truncate on table "public"."categories" to "authenticated";

grant update on table "public"."categories" to "authenticated";

grant delete on table "public"."categories" to "service_role";

grant insert on table "public"."categories" to "service_role";

grant references on table "public"."categories" to "service_role";

grant select on table "public"."categories" to "service_role";

grant trigger on table "public"."categories" to "service_role";

grant truncate on table "public"."categories" to "service_role";

grant update on table "public"."categories" to "service_role";


