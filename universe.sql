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
    total_stars integer,
    total_planets integer,
    mass numeric(20,2),
    description text
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
    rotation_per_month integer,
    rotation_per_year integer,
    surface_temp numeric(20,2),
    description text,
    planet_id integer
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
    total_moons integer,
    total_rings integer,
    surface_temp numeric(20,2),
    description text,
    has_life boolean,
    has_water boolean,
    star_id integer,
    planet_types_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_years integer,
    orbit_period_in_years integer,
    surface_temp numeric(10,2),
    description text,
    galaxy_id integer
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 300, 400, 3933993.32, 'this is where earth is');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 84, 943, 752834783.22, 'random galaxy');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 322, 332, 347344834.33, 'does it really matter');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 333, 238, 3738438748.33, 'the whirlpool company came from this galaxy');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 213, 323, 74348734.22, 'what to do with this one');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 202, 333, 9489458.22, 'interesting galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (14, 'Luna1', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (15, 'Luna2', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (16, 'Luna22', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (17, 'Luna3', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (18, 'Luna4', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (19, 'Luna5', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (20, 'Luna6', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (21, 'Luna7', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (22, 'Luna8', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (23, 'Luna9', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (24, 'Luna10', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (25, 'Luna11', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (26, 'Luna12', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (27, 'Luna13', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (28, 'Luna14', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (29, 'Luna15', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (30, 'Luna16', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (31, 'Luna123', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (32, 'Luna133', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (33, 'Luna143', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (34, 'Luna153', 11, 222, 23.00, 'luna moon', 1);
INSERT INTO public.moon VALUES (35, 'Luna163', 11, 222, 23.00, 'luna moon', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 0, 430.00, 'closest to sun', false, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 0, 465.00, 'second planet', false, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 0, 15.00, 'our planet', true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 0, -63.00, 'where we are searching for life', false, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 1, 0.00, 'full of gas', false, false, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 1, 0.00, 'full of gas', false, false, 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 1, 0.00, 'full of ice', false, false, 1, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 1, 0.00, 'full of ice', false, false, 1, 3);
INSERT INTO public.planet VALUES (9, 'Lumoria', 3, 5, 15.00, 'imaginary', true, true, 2, 1);
INSERT INTO public.planet VALUES (10, 'Zyphoria Prime', 4, 2, 22.00, 'imaginary', false, true, 2, 2);
INSERT INTO public.planet VALUES (11, 'Uranususss', 27, 1, 0.00, 'full of ice', false, false, 4, 3);
INSERT INTO public.planet VALUES (12, 'Neptunenne', 14, 1, 0.00, 'full of ice', false, false, 5, 2);
INSERT INTO public.planet VALUES (13, 'Lumoriassa', 3, 5, 15.00, 'imaginary', true, true, 6, 1);
INSERT INTO public.planet VALUES (14, 'Zyphoria Primerule', 4, 2, 22.00, 'imaginary', false, true, 2, 2);
INSERT INTO public.planet VALUES (15, 'Nebulon 22', 3, 2, 33.00, 'fictional', false, false, 3, 3);
INSERT INTO public.planet VALUES (16, 'Mercuryuss', 0, 0, 430.00, 'closest to sun', false, true, 4, 1);
INSERT INTO public.planet VALUES (17, 'Venusiisss', 0, 0, 465.00, 'second planet', false, false, 4, 1);
INSERT INTO public.planet VALUES (18, 'Earthessa', 1, 0, 15.00, 'our planet', true, true, 5, 1);
INSERT INTO public.planet VALUES (19, 'Marskule', 2, 0, -63.00, 'where we are searching for life', false, true, 3, 1);
INSERT INTO public.planet VALUES (20, 'Jupiteressa', 79, 1, 0.00, 'full of gas', false, false, 2, 2);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'terrestrial planets', 'full of rocks, closer to sun');
INSERT INTO public.planet_types VALUES (2, 'jovian planets', 'full of gas, away to sun');
INSERT INTO public.planet_types VALUES (3, 'ice giants', 'full of ice, away to sun');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 22020, 12, 4332.22, 'our solar system star', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 99393, 222, 292.22, 'consist of 3 stars', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 302930, 112, 383.22, 'brightest star', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2293922, 123, 433.03, 'red star', 1);
INSERT INTO public.star VALUES (5, 'Rigel', 22020, 12, 4332.22, 'our solar system star', 3);
INSERT INTO public.star VALUES (6, 'Procyon', 99393, 222, 292.22, 'consist of 3 stars', 2);
INSERT INTO public.star VALUES (7, 'Altair', 302930, 112, 383.22, 'brightest star', 1);
INSERT INTO public.star VALUES (8, 'Vega', 2293922, 123, 433.03, 'red star', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: planet_types unique_planet_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_planet_type_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_rotates_around_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_rotates_around_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet planet_rotates_around_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_rotates_around_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

