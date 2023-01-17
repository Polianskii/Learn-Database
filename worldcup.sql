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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (35, 2018, 'Final', 4, 2, 221, 220);
INSERT INTO public.games VALUES (36, 2018, 'Third Place', 2, 0, 223, 222);
INSERT INTO public.games VALUES (37, 2018, 'Semi-Final', 2, 1, 220, 222);
INSERT INTO public.games VALUES (38, 2018, 'Semi-Final', 1, 0, 221, 223);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 3, 2, 220, 224);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 2, 0, 222, 225);
INSERT INTO public.games VALUES (41, 2018, 'Quarter-Final', 2, 1, 223, 226);
INSERT INTO public.games VALUES (42, 2018, 'Quarter-Final', 2, 0, 221, 227);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 2, 1, 222, 228);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 1, 0, 225, 229);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 3, 2, 223, 230);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 2, 0, 226, 231);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 2, 1, 220, 232);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 2, 1, 224, 233);
INSERT INTO public.games VALUES (49, 2018, 'Eighth-Final', 2, 1, 227, 234);
INSERT INTO public.games VALUES (50, 2018, 'Eighth-Final', 4, 3, 221, 235);
INSERT INTO public.games VALUES (51, 2014, 'Final', 1, 0, 236, 235);
INSERT INTO public.games VALUES (52, 2014, 'Third Place', 3, 0, 237, 226);
INSERT INTO public.games VALUES (53, 2014, 'Semi-Final', 1, 0, 235, 237);
INSERT INTO public.games VALUES (54, 2014, 'Semi-Final', 7, 1, 236, 226);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 1, 0, 237, 238);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 1, 0, 235, 223);
INSERT INTO public.games VALUES (57, 2014, 'Quarter-Final', 2, 1, 226, 228);
INSERT INTO public.games VALUES (58, 2014, 'Quarter-Final', 1, 0, 236, 221);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 2, 1, 226, 239);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 2, 0, 228, 227);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 2, 0, 221, 240);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 2, 1, 236, 241);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 2, 1, 237, 231);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 2, 1, 238, 242);
INSERT INTO public.games VALUES (65, 2014, 'Eighth-Final', 1, 0, 235, 229);
INSERT INTO public.games VALUES (66, 2014, 'Eighth-Final', 2, 1, 223, 243);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (220, 'Croatia');
INSERT INTO public.teams VALUES (221, 'France');
INSERT INTO public.teams VALUES (222, 'England');
INSERT INTO public.teams VALUES (223, 'Belgium');
INSERT INTO public.teams VALUES (224, 'Russia');
INSERT INTO public.teams VALUES (225, 'Sweden');
INSERT INTO public.teams VALUES (226, 'Brazil');
INSERT INTO public.teams VALUES (227, 'Uruguay');
INSERT INTO public.teams VALUES (228, 'Colombia');
INSERT INTO public.teams VALUES (229, 'Switzerland');
INSERT INTO public.teams VALUES (230, 'Japan');
INSERT INTO public.teams VALUES (231, 'Mexico');
INSERT INTO public.teams VALUES (232, 'Denmark');
INSERT INTO public.teams VALUES (233, 'Spain');
INSERT INTO public.teams VALUES (234, 'Portugal');
INSERT INTO public.teams VALUES (235, 'Argentina');
INSERT INTO public.teams VALUES (236, 'Germany');
INSERT INTO public.teams VALUES (237, 'Netherlands');
INSERT INTO public.teams VALUES (238, 'Costa Rica');
INSERT INTO public.teams VALUES (239, 'Chile');
INSERT INTO public.teams VALUES (240, 'Nigeria');
INSERT INTO public.teams VALUES (241, 'Algeria');
INSERT INTO public.teams VALUES (242, 'Greece');
INSERT INTO public.teams VALUES (243, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 66, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 243, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

