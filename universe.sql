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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    name character varying(60),
    comets_id integer NOT NULL,
    description text,
    light_yrs_from_earth numeric NOT NULL,
    earth_destroying boolean NOT NULL
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    light_yrs_from_earth numeric,
    description text,
    num_of_celestial_bodies text
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
    name character varying(60) NOT NULL,
    light_yrs_from_earth numeric,
    planet character varying(60),
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
    name character varying(60) NOT NULL,
    light_yrs_from_earth numeric,
    num_of_moons integer,
    may_have_life boolean,
    star character varying(60),
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
    name character varying(60) NOT NULL,
    galaxy character varying(60),
    galaxy_id integer,
    light_yrs_from_earth numeric
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
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


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
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES ('Hale-Bopp', 3, 'One of the brightest comets observed, it is between Jupiter and Saturn', 0.0000152, true);
INSERT INTO public.comets VALUES ('Bernardinelli-Bernstein', 4, 'Largest comet nucleus ever seen', 0.0002686, true);
INSERT INTO public.comets VALUES ('Devil Comet', 5, 'Discovered in 1812, bigger than Mount Everest, and drifiting towards Earth we should be very afraid. Contact me about a life-saving ointment that prevents comet strikes.a', 2.5, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy', 11500000, 'Shines brightly and forms stars 10 times faster than the Milky Way', '30000000000');
INSERT INTO public.galaxy VALUES (9, 'Pinwheel Galaxy', 20870000, 'Has a large population of bright and large areas. More than double the length of our galaxy', '1000000000000');
INSERT INTO public.galaxy VALUES (10, 'Sombrero Galaxy', 29350000, 'It has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its outer disk', '1000000000');
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 25000000, 'The same type of galaxy as the Milky Way, and our closest neighbor.', '1000000000');
INSERT INTO public.galaxy VALUES (2, 'Whirlpool Galaxy', 30000000, 'Both itself and its companion are easily observed by amateur astronomers. The first galaxy to be classified as a Spiral.', '1000000000');
INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 0, 'Both our home galaxy, and a delicious candy bar.', '2000000000');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Ganymede', 0.0000075, 'Jupiter', 'The largest of Jupiter''s satellites. Potentially holding more water than Earth, this moon has a strong gravitational field.', 4);
INSERT INTO public.moon VALUES (6, 'Callisto', 0.0000075, 'Jupiter', 'It''s heavily cratered surface is the oldest object in our solar system. Jupiter''s second largest moon.', 4);
INSERT INTO public.moon VALUES (3, 'Europa', 0.0000075, 'Jupiter', 'Has a vast saltwater ocean that may be capable of sustaining life. One of Jupiter''s largest moons', 4);
INSERT INTO public.moon VALUES (7, 'The Moon', 0.000000004, 'Earth', 'The brightest object in our night sky, our moon helps to stabilize our rotation and environment, making Earth more livable.', 3);
INSERT INTO public.moon VALUES (4, 'IO', 0.0000075, 'Jupiter', 'Jupiter''s third largest moon, and the most volcanically active world in our solar system.', 4);
INSERT INTO public.moon VALUES (14, 'Phobos', 0.0000058, 'Mars', 'the innermost and larger of the two natural satellites of Mars', 5);
INSERT INTO public.moon VALUES (15, 'Deimos', 0.0000058, 'Mars', 'small, lumpy, and heavily-cratered. Mar''s smaller moon is only a few miles across', 5);
INSERT INTO public.moon VALUES (16, 'Miranda', 0.0003028, 'Uranus', 'Perhaps the smallest observed object in our solar system that is made spherical by its own gravity', 7);
INSERT INTO public.moon VALUES (11, 'Charon', 0.0006240, 'Pluto', 'Pluto''s largest moon, and half the size of Pluto.', 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 0.0001347, 'Saturn', 'Saturn''s smallest and innermost moon, its ovoid shape is due to the fact that it''s too small to hold a sphere shape.', 1);
INSERT INTO public.moon VALUES (10, 'Triton', 0.0001347, 'Saturn', 'Thought to be a dwarf planet captured from the Kuiper Belt, due to its retrograde orbit.', 1);
INSERT INTO public.moon VALUES (5, 'Hyperian', 0.0001347, 'Saturn', 'It is distinguished by its irregular shape, its chaotic rotation, and its unexplained sponge-like appearance.', 1);
INSERT INTO public.moon VALUES (12, 'Dione', 0.0001347, 'Saturn', 'Roughly the same size as the moon that orbits our planet.', 1);
INSERT INTO public.moon VALUES (13, 'Atlas', 0.0001347, 'Saturn', 'Has an odd ridge on the equatorial line, thought due to the collection of material from Saturn''s rings', 1);
INSERT INTO public.moon VALUES (2, 'Titan', 0.0001347, 'Saturn', 'With a thick, nitrogen-rich atmosphere and only 1.2 Billion km from Earth--Titan is the only other planet in our Solar System that could support human life', 1);
INSERT INTO public.moon VALUES (21, 'PAN', 0.0001347, 'Saturn', 'With a circumference less than 150km, this walnut-shaped moon is Saturn''s innermost named moon.', 1);
INSERT INTO public.moon VALUES (20, 'Epimethus', 0.0001347, 'Saturn', 'Appears to be a porous, icy body. This moon shares a horseshoe shaped orbit with Janus.', 1);
INSERT INTO public.moon VALUES (19, 'Rhea', 0.0001347, 'Saturn', 'This icy planet is likely comprised of ~75% water. It is the ninth largest in the solar system. Oxygen is present here.', 1);
INSERT INTO public.moon VALUES (18, 'Tethys', 0.0001347, 'Saturn', 'Comprised mainly of water ice. Heavily cratered, this small moon may have cryovolcanic activity', 1);
INSERT INTO public.moon VALUES (17, 'Iapetus', 0.0001347, 'Saturn', 'Described as the yin and yang of Saturn''s moons. One side is brightly reflective, while the other as dark as coal.', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Kepler−442b', 1206, 0, true, 'Kepler 442', 8);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1E', 39.46, 0, true, 'TRAPPIST 1', 9);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 4.246, 0, true, 'Proxima Centauri', 10);
INSERT INTO public.planet VALUES (10, 'Gliese 667 Cc', 23.16, 0, true, 'Gliese 667 C', 11);
INSERT INTO public.planet VALUES (1, 'Saturn', 0.0001347, 146, false, 'The Sun', 1);
INSERT INTO public.planet VALUES (6, 'Pluto', 0.0006240, 5, false, 'The Sun', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 0.0000075, 95, false, 'The Sun', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 0.0003028, 27, false, 'The Sun', 1);
INSERT INTO public.planet VALUES (5, 'Mars', 0.0000058, 2, false, 'The Sun', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0, 1, true, 'The Sun', 1);
INSERT INTO public.planet VALUES (2, 'M51-ULS-1b', 23000000, 0, false, 'Undiscovered', 7);
INSERT INTO public.planet VALUES (9, 'OGLE-2005-BLG-390', 21530, 0, false, 'OGLE-2005-BLG-390L', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'Milky Way Galaxy', 1, 0.00001578);
INSERT INTO public.star VALUES (8, 'Kepler 442', 'Milky Way Galaxy', 1, 1206);
INSERT INTO public.star VALUES (10, 'Proxima Centauri', 'Milky Way Galaxy', 1, 4.246);
INSERT INTO public.star VALUES (11, 'Gliese 667 C', 'Milky Way Galaxy', 1, 23.16);
INSERT INTO public.star VALUES (9, 'TRAPPIST 1', 'Milky Way Galaxy', 1, 39.46);
INSERT INTO public.star VALUES (2, 'MEGA-ML 7', 'Andromeda Galaxy', 3, 2500000);
INSERT INTO public.star VALUES (7, 'Undiscovered', 'Whirlpool Galaxy', 2, 23000000);
INSERT INTO public.star VALUES (12, 'OGLE-2005-BLG-390L', 'Milky Way Galaxy', 1, 25000);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_id UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: comets unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


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

