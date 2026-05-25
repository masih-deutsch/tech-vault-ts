--
-- PostgreSQL database dump
--

\restrict OVhylmrc5ejtNfrgpzP6fG8znMRSpChfDQHhG65dCDAdUSvHeOxblKW5XhlUtCl

-- Dumped from database version 17.10 (322a063)
-- Dumped by pg_dump version 17.7 (Homebrew)

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
-- Name: libraries; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.libraries (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(100),
    description text,
    installcommand character varying(255),
    docsurl character varying(255),
    isbookmarked boolean DEFAULT false,
    personalnote text
);


ALTER TABLE public.libraries OWNER TO neondb_owner;

--
-- Name: libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.libraries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libraries_id_seq OWNER TO neondb_owner;

--
-- Name: libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.libraries_id_seq OWNED BY public.libraries.id;


--
-- Name: libraries id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.libraries ALTER COLUMN id SET DEFAULT nextval('public.libraries_id_seq'::regclass);


--
-- Data for Name: libraries; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.libraries (id, name, category, description, installcommand, docsurl, isbookmarked, personalnote) FROM stdin;
7	shadcn/ui	UI Components	Beautifully designed components that you can copy and paste into your apps. Accessible. Customizable. Open Source. It solves the lock-in problem of traditional component libraries by giving you full ownership and control over the component code.	npx shadcn-ui@latest init	https://ui.shadcn.com/	f	\N
8	daisyUI	UI Components	The most popular component library for Tailwind CSS. It adds component class names to Tailwind CSS so you can make beautiful websites faster. It solves the problem of long, cluttered HTML class attributes when using Tailwind.	npm i -D daisyui@latest	https://daisyui.com/	f	\N
9	React Router	Routing	A lightweight, fully-featured routing library for the React JavaScript library. It solves the problem of navigating between different views or pages in a Single Page Application (SPA) while keeping the UI in sync with the URL.	npm install react-router-dom	https://reactrouter.com/	f	\N
10	react-hook-form	Forms	Performant, flexible and extensible forms with easy-to-use validation. It solves the performance issues of React forms by utilizing uncontrolled components, reducing the amount of code and re-renders required to manage form state.	npm install react-hook-form	https://react-hook-form.com/	f	\N
12	Yup	Validation	A JavaScript schema builder for value parsing and validation. Similar to Zod, it solves data validation issues, ensuring inputs match expected types and business rules before processing them.	npm install yup	https://github.com/jquense/yup	f	\N
14	Framer Motion	Animation	A production-ready motion library for React. It solves the complexity of creating smooth, hardware-accelerated animations and gestures (drag, hover, tap) with a declarative syntax.	npm install framer-motion	https://www.framer.com/motion/	f	\N
16	React Toastify	Notifications	Allows you to add notifications to your app with ease. It solves the problem of building custom alert/toast systems from scratch, providing a highly customizable and simple API.	npm install react-toastify	https://fkhadra.github.io/react-toastify/	f	\N
17	clsx & tailwind-merge	Utilities	A tiny utility for constructing className strings conditionally and a tool to merge Tailwind CSS classes without style conflicts. They solve the mess of dynamic class logic and CSS specificity issues.	npm install clsx tailwind-merge	https://github.com/lukeed/clsx	f	\N
15	NextAuth.js	Authentication	A complete open-source authentication solution for Next.js applications. It solves the hassle of implementing complex auth flows like OAuth, passwordless sign-in, and session management with ease.	npm install next-auth	https://next-auth.js.org/	f	\N
13	Redux	State Management	A predictable state container for JS apps. It solves managing complex, deeply nested state across large applications by enforcing strict unidirectional data flow and immutability.	npm install @reduxjs/toolkit react-redux	https://redux.js.org/	f	\N
21	Leila Test	Data Fetching	Here is the description.	npm install my-test-example	https://this-is-a-test.com	f	\N
5	@tanstack/react-query	Data Fetching & Caching	Powerful asynchronous state management for TS/JS, React, Solid, Vue and Svelte. It solves the complex problems of caching, background fetching, deduplicating requests, and optimistic updates without needing global state managers.	npm install @tanstack/react-query	https://tanstack.com/query/latest	t	\N
6	react-error-boundary	Error Handling	A simple reusable React error boundary component. It solves the problem of whole application crashes when a JavaScript error occurs in a component, allowing you to display a fallback UI instead.	npm install react-error-boundary	https://github.com/bvaughn/react-error-boundary	f	\N
1	Zustand	State Management	A small, fast and scalable bearbones state-management solution using simplified flux principles. It solves the boilerplate and complexity issues of Redux, allowing you to manage global state with a simple hook without wrapping your app in providers.	npm install zustand	https://zustand-demo.pmnd.rs/	t	Great for lightweight global state. Need to use it in the next dashboard project.
18	Swiper	UI Components	The most modern free mobile touch slider. It solves the difficulty of creating responsive, touch-friendly, and high-performance carousels or sliders for both web and mobile interfaces.	npm install swiper	https://swiperjs.com/	f	\N
22	Leila Test 2	UI Components	Test 2.	npm test2	https://this-is-a-test2.com	f	\N
4	lucide-react	Icons	A beautiful & consistent icon toolkit made by the community. It solves the problem of finding high-quality, customizable SVG icons for React applications without bloating your bundle size.	npm install lucide-react	https://lucide.dev/	t	\N
2	Tailwind CSS	UI Components	A utility-first CSS framework packed with classes like flex, pt-4, text-center and rotate-90 that can be composed to build any design, directly in your markup. It solves the problem of writing custom CSS, inventing class names, and managing huge stylesheets.	npm install -D tailwindcss postcss autoprefixer	https://tailwindcss.com/	f	\N
3	axios	Data Fetching	A promise-based HTTP Client for node.js and the browser. It solves the verbosity of the native fetch API by automatically transforming JSON data, throwing errors for bad status codes, and providing request/response interceptors.	npm install axios	https://axios-http.com/	f	\N
11	Zod	Validation	TypeScript-first schema declaration and validation library. It solves the problem of data unpredictability by allowing you to define a schema and validate data against it, heavily utilized alongside form libraries like react-hook-form.	npm install zod	https://zod.dev/	f	Must be paired with react-hook-form for strict type checking.
\.


--
-- Name: libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.libraries_id_seq', 22, true);


--
-- Name: libraries libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict OVhylmrc5ejtNfrgpzP6fG8znMRSpChfDQHhG65dCDAdUSvHeOxblKW5XhlUtCl

