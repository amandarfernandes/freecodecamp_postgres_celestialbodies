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
    name character varying(35) NOT NULL,
    naked_eye_galaxy boolean,
    distance_from_earth_in_million_light_years numeric(7,3),
    diameter_kilparsecs numeric(7,3),
    apparent_magnitude numeric(4,2),
    description text,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    axes_difference_km numeric(5,2),
    planet_id integer,
    avg_orbital_speed_kms numeric(6,3),
    inclination_equator_degree numeric(5,3),
    inclination_elliptic_degree numeric(5,3)
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
    diameter_km integer,
    day_hours integer,
    has_life boolean,
    planet_type character varying(30),
    star_id integer
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
    galaxy_id integer,
    constellation text,
    apparent_magnitude numeric(4,2)
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (3, 'CartWheel Galaxy', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (4, 'Virgo A Galaxy', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES (7, 'NGC 7025', NULL, NULL, NULL, NULL, NULL, 2);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral Galaxy', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Lenticular Galaxy', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical Galaxy', NULL);
INSERT INTO public.galaxy_type VALUES (4, 'Irregular Galaxy', NULL);
INSERT INTO public.galaxy_type VALUES (5, 'Barred Spiral Galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Ganymede', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Deimos', NULL, 9, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Phobos', NULL, 9, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Mimas', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Phoebe', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Triton', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Larissa', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Despina', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Hippocamp', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Proteus', NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Telesto', NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Charon', NULL, 10, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Hydra', NULL, 10, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, 'Terrestrial', 5);
INSERT INTO public.planet VALUES (2, 'Jupiter', NULL, NULL, NULL, 'Jovian Gas Giant', 5);
INSERT INTO public.planet VALUES (3, 'Uranus', NULL, NULL, NULL, 'Jovian Ice Giant', 5);
INSERT INTO public.planet VALUES (4, 'Spe', NULL, NULL, NULL, 'Exoplanet', 6);
INSERT INTO public.planet VALUES (5, 'Neptune', NULL, NULL, NULL, 'Jovian Ice Giant', 5);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, 'Jovian Gas Giant', 5);
INSERT INTO public.planet VALUES (7, 'Mercury', NULL, NULL, NULL, 'Terrestrial', 5);
INSERT INTO public.planet VALUES (8, 'Venus', NULL, NULL, NULL, 'Terrestrial', 5);
INSERT INTO public.planet VALUES (9, 'Mars', NULL, NULL, NULL, 'Terrestrial', 5);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, NULL, NULL, 'Dwarf', 5);
INSERT INTO public.planet VALUES (11, 'Arion', NULL, NULL, NULL, 'Extrasolar', 7);
INSERT INTO public.planet VALUES (12, 'Galileo', NULL, NULL, NULL, 'Gas giant exoplanet', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'Canis Major', -1.46);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 'Andromeda', 2.06);
INSERT INTO public.star VALUES (3, 'Alpha Tucanae', 5, 'Tucana', 2.86);
INSERT INTO public.star VALUES (4, 'Spica', 6, 'Virgo', 0.97);
INSERT INTO public.star VALUES (5, 'Sun', 1, 'Sagittarius', -26.74);
INSERT INTO public.star VALUES (6, 'Veritate', 2, 'Andromeda', 5.22);
INSERT INTO public.star VALUES (7, 'Musica', 7, 'Delphinus', 5.51);
INSERT INTO public.star VALUES (8, '55 Cancri', 1, 'Cancer', 13.15);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
