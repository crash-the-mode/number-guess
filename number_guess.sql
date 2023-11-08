--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user_stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_stats (
    user_id integer NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_stats OWNER TO freecodecamp;

--
-- Name: user_stats_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_stats_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_stats_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_stats_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_stats_user_id_seq OWNED BY public.user_stats.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: user_stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_stats VALUES (162, 1, 15);
INSERT INTO public.user_stats VALUES (164, 2, 304);
INSERT INTO public.user_stats VALUES (163, 5, 203);
INSERT INTO public.user_stats VALUES (166, 2, 249);
INSERT INTO public.user_stats VALUES (165, 5, 28);
INSERT INTO public.user_stats VALUES (168, 2, 250);
INSERT INTO public.user_stats VALUES (167, 5, 157);
INSERT INTO public.user_stats VALUES (170, 2, 280);
INSERT INTO public.user_stats VALUES (169, 5, 16);
INSERT INTO public.user_stats VALUES (172, 2, 512);
INSERT INTO public.user_stats VALUES (171, 5, 477);
INSERT INTO public.user_stats VALUES (174, 2, 611);
INSERT INTO public.user_stats VALUES (173, 5, 133);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (162, 'batman');
INSERT INTO public.users VALUES (163, 'user_1699419304174');
INSERT INTO public.users VALUES (164, 'user_1699419304173');
INSERT INTO public.users VALUES (165, 'user_1699419331844');
INSERT INTO public.users VALUES (166, 'user_1699419331843');
INSERT INTO public.users VALUES (167, 'user_1699419571840');
INSERT INTO public.users VALUES (168, 'user_1699419571839');
INSERT INTO public.users VALUES (169, 'user_1699419580440');
INSERT INTO public.users VALUES (170, 'user_1699419580439');
INSERT INTO public.users VALUES (171, 'user_1699419604204');
INSERT INTO public.users VALUES (172, 'user_1699419604203');
INSERT INTO public.users VALUES (173, 'user_1699419622809');
INSERT INTO public.users VALUES (174, 'user_1699419622808');


--
-- Name: user_stats_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_stats_user_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 174, true);


--
-- Name: user_stats user_stats_user_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_stats
    ADD CONSTRAINT user_stats_user_id_key UNIQUE (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: user_stats user_stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_stats
    ADD CONSTRAINT user_stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

