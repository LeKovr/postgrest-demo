-- Deploy pgrest1:insert_data to pg
-- requires: film
-- requires: appschema

BEGIN;

SET search_path = film, pg_catalog;

--
-- Data for Name: festival; Type: TABLE DATA; Schema: film; Owner: jonathan
--

COPY festival (name) FROM stdin;
Venice Film Festival
Cannes Film Festival
\.


--
-- Data for Name: competition; Type: TABLE DATA; Schema: film; Owner: jonathan
--

COPY competition (id, name, festival, year) FROM stdin;
1	Golden Lion	Venice Film Festival	2014-01-01
2	Palme d'Or	Cannes Film Festival	2014-01-01
\.
-- '

--
-- Name: competition_id_seq; Type: SEQUENCE SET; Schema: film; Owner: jonathan
--
SELECT pg_catalog.setval('competition_id_seq', 2, true);
--
-- Data for Name: director; Type: TABLE DATA; Schema: film; Owner: jonathan
--
COPY director (name) FROM stdin;
Bertrand Bonello
Atom Egoyan
David Gordon Green
Andrey Konchalovskiy
Mario Martone
Mike Leigh
Roy Andersson
Saverio Costanzo
Alix Delaporte
Jean-Pierre Dardenne
Xiaoshuai Wang
Kaan Müjdeci
Tommy Lee Jones
Nuri Bilge Ceylan
Michel Hazanavicius
Xavier Dolan
Ramin Bahrani
Alice Rohrwacher
Andrew Niccol
Rakhshan Bani-Etemad
David Oelhoffen
Bennett Miller
David Cronenberg
Shin'ya Tsukamoto
Joshua Oppenheimer
Olivier Assayas
Jean-Luc Godard
Alejandro González Iñárritu
Benoît Jacquot
Fatih Akin
Francesco Munzi
Ken Loach
Abel Ferrara
Xavier Beauvois
Naomi Kawase
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: film; Owner: jonathan
--

COPY film (id, title, year, director, rating, language) FROM stdin;
1	Chuang ru zhe	2014-01-01	Xiaoshuai Wang	6.19999981	english
2	The Look of Silence	2014-01-01	Joshua Oppenheimer	8.30000019	Indonesian
3	Fires on the Plain	2014-01-01	Shin'ya Tsukamoto	5.80000019	Japanese
4	Far from Men	2014-01-01	David Oelhoffen	7.5	english
5	Good Kill	2014-01-01	Andrew Niccol	6.0999999	english
6	Leopardi	2014-01-01	Mario Martone	6.9000001	english
7	Sivas	2014-01-01	Kaan Müjdeci	7.69999981	english
8	Black Souls	2014-01-01	Francesco Munzi	7.0999999	english
9	Three Hearts	2014-01-01	Benoît Jacquot	5.80000019	French
10	Pasolini	2014-01-01	Abel Ferrara	5.80000019	english
11	Le dernier coup de marteau	2014-01-01	Alix Delaporte	6.5	english
12	Manglehorn	2014-01-01	David Gordon Green	7.0999999	english
13	Hungry Hearts	2014-01-01	Saverio Costanzo	6.4000001	English
14	Belye nochi pochtalona Alekseya Tryapitsyna	2014-01-01	Andrey Konchalovskiy	6.9000001	Russian
15	99 Homes	2014-01-01	Ramin Bahrani	7.30000019	english
16	The Cut	2014-01-01	Fatih Akin	6	Armenian
17	Birdman: Or (The Unexpected Virtue of Ignorance)	2014-01-01	Alejandro González Iñárritu	8	English
18	La rançon de la gloire	2014-01-01	Xavier Beauvois	5.69999981	French
19	A Pigeon Sat on a Branch Reflecting on Existence	2014-01-01	Roy Andersson	7.19999981	english
20	Tales	2014-01-01	Rakhshan Bani-Etemad	6.80000019	english
21	The Wonders	2014-01-01	Alice Rohrwacher	6.80000019	Italian
22	Foxcatcher	2014-01-01	Bennett Miller	7.19999981	English
23	Mr. Turner	2014-01-01	Mike Leigh	7	English
24	Jimmy's Hall	2014-01-01	Ken Loach	6.69999981	English
25	The Homesman	2014-01-01	Tommy Lee Jones	6.5999999	English
26	The Captive	2014-01-01	Atom Egoyan	5.9000001	english
27	Goodbye to Language	2014-01-01	Jean-Luc Godard	6.19999981	French
28	The Search	2014-01-01	Michel Hazanavicius	6.9000001	French
29	Still the Water	2014-01-01	Naomi Kawase	6.9000001	Japanese
30	Mommy	2014-01-01	Xavier Dolan	8.30000019	French
31	Two Days, One Night	2014-01-01	Jean-Pierre Dardenne	7.4000001	French
32	Maps to the Stars	2014-01-01	David Cronenberg	6.4000001	English
33	Saint Laurent	2014-01-01	Bertrand Bonello	6.5	French
34	Clouds of Sils Maria	2014-01-01	Olivier Assayas	6.9000001	english
35	Winter Sleep	2014-01-01	Nuri Bilge Ceylan	8.5	Turkish
\.


--
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: film; Owner: jonathan
--

SELECT pg_catalog.setval('film_id_seq', 35, true);


--
-- Data for Name: nominations; Type: TABLE DATA; Schema: film; Owner: jonathan
--

COPY nominations (id, competition, film, won) FROM stdin;
1	1	1	f
2	1	2	f
3	1	3	f
4	1	4	f
5	1	5	f
6	1	6	f
7	1	7	f
8	1	8	f
9	1	9	f
10	1	10	f
11	1	11	f
12	1	12	f
13	1	13	f
14	1	14	f
15	1	15	f
16	1	16	f
17	1	17	f
18	1	18	f
19	1	19	f
20	1	20	f
21	2	21	f
22	2	22	f
23	2	23	f
24	2	24	f
25	2	25	f
26	2	26	f
27	2	27	f
28	2	28	f
29	2	29	f
30	2	30	f
31	2	31	f
32	2	32	f
33	2	33	f
34	2	34	f
35	2	35	f
\.


--
-- Name: nominations_id_seq; Type: SEQUENCE SET; Schema: film; Owner: jonathan
--

SELECT pg_catalog.setval('nominations_id_seq', 35, true);

COMMIT;
