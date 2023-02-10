--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: gamers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gamers (
    gamer_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.gamers OWNER TO freecodecamp;

--
-- Name: gamers_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.gamers_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gamers_game_id_seq OWNER TO freecodecamp;

--
-- Name: gamers_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.gamers_game_id_seq OWNED BY public.gamers.gamer_id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    gamer_id integer,
    no_of_tries integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: gamers gamer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamers ALTER COLUMN gamer_id SET DEFAULT nextval('public.gamers_game_id_seq'::regclass);


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: gamers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gamers VALUES (14, 'hART');
INSERT INTO public.gamers VALUES (15, 'Hart');
INSERT INTO public.gamers VALUES (16, '');
INSERT INTO public.gamers VALUES (17, 'user_1676067973853');
INSERT INTO public.gamers VALUES (18, 'user_1676067973852');
INSERT INTO public.gamers VALUES (19, 'user_1676068269947');
INSERT INTO public.gamers VALUES (20, 'user_1676068269946');
INSERT INTO public.gamers VALUES (21, 'user_1676068354124');
INSERT INTO public.gamers VALUES (22, 'user_1676068354123');


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 15, 8);
INSERT INTO public.games VALUES (2, 16, 3);
INSERT INTO public.games VALUES (3, 15, 8);
INSERT INTO public.games VALUES (4, 15, 5);
INSERT INTO public.games VALUES (5, 17, 472);
INSERT INTO public.games VALUES (6, 17, 339);
INSERT INTO public.games VALUES (7, 18, 877);
INSERT INTO public.games VALUES (8, 18, 373);
INSERT INTO public.games VALUES (9, 17, 599);
INSERT INTO public.games VALUES (10, 17, 728);
INSERT INTO public.games VALUES (11, 17, 914);
INSERT INTO public.games VALUES (12, 19, 805);
INSERT INTO public.games VALUES (13, 19, 562);
INSERT INTO public.games VALUES (14, 20, 250);
INSERT INTO public.games VALUES (15, 20, 148);
INSERT INTO public.games VALUES (16, 19, 849);
INSERT INTO public.games VALUES (17, 19, 850);
INSERT INTO public.games VALUES (18, 19, 877);
INSERT INTO public.games VALUES (19, 21, 877);
INSERT INTO public.games VALUES (20, 21, 146);
INSERT INTO public.games VALUES (21, 22, 776);
INSERT INTO public.games VALUES (22, 22, 570);
INSERT INTO public.games VALUES (23, 21, 510);
INSERT INTO public.games VALUES (24, 21, 370);
INSERT INTO public.games VALUES (25, 21, 729);


--
-- Name: gamers_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.gamers_game_id_seq', 22, true);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 25, true);


--
-- Name: gamers gamers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamers
    ADD CONSTRAINT gamers_pkey PRIMARY KEY (gamer_id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: games games_gamer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_gamer_id_fkey FOREIGN KEY (gamer_id) REFERENCES public.gamers(gamer_id);


--
-- PostgreSQL database dump complete
--

