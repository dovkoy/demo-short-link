SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."teams" ("id", "name", "created_at", "updated_at", "stripe_customer_id", "stripe_subscription_id", "stripe_product_id", "plan_name", "subscription_status") VALUES
	(1, 'Test Team', '2025-07-16 16:19:30.978487', '2025-07-16 16:19:30.978487', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("id", "name", "email", "password_hash", "role", "created_at", "updated_at", "deleted_at") VALUES
	(1, NULL, 'test@test.com', '$2b$10$Ms2v6te/f6Si/abNRBB6Auyb4yMfqMJbGea/t3.X09iFkiHVHtK.6', 'owner', '2025-07-16 16:19:30.933959', '2025-07-16 16:19:30.933959', NULL);


--
-- Data for Name: activity_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."team_members" ("id", "user_id", "team_id", "role", "joined_at") VALUES
	(1, 1, 1, 'owner', '2025-07-16 16:19:31.040713');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: activity_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."activity_logs_id_seq"', 1, false);


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."invitations_id_seq"', 1, false);


--
-- Name: team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."team_members_id_seq"', 1, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."teams_id_seq"', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 1, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
