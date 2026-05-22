--
-- PostgreSQL database dump
--

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.2

-- Started on 2026-05-22 15:06:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 228 (class 1259 OID 16427)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16426)
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.brands ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16441)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16440)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16472)
-- Name: categories_in_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_in_products (
    id integer NOT NULL,
    product_id integer,
    category_id integer
);


ALTER TABLE public.categories_in_products OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16471)
-- Name: categories_in_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories_in_products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_in_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 16496)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_date character varying(255),
    delivery_date character varying(255),
    pickup_point_id integer,
    user_id integer,
    code integer,
    status_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16495)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16411)
-- Name: pickup_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_point (
    id integer NOT NULL,
    index integer,
    city character varying(255),
    street character varying(255),
    building integer
);


ALTER TABLE public.pickup_point OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16410)
-- Name: pickup_point_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pickup_point ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pickup_point_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16448)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    article character varying(255),
    name character varying(255),
    unit_id integer,
    price integer,
    brand_id integer,
    type_id integer,
    discount integer,
    quantity integer,
    description text,
    photo character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16447)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 16520)
-- Name: products_in_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_in_orders (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer
);


ALTER TABLE public.products_in_orders OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16519)
-- Name: products_in_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products_in_orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_in_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16489)
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16488)
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.statuses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16434)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16433)
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16420)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.units OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16419)
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.units ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16397)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer,
    surname character varying(255),
    name character varying(255),
    father_name character varying(255),
    login character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16396)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5102 (class 0 OID 16427)
-- Dependencies: 228
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brands OVERRIDING SYSTEM VALUE VALUES (1, 'Сладкая радость
');
INSERT INTO public.brands OVERRIDING SYSTEM VALUE VALUES (2, 'Вкусный дом
');
INSERT INTO public.brands OVERRIDING SYSTEM VALUE VALUES (3, 'Тортэйшн
');
INSERT INTO public.brands OVERRIDING SYSTEM VALUE VALUES (4, 'Фруттиссимо
');
INSERT INTO public.brands OVERRIDING SYSTEM VALUE VALUES (5, 'Кексик и Ко
');


--
-- TOC entry 5106 (class 0 OID 16441)
-- Dependencies: 232
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (1, 'Праздничный');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (2, 'День рождения');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (3, 'Любой повод');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (4, 'Юбилей');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (5, 'Для него');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (6, 'Летний');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (7, 'Детский праздник');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (8, 'Для нее');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (9, 'Здоровое питание');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (10, 'Фуршет');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (11, 'Свадьба');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (12, 'Для взрослых');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (13, 'Свадебный');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (14, 'Романтический ужин');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (15, 'Чайный стол');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (16, 'Весенний праздник');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (17, 'Для аллергиков');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (18, 'Кофе-брейк');


--
-- TOC entry 5110 (class 0 OID 16472)
-- Dependencies: 236
-- Data for Name: categories_in_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (2, 2, 2);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (3, 3, 3);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (4, 4, 4);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (5, 5, 5);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (6, 6, 6);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (7, 6, 11);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (8, 7, 1);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (9, 8, 7);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (10, 9, 8);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (11, 10, 9);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (12, 11, 10);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (13, 11, 18);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (14, 12, 11);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (15, 13, 7);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (16, 14, 12);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (17, 15, 13);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (18, 16, 14);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (19, 17, 15);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (20, 18, 16);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (21, 19, 1);
INSERT INTO public.categories_in_products OVERRIDING SYSTEM VALUE VALUES (22, 20, 17);


--
-- TOC entry 5114 (class 0 OID 16496)
-- Dependencies: 240
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (1, '2025-03-15', '2025-03-16', 1, 7, 7348, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (2, '2025-03-20', '2025-03-21', 11, 8, 8921, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (3, '2025-03-25', '2025-03-26', 2, 9, 1567, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (4, '2025-03-28', '2025-03-29', 11, 10, 3402, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (5, '2025-04-01', '2025-04-02', 2, 7, 5198, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (6, '2025-04-03', '2025-04-04', 15, 8, 6734, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (7, '2025-04-05', '2025-04-06', 3, 9, 2815, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (8, '2025-04-07', '2025-04-08', 19, 10, 4963, 2);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (9, '2025-04-08', '2025-04-09', 5, 7, 8270, 2);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (10, '2025-04-09', '2025-04-10', 19, 8, 1389, 2);


--
-- TOC entry 5098 (class 0 OID 16411)
-- Dependencies: 224
-- Data for Name: pickup_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (1, 420151, 'Сладкий', 'Тортовая', 15);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (2, 125061, 'Сладкий', 'Кремовая', 8);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (3, 630370, 'Сладкий', 'Кондитерская', 24);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (4, 400562, 'Сладкий', 'Шоколадная', 32);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (5, 614510, 'Сладкий', 'Пирожная', 47);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (6, 410542, 'Сладкий', 'Вафельная', 46);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (7, 620839, 'Сладкий', 'Ягодная', 8);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (8, 443890, 'Сладкий', 'Сахарная', 1);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (9, 603379, 'Сладкий', 'Бисквитная', 46);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (10, 603721, 'Сладкий', 'Десертная', 41);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (11, 410172, 'Сладкий', 'Фруктовая', 13);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (12, 614611, 'Сладкий', 'Медовая', 50);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (13, 454311, 'Сладкий', 'Пряничная', 19);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (14, 660007, 'Сладкий', 'Карамельная', 19);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (15, 603036, 'Сладкий', 'Вишневая', 4);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (16, 394060, 'Сладкий', 'Ореховая', 43);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (17, 410661, 'Сладкий', 'Кексовая', 50);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (18, 625590, 'Сладкий', 'Сливовая', 20);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (19, 625683, 'Сладкий', '8 Марта', 12);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (20, 450983, 'Сладкий', 'Муссовая', 26);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (21, 394782, 'Сладкий', 'Пироговая', 3);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (22, 603002, 'Сладкий', 'Эклерная', 28);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (23, 450558, 'Сладкий', 'Наполеоновская', 30);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (24, 344288, 'Сладкий', 'Чизкейковая', 1);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (25, 614164, 'Сладкий', 'Кексовая', 30);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (26, 394242, 'Сладкий', 'Пралине', 43);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (27, 660540, 'Сладкий', 'Солнечная', 25);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (28, 125837, 'Сладкий', 'Шоколадная', 40);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (29, 125703, 'Сладкий', 'Марципановая', 49);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (30, 625283, 'Сладкий', 'Пирожковая', 46);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (31, 614753, 'Сладкий', 'Ванильная', 35);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (32, 426030, 'Сладкий', 'Карамельная', 44);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (33, 450375, 'Сладкий', 'Клубничная', 44);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (34, 625560, 'Сладкий', 'Ореховая', 12);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (35, 630201, 'Сладкий', 'Миндальная', 17);
INSERT INTO public.pickup_point OVERRIDING SYSTEM VALUE VALUES (36, 190949, 'Сладкий', 'Кокосовая', 26);


--
-- TOC entry 5108 (class 0 OID 16448)
-- Dependencies: 234
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (1, 'T001C1', 'Наполеон', 1, 2190, 1, 1, 5, 8, 'Классический торт Наполеон с заварным кремом и слоеными коржами, 2 кг', 'napoleon.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (2, 'T002F4', 'Красный бархат', 1, 3244, 2, 2, 2, 13, 'Яркий бисквит с какао и сливочно-сырным кремом Чизкейк, 1.8 кг', 'red_velvet.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (3, 'T003B5', 'Медовик', 1, 4499, 1, 3, 4, 5, 'Нежный торт с медовыми коржами и сметанным кремом, 2 кг', 'medovik.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (4, 'T004R7', 'Птичье молоко', 1, 3900, 3, 4, 2, 8, 'Воздушное суфле на агар-агаре и шоколадная глазурь по ГОСТу, 1.5 кг', 'ptichye_moloko.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (5, 'T005M3', 'Трюфельный', 1, 3800, 2, 5, 2, 16, 'Шоколадный торт с нежным муссом и карамельной прослойкой, 1.7 кг', 'truffel.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (6, 'T006K8', 'Фруктовый рай', 1, 4100, 4, 6, 3, 6, 'Легкий бисквит с йогуртовым кремом и свежими сезонными ягодами, 2 кг', 'fruit_paradise.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (7, 'T007H7', 'Прага', 1, 2700, 1, 7, 2, 14, 'Шоколадный торт по рецепту пражского ресторана, с абрикосовым конфитюром, 1.6 кг', 'prague.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (8, 'T008H3', 'Капкейки Ассорти (12 шт.)', 1, 1890, 5, 8, 4, 4, 'Набор из 12 капкейков с разными начинками и украшениями', 'cupcakes.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (9, 'T009R5', 'Сникерс', 1, 4300, 2, 9, 2, 6, 'Торт-десерт на основе знаменитого батончика: арахис, нуга, карамель, шоколад, 1.8 кг', 'snickers.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (10, 'T010E4', 'Морковный торт', 1, 2800, 1, 10, 3, 15, 'Влажный бисквит с морковью, орехами и сливочным сыром, 1.5 кг', 'carrot_cake.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (11, 'T011E3', 'Чизкейк Нью-Йорк', 1, 3556, 3, 11, 3, 6, 'Классический выпеченный чизкейк на песочной основе, 1.2 кг', 'ny_cheesecake.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (12, 'T012B5', 'Малиновый меридиан', 1, 3800, 4, 12, 2, 14, 'Нежное малиновое муссовое кольцо на миндальном бисквите, 1.6 кг', 'raspberry_mousse.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (13, 'T013R4', 'Детский Смешарики', 1, 5500, 2, 13, 3, 6, 'Торт в виде любимых персонажей, цветной бисквит, сливочный крем, 2.5 кг', 'smeshariki.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (14, 'T014F4', 'Кофейный Гляссе', 1, 2100, 3, 14, 2, 3, 'Торт со вкусом кофе гляссе, кофейные коржи и нежный крем, 1.4 кг', 'coffee_glace.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (15, 'T015F5', 'Свадебная феерия (3 яруса)', 1, 15400, 2, 15, 4, 1, 'Трехъярусный свадебный торт с ванильным муссом и цветочным декором из мастики, 7 кг', 'wedding_cake.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (16, 'T016F4', 'Тирамису', 1, 4600, 1, 16, 2, 9, 'Классическое тирамису на основе маскарпоне, савоярди и кофе, 1.5 кг', 'tiramisu.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (17, 'T017R5', 'Пирожное Картошка (10 шт.)', 1, 900, 5, 17, 3, 12, 'Набор из 10 пирожных Картошка, посыпанных какао', 'kartoshka.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (18, 'T018G4', 'Лимонный курд', 1, 6800, 4, 18, 3, 15, 'Освежающий торт с лимонным курдом, безе и хрустящим слоем, 1.8 кг', 'lemon_curd.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (19, 'T019G5', 'Черный лес', 1, 4200, 3, 19, 2, 9, 'Немецкий торт с шоколадными бисквитами, вишней и взбитыми сливками, 2 кг', 'black_forest.jpg');
INSERT INTO public.products OVERRIDING SYSTEM VALUE VALUES (20, 'T020R5', 'Безглютеновый шоколадный', 1, 4800, 2, 20, 4, 11, 'Богатый шоколадный торт на миндальной муке, без глютена и лактозы, 1.5 кг', 'gluten_free.jpg');


--
-- TOC entry 5116 (class 0 OID 16520)
-- Dependencies: 242
-- Data for Name: products_in_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 2);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (2, 2, 3, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (3, 3, 5, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (4, 4, 7, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (5, 5, 9, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (6, 6, 11, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (7, 7, 13, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (8, 8, 15, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (9, 9, 17, 3);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (10, 10, 19, 2);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (11, 1, 2, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (12, 2, 4, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (13, 3, 6, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (14, 4, 8, 2);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (15, 5, 10, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (16, 6, 12, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (17, 7, 14, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (18, 8, 16, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (19, 9, 18, 1);
INSERT INTO public.products_in_orders OVERRIDING SYSTEM VALUE VALUES (20, 10, 20, 1);


--
-- TOC entry 5094 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (1, 'Администратор
');
INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (2, 'Менеджер
');
INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (3, 'Авторизированный клиент
');


--
-- TOC entry 5112 (class 0 OID 16489)
-- Dependencies: 238
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.statuses OVERRIDING SYSTEM VALUE VALUES (1, 'Завершен
');
INSERT INTO public.statuses OVERRIDING SYSTEM VALUE VALUES (2, 'Новый
');


--
-- TOC entry 5104 (class 0 OID 16434)
-- Dependencies: 230
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (1, 'Классический бисквитный');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (2, 'Американский');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (3, 'Классический медовый');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (4, 'Суфлейный (с агар-агаром)');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (5, 'Шоколадный муссовый');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (6, 'Фруктово-ягодный');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (7, 'Шоколадный бисквитный');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (8, 'Капкейки');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (9, 'Десертный (с нугой и карамелью)');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (10, 'Овощной бисквитный');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (11, 'Чизкейк (выпеченный)');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (12, 'Ягодный муссовый');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (13, 'Тематический бисквитный');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (14, 'Кофейно-сливочный');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (15, 'Многоярусный бисквитно-муссовый');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (16, 'Итальянский десерт');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (17, 'Кондитерское изделие');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (18, 'Цитрусовый муссовый');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (19, 'Шоколадно-вишневый');
INSERT INTO public.types OVERRIDING SYSTEM VALUE VALUES (20, 'Безглютеновый');


--
-- TOC entry 5100 (class 0 OID 16420)
-- Dependencies: 226
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.units OVERRIDING SYSTEM VALUE VALUES (1, 'шт.');


--
-- TOC entry 5096 (class 0 OID 16397)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Кондратьева', 'Алиса', 'Михайловна', 'kondratieva@cake-shop.ru', 'AdCk76#');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Волошин', 'Игорь', 'Сергеевич', 'voloshin@cake-shop.ru', 'XyZ$89p');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Сладкоежкина', 'Виктория', 'Павловна', 'sladkoezhkina@cake-shop.ru', 'T0rt!k45');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (4, 2, 'Кремов', 'Артем', 'Дмитриевич', 'kremov@cake-shop.ru', 'Mn7@gP23');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (5, 2, 'Бисквитов', 'Петр', 'Владимирович', 'biskvitov@cake-shop.ru', 'Rt5#fH67');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (6, 2, 'Ягодная', 'Елена', 'Игоревна', 'yagodnaya@cake-shop.ru', 'Ber3ry$1');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (7, 3, 'Сахарова', 'Анна', 'Викторовна', 'saharova.client@mail.ru', 'Cli3nt#9');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (8, 3, 'Вафельный', 'Максим', 'Олегович', 'waffle.client@gmail.com', 'WafFl3$5');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (9, 3, 'Шоколадов', 'Кирилл', 'Александрович', 'chocolate.client@yandex.ru', 'Ch0c0L8*');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (10, 3, 'Фруктовская', 'Ольга', 'Сергеевна', 'fruit.client@outlook.com', 'FrU1t%22');


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 227
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 5, true);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 231
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 235
-- Name: categories_in_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_in_products_id_seq', 1, false);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 239
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 223
-- Name: pickup_point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pickup_point_id_seq', 1, false);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 233
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 241
-- Name: products_in_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_in_orders_id_seq', 1, false);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 237
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statuses_id_seq', 2, true);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 229
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 1, false);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 225
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_id_seq', 1, true);


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4920 (class 2606 OID 16432)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 4928 (class 2606 OID 16477)
-- Name: categories_in_products categories_in_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_in_products
    ADD CONSTRAINT categories_in_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4924 (class 2606 OID 16446)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4932 (class 2606 OID 16503)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4916 (class 2606 OID 16418)
-- Name: pickup_point pickup_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_point
    ADD CONSTRAINT pickup_point_pkey PRIMARY KEY (id);


--
-- TOC entry 4934 (class 2606 OID 16525)
-- Name: products_in_orders products_in_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_orders
    ADD CONSTRAINT products_in_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 16455)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4912 (class 2606 OID 16395)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4930 (class 2606 OID 16494)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4922 (class 2606 OID 16439)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 4918 (class 2606 OID 16425)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- TOC entry 4914 (class 2606 OID 16404)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4939 (class 2606 OID 16483)
-- Name: categories_in_products categories_in_products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_in_products
    ADD CONSTRAINT categories_in_products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4940 (class 2606 OID 16478)
-- Name: categories_in_products categories_in_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_in_products
    ADD CONSTRAINT categories_in_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4941 (class 2606 OID 16504)
-- Name: orders orders_pickup_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pickup_point_id_fkey FOREIGN KEY (pickup_point_id) REFERENCES public.pickup_point(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4942 (class 2606 OID 16514)
-- Name: orders orders_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.statuses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4943 (class 2606 OID 16509)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4936 (class 2606 OID 16461)
-- Name: products products_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4944 (class 2606 OID 16526)
-- Name: products_in_orders products_in_orders_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_orders
    ADD CONSTRAINT products_in_orders_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4945 (class 2606 OID 16531)
-- Name: products_in_orders products_in_orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_in_orders
    ADD CONSTRAINT products_in_orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4937 (class 2606 OID 16466)
-- Name: products products_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4938 (class 2606 OID 16456)
-- Name: products products_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4935 (class 2606 OID 16405)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-05-22 15:06:34

--
-- PostgreSQL database dump complete
--


