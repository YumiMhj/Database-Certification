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
    name character varying(50) NOT NULL,
    shape character varying(20),
    size integer,
    other_names character varying(30)
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
-- Name: junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    junction_id integer NOT NULL,
    name character varying(5)
);


ALTER TABLE public.junction OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    random integer,
    is_spherical boolean,
    random2 integer
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
    name character varying(20) NOT NULL,
    has_life boolean,
    planet_types text,
    description character varying(100),
    galaxy_id integer
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
    visibile_from_earth boolean,
    size_times_sun numeric(4,1),
    discovered_date integer
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Sprial', 220000, 'M31, NGC 224');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Sprial', 100000, 'Milky Wheel, Ganges of Sky');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Sprial', 60000, 'M51, NGC 5194');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombero', 'Elliptical', NULL, 'M104');


--
-- Data for Name: junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction VALUES (8, 3, 2, NULL);
INSERT INTO public.junction VALUES (1, 1, 20, NULL);
INSERT INTO public.junction VALUES (8, 2, 22, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'marI', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'marII', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Arche', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Autonoe', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Carpo', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Elara', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Chaldene', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Carme', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Dia', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Euanthe', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Eirene', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Charon', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Hydra', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Kerberos', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Nix', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Styx', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Despina', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Galatea', NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Naiad', NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Satrun', false, 'Gas Gaints', 'Second Largest', NULL);
INSERT INTO public.planet VALUES (5, 'Neptune', false, 'Gas Gaints', 'smallest planet', NULL);
INSERT INTO public.planet VALUES (6, 'Pluto', NULL, 'dwarf', NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Venus', NULL, 'Terrestial', NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Mars', NULL, 'Terrestial', NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', NULL, 'Terrestial', NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Ceres', NULL, 'dwarf', NULL, NULL);
INSERT INTO public.planet VALUES (1, 'EARTH', true, 'Terrestial', 'fifth largest planet', 2);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, 'Gas gaints', 'largest planet', 2);
INSERT INTO public.planet VALUES (3, 'Uranus', false, 'Ice gaints', 'third largest planet and first planet found with the aid of telescope', 2);
INSERT INTO public.planet VALUES (10, 'haumea', NULL, 'dwarf', NULL, 3);
INSERT INTO public.planet VALUES (12, 'Eris', NULL, 'dwarf', NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima centauri', false, 0.1, NULL);
INSERT INTO public.star VALUES (2, 'SIRIUS B', false, 0.0, NULL);
INSERT INTO public.star VALUES (3, 'Sun', true, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Pollux', NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Arcturus', NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'VY Canis Majoris', NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction junction_junction_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_junction_id_key UNIQUE (junction_id);


--
-- Name: junction junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_pkey PRIMARY KEY (junction_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: planet fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

