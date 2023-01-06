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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_light_years numeric,
    weight_in_solar_mass numeric,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    weight_in_t integer,
    distance_from_planet integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    diameter_in_km integer,
    weight_in_t integer,
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_billion_km integer,
    weight_in_solar_mass integer,
    has_planet boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: type_of_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_of_galaxy (
    type_of_galaxy_id integer NOT NULL,
    name character varying(15) NOT NULL,
    description text
);


ALTER TABLE public.type_of_galaxy OWNER TO freecodecamp;

--
-- Name: type_of_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_of_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: type_of_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_of_galaxy_type_id_seq OWNED BY public.type_of_galaxy.type_of_galaxy_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: type_of_galaxy type_of_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy ALTER COLUMN type_of_galaxy_id SET DEFAULT nextval('public.type_of_galaxy_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Hercules A', 1000000, 1000000000000000, true);
INSERT INTO public.galaxy VALUES (2, 'Centaurus A', 1300000, 60000000000000000, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 84', 54900000, 7640000000000, true);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 2690000, 1564000000000, true);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 12690000, 156400000000, true);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', 12690000000, 156400000000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 5000, 1000000, 300000, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', 2000, 500000, 300000, 4);
INSERT INTO public.moon VALUES (3, 'Ceres', 2000, 500000, 300000, 4);
INSERT INTO public.moon VALUES (4, 'Io', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (6, 'Ganimed', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (8, 'Himalia', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (9, 'Ananke', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (10, 'Carme', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 2000, 500000, 300000, 5);
INSERT INTO public.moon VALUES (12, 'Ophelia', 2000, 500000, 300000, 8);
INSERT INTO public.moon VALUES (13, 'Bianca', 2000, 500000, 300000, 8);
INSERT INTO public.moon VALUES (14, 'Titania', 2000, 500000, 300000, 8);
INSERT INTO public.moon VALUES (15, 'Desdemona', 2000, 500000, 300000, 8);
INSERT INTO public.moon VALUES (16, 'Cupido', 2000, 500000, 300000, 8);
INSERT INTO public.moon VALUES (17, 'Corderlia', 2000, 500000, 300000, 8);
INSERT INTO public.moon VALUES (18, 'Naiad', 2000, 500000, 300000, 9);
INSERT INTO public.moon VALUES (19, 'Thalassa', 2000, 500000, 300000, 9);
INSERT INTO public.moon VALUES (20, 'Despina', 2000, 500000, 300000, 9);
INSERT INTO public.moon VALUES (21, 'Galatea', 2000, 500000, 300000, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'First Planet', 5000, 1000000, false, 1);
INSERT INTO public.planet VALUES (2, 'Venera', 'Second Planet', 15000, 3000000, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third Planet', 15000, 3000000, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Forth Planet', 10000, 2000000, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Outer planet', 100000, 20000000, false, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Outer planet', 100000, 20000000, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Outer planet', 50000, 15000000, false, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Outer planet', 150000, 19000000, false, 1);
INSERT INTO public.planet VALUES (10, 'Orion A', 'Unknown planet', 10000, 1000000, false, 2);
INSERT INTO public.planet VALUES (11, 'Orion B', 'Unknown planet', 1000, 100000, false, 2);
INSERT INTO public.planet VALUES (12, 'Centaur A', 'Unknown planet', 99000, 100007000, false, 2);
INSERT INTO public.planet VALUES (13, 'Messier A', 'Unknown planet', 99800, 10000000, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, true, 4);
INSERT INTO public.star VALUES (2, 'Orion', 2, 2, true, 4);
INSERT INTO public.star VALUES (3, 'Cassiopea', 2, 2, false, 4);
INSERT INTO public.star VALUES (4, 'Hercules', 3, 3, false, 1);
INSERT INTO public.star VALUES (5, 'Centaur', 1, 1, true, 2);
INSERT INTO public.star VALUES (6, 'Messier', 2, 1, true, 3);


--
-- Data for Name: type_of_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_of_galaxy VALUES (1, 'Ellipticals', NULL);
INSERT INTO public.type_of_galaxy VALUES (2, 'Lenticulars', NULL);
INSERT INTO public.type_of_galaxy VALUES (3, 'Spirals', NULL);
INSERT INTO public.type_of_galaxy VALUES (4, 'Irregulars', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: type_of_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_of_galaxy_type_id_seq', 4, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: type_of_galaxy type_of_galaxy_name_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy
    ADD CONSTRAINT type_of_galaxy_name_type_key UNIQUE (name);


--
-- Name: type_of_galaxy type_of_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy
    ADD CONSTRAINT type_of_galaxy_pkey PRIMARY KEY (type_of_galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

