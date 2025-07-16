-- BH

create schema if not exists "drizzle";

create sequence "drizzle"."__drizzle_migrations_id_seq";

create table "drizzle"."__drizzle_migrations" (
    "id" integer not null default nextval('drizzle.__drizzle_migrations_id_seq'::regclass),
    "hash" text not null,
    "created_at" bigint
);


alter sequence "drizzle"."__drizzle_migrations_id_seq" owned by "drizzle"."__drizzle_migrations"."id";

CREATE UNIQUE INDEX __drizzle_migrations_pkey ON drizzle.__drizzle_migrations USING btree (id);

alter table "drizzle"."__drizzle_migrations" add constraint "__drizzle_migrations_pkey" PRIMARY KEY using index "__drizzle_migrations_pkey";


create sequence "public"."activity_logs_id_seq";

create sequence "public"."invitations_id_seq";

create sequence "public"."team_members_id_seq";

create sequence "public"."teams_id_seq";

create sequence "public"."users_id_seq";

create table "public"."activity_logs" (
    "id" integer not null default nextval('activity_logs_id_seq'::regclass),
    "team_id" integer not null,
    "user_id" integer,
    "action" text not null,
    "timestamp" timestamp without time zone not null default now(),
    "ip_address" character varying(45)
);


create table "public"."invitations" (
    "id" integer not null default nextval('invitations_id_seq'::regclass),
    "team_id" integer not null,
    "email" character varying(255) not null,
    "role" character varying(50) not null,
    "invited_by" integer not null,
    "invited_at" timestamp without time zone not null default now(),
    "status" character varying(20) not null default 'pending'::character varying
);


create table "public"."team_members" (
    "id" integer not null default nextval('team_members_id_seq'::regclass),
    "user_id" integer not null,
    "team_id" integer not null,
    "role" character varying(50) not null,
    "joined_at" timestamp without time zone not null default now()
);


create table "public"."teams" (
    "id" integer not null default nextval('teams_id_seq'::regclass),
    "name" character varying(100) not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now(),
    "stripe_customer_id" text,
    "stripe_subscription_id" text,
    "stripe_product_id" text,
    "plan_name" character varying(50),
    "subscription_status" character varying(20)
);


create table "public"."users" (
    "id" integer not null default nextval('users_id_seq'::regclass),
    "name" character varying(100),
    "email" character varying(255) not null,
    "password_hash" text not null,
    "role" character varying(20) not null default 'member'::character varying,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now(),
    "deleted_at" timestamp without time zone
);


alter sequence "public"."activity_logs_id_seq" owned by "public"."activity_logs"."id";

alter sequence "public"."invitations_id_seq" owned by "public"."invitations"."id";

alter sequence "public"."team_members_id_seq" owned by "public"."team_members"."id";

alter sequence "public"."teams_id_seq" owned by "public"."teams"."id";

alter sequence "public"."users_id_seq" owned by "public"."users"."id";

CREATE UNIQUE INDEX activity_logs_pkey ON public.activity_logs USING btree (id);

CREATE UNIQUE INDEX invitations_pkey ON public.invitations USING btree (id);

CREATE UNIQUE INDEX team_members_pkey ON public.team_members USING btree (id);

CREATE UNIQUE INDEX teams_pkey ON public.teams USING btree (id);

CREATE UNIQUE INDEX teams_stripe_customer_id_unique ON public.teams USING btree (stripe_customer_id);

CREATE UNIQUE INDEX teams_stripe_subscription_id_unique ON public.teams USING btree (stripe_subscription_id);

CREATE UNIQUE INDEX users_email_unique ON public.users USING btree (email);

CREATE UNIQUE INDEX users_pkey ON public.users USING btree (id);

alter table "public"."activity_logs" add constraint "activity_logs_pkey" PRIMARY KEY using index "activity_logs_pkey";

alter table "public"."invitations" add constraint "invitations_pkey" PRIMARY KEY using index "invitations_pkey";

alter table "public"."team_members" add constraint "team_members_pkey" PRIMARY KEY using index "team_members_pkey";

alter table "public"."teams" add constraint "teams_pkey" PRIMARY KEY using index "teams_pkey";

alter table "public"."users" add constraint "users_pkey" PRIMARY KEY using index "users_pkey";

alter table "public"."activity_logs" add constraint "activity_logs_team_id_teams_id_fk" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."activity_logs" validate constraint "activity_logs_team_id_teams_id_fk";

alter table "public"."activity_logs" add constraint "activity_logs_user_id_users_id_fk" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."activity_logs" validate constraint "activity_logs_user_id_users_id_fk";

alter table "public"."invitations" add constraint "invitations_invited_by_users_id_fk" FOREIGN KEY (invited_by) REFERENCES users(id) not valid;

alter table "public"."invitations" validate constraint "invitations_invited_by_users_id_fk";

alter table "public"."invitations" add constraint "invitations_team_id_teams_id_fk" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."invitations" validate constraint "invitations_team_id_teams_id_fk";

alter table "public"."team_members" add constraint "team_members_team_id_teams_id_fk" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."team_members" validate constraint "team_members_team_id_teams_id_fk";

alter table "public"."team_members" add constraint "team_members_user_id_users_id_fk" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."team_members" validate constraint "team_members_user_id_users_id_fk";

alter table "public"."teams" add constraint "teams_stripe_customer_id_unique" UNIQUE using index "teams_stripe_customer_id_unique";

alter table "public"."teams" add constraint "teams_stripe_subscription_id_unique" UNIQUE using index "teams_stripe_subscription_id_unique";

alter table "public"."users" add constraint "users_email_unique" UNIQUE using index "users_email_unique";

grant delete on table "public"."activity_logs" to "anon";

grant insert on table "public"."activity_logs" to "anon";

grant references on table "public"."activity_logs" to "anon";

grant select on table "public"."activity_logs" to "anon";

grant trigger on table "public"."activity_logs" to "anon";

grant truncate on table "public"."activity_logs" to "anon";

grant update on table "public"."activity_logs" to "anon";

grant delete on table "public"."activity_logs" to "authenticated";

grant insert on table "public"."activity_logs" to "authenticated";

grant references on table "public"."activity_logs" to "authenticated";

grant select on table "public"."activity_logs" to "authenticated";

grant trigger on table "public"."activity_logs" to "authenticated";

grant truncate on table "public"."activity_logs" to "authenticated";

grant update on table "public"."activity_logs" to "authenticated";

grant delete on table "public"."activity_logs" to "service_role";

grant insert on table "public"."activity_logs" to "service_role";

grant references on table "public"."activity_logs" to "service_role";

grant select on table "public"."activity_logs" to "service_role";

grant trigger on table "public"."activity_logs" to "service_role";

grant truncate on table "public"."activity_logs" to "service_role";

grant update on table "public"."activity_logs" to "service_role";

grant delete on table "public"."invitations" to "anon";

grant insert on table "public"."invitations" to "anon";

grant references on table "public"."invitations" to "anon";

grant select on table "public"."invitations" to "anon";

grant trigger on table "public"."invitations" to "anon";

grant truncate on table "public"."invitations" to "anon";

grant update on table "public"."invitations" to "anon";

grant delete on table "public"."invitations" to "authenticated";

grant insert on table "public"."invitations" to "authenticated";

grant references on table "public"."invitations" to "authenticated";

grant select on table "public"."invitations" to "authenticated";

grant trigger on table "public"."invitations" to "authenticated";

grant truncate on table "public"."invitations" to "authenticated";

grant update on table "public"."invitations" to "authenticated";

grant delete on table "public"."invitations" to "service_role";

grant insert on table "public"."invitations" to "service_role";

grant references on table "public"."invitations" to "service_role";

grant select on table "public"."invitations" to "service_role";

grant trigger on table "public"."invitations" to "service_role";

grant truncate on table "public"."invitations" to "service_role";

grant update on table "public"."invitations" to "service_role";

grant delete on table "public"."team_members" to "anon";

grant insert on table "public"."team_members" to "anon";

grant references on table "public"."team_members" to "anon";

grant select on table "public"."team_members" to "anon";

grant trigger on table "public"."team_members" to "anon";

grant truncate on table "public"."team_members" to "anon";

grant update on table "public"."team_members" to "anon";

grant delete on table "public"."team_members" to "authenticated";

grant insert on table "public"."team_members" to "authenticated";

grant references on table "public"."team_members" to "authenticated";

grant select on table "public"."team_members" to "authenticated";

grant trigger on table "public"."team_members" to "authenticated";

grant truncate on table "public"."team_members" to "authenticated";

grant update on table "public"."team_members" to "authenticated";

grant delete on table "public"."team_members" to "service_role";

grant insert on table "public"."team_members" to "service_role";

grant references on table "public"."team_members" to "service_role";

grant select on table "public"."team_members" to "service_role";

grant trigger on table "public"."team_members" to "service_role";

grant truncate on table "public"."team_members" to "service_role";

grant update on table "public"."team_members" to "service_role";

grant delete on table "public"."teams" to "anon";

grant insert on table "public"."teams" to "anon";

grant references on table "public"."teams" to "anon";

grant select on table "public"."teams" to "anon";

grant trigger on table "public"."teams" to "anon";

grant truncate on table "public"."teams" to "anon";

grant update on table "public"."teams" to "anon";

grant delete on table "public"."teams" to "authenticated";

grant insert on table "public"."teams" to "authenticated";

grant references on table "public"."teams" to "authenticated";

grant select on table "public"."teams" to "authenticated";

grant trigger on table "public"."teams" to "authenticated";

grant truncate on table "public"."teams" to "authenticated";

grant update on table "public"."teams" to "authenticated";

grant delete on table "public"."teams" to "service_role";

grant insert on table "public"."teams" to "service_role";

grant references on table "public"."teams" to "service_role";

grant select on table "public"."teams" to "service_role";

grant trigger on table "public"."teams" to "service_role";

grant truncate on table "public"."teams" to "service_role";

grant update on table "public"."teams" to "service_role";

grant delete on table "public"."users" to "anon";

grant insert on table "public"."users" to "anon";

grant references on table "public"."users" to "anon";

grant select on table "public"."users" to "anon";

grant trigger on table "public"."users" to "anon";

grant truncate on table "public"."users" to "anon";

grant update on table "public"."users" to "anon";

grant delete on table "public"."users" to "authenticated";

grant insert on table "public"."users" to "authenticated";

grant references on table "public"."users" to "authenticated";

grant select on table "public"."users" to "authenticated";

grant trigger on table "public"."users" to "authenticated";

grant truncate on table "public"."users" to "authenticated";

grant update on table "public"."users" to "authenticated";

grant delete on table "public"."users" to "service_role";

grant insert on table "public"."users" to "service_role";

grant references on table "public"."users" to "service_role";

grant select on table "public"."users" to "service_role";

grant trigger on table "public"."users" to "service_role";

grant truncate on table "public"."users" to "service_role";

grant update on table "public"."users" to "service_role";