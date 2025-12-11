--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_type text,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type text,
    distance_from_star numeric,
    has_life boolean NOT NULL,
    mass integer NOT NULL
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
-- Name: planet_type_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type_info (
    planet_type_info_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type_info OWNER TO freecodecamp;

--
-- Name: planet_type_info_planet_type_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_info_planet_type_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_info_planet_type_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_info_planet_type_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_info_planet_type_info_id_seq OWNED BY public.planet_type_info.planet_type_info_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: planet_type_info planet_type_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_info ALTER COLUMN planet_type_info_id SET DEFAULT nextval('public.planet_type_info_planet_type_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 26000, true, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, false, 14000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2737000, false, 12000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 29000000, false, 10000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000000, false, 9000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000, false, 11000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, true, 'Moon of Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 'Small moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 'Small moon of Mars');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3121, true, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 5268, true, 'Largest moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Io', 5, 3643, true, 'Volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, true, 'Moon of Saturn');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, true, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, true, 'Moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Proxima-b I', 7, 2100, true, 'Fictional moon');
INSERT INTO public.moon VALUES (12, 'Proxima-b II', 7, 1400, true, 'Fictional moon');
INSERT INTO public.moon VALUES (13, 'Sirius-I Alpha', 8, 1600, true, 'Fictional moon');
INSERT INTO public.moon VALUES (14, 'Sirius-II Delta', 9, 2300, true, 'Fictional moon');
INSERT INTO public.moon VALUES (15, 'Andromeda Prime A', 10, 900, true, 'Moon in Andromeda system');
INSERT INTO public.moon VALUES (16, 'Andromeda Prime B', 10, 700, true, 'Moon in Andromeda system');
INSERT INTO public.moon VALUES (17, 'Triangulum-1 A', 11, 1400, true, 'Moon in Triangulum system');
INSERT INTO public.moon VALUES (18, 'Triangulum-1 B', 11, 1000, true, 'Second moon');
INSERT INTO public.moon VALUES (19, 'Whirlpool-7 A', 12, 500, true, 'Rocky moon');
INSERT INTO public.moon VALUES (20, 'Whirlpool-7 B', 12, 620, true, 'Second moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Rocky', 57.9, false, 330);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Rocky', 108.2, false, 4870);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Rocky', 149.6, true, 5972);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Rocky', 227.9, false, 641);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 778.5, false, 1898000);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 1430, false, 568000);
INSERT INTO public.planet VALUES (7, 'Proxima b', 2, 'Rocky', 7.5, false, 1200);
INSERT INTO public.planet VALUES (8, 'Sirius I', 3, 'Ice Giant', 1500, false, 20000);
INSERT INTO public.planet VALUES (9, 'Sirius II', 3, 'Gas Giant', 3000, false, 300000);
INSERT INTO public.planet VALUES (10, 'Andromeda Prime', 4, 'Rocky', 120, false, 3200);
INSERT INTO public.planet VALUES (11, 'Triangulum-1', 5, 'Gas Giant', 900, false, 900000);
INSERT INTO public.planet VALUES (12, 'Whirlpool-7', 6, 'Rocky', 400, false, 4100);


--
-- Data for Name: planet_type_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type_info VALUES (1, 'Rocky', 'Solid-surface terrestrial planet');
INSERT INTO public.planet_type_info VALUES (2, 'Gas Giant', 'Large planets dominated by gas');
INSERT INTO public.planet_type_info VALUES (3, 'Ice Giant', 'Planets with icy compositions');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 4600, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red Dwarf', 4500, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Main Sequence', 240, true);
INSERT INTO public.star VALUES (4, 'Andromeda Star A', 2, 'Blue Giant', 500, true);
INSERT INTO public.star VALUES (5, 'Triangulum Star A', 3, 'Red Giant', 1000, true);
INSERT INTO public.star VALUES (6, 'Whirlpool Star X', 5, 'White Dwarf', 800, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_info_planet_type_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_info_planet_type_info_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type_info planet_type_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_info
    ADD CONSTRAINT planet_type_info_name_key UNIQUE (name);


--
-- Name: planet_type_info planet_type_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type_info
    ADD CONSTRAINT planet_type_info_pkey PRIMARY KEY (planet_type_info_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

