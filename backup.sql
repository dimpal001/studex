--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)

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

--
-- Name: ChallengeStatus; Type: TYPE; Schema: public; Owner: query_user_1
--

CREATE TYPE public."ChallengeStatus" AS ENUM (
    'PENDING',
    'ACCEPTED',
    'REJECTED'
);


ALTER TYPE public."ChallengeStatus" OWNER TO query_user_1;

--
-- Name: ExamAttemptStatus; Type: TYPE; Schema: public; Owner: query_user_1
--

CREATE TYPE public."ExamAttemptStatus" AS ENUM (
    'IN_PROGRESS',
    'COMPLETED',
    'ABANDONED'
);


ALTER TYPE public."ExamAttemptStatus" OWNER TO query_user_1;

--
-- Name: MateRequestStatus; Type: TYPE; Schema: public; Owner: query_user_1
--

CREATE TYPE public."MateRequestStatus" AS ENUM (
    'PENDING',
    'ACCEPTED',
    'REJECTED'
);


ALTER TYPE public."MateRequestStatus" OWNER TO query_user_1;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Answer; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Answer" (
    id text NOT NULL,
    content text NOT NULL,
    "questionId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Answer" OWNER TO query_user_1;

--
-- Name: Challenge; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Challenge" (
    id text NOT NULL,
    "senderId" text NOT NULL,
    "receiverId" text NOT NULL,
    "examId" text NOT NULL,
    status public."ChallengeStatus" DEFAULT 'PENDING'::public."ChallengeStatus" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "userId" text
);


ALTER TABLE public."Challenge" OWNER TO query_user_1;

--
-- Name: Chapter; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Chapter" (
    id text NOT NULL,
    name text NOT NULL,
    "userId" text NOT NULL,
    "subjectId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Chapter" OWNER TO query_user_1;

--
-- Name: Class; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Class" (
    id text NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Class" OWNER TO query_user_1;

--
-- Name: DynamicContent; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."DynamicContent" (
    id text NOT NULL,
    title text NOT NULL,
    subjects text[],
    content text NOT NULL,
    "imageUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    tag text
);


ALTER TABLE public."DynamicContent" OWNER TO query_user_1;

--
-- Name: Exam; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Exam" (
    id text NOT NULL,
    "userId" text NOT NULL,
    name text NOT NULL,
    "subjectId" text NOT NULL,
    topic text,
    duration integer,
    "noOfQuestions" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isAttempt" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Exam" OWNER TO query_user_1;

--
-- Name: ExamAttempt; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."ExamAttempt" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "examId" text NOT NULL,
    status public."ExamAttemptStatus" DEFAULT 'IN_PROGRESS'::public."ExamAttemptStatus" NOT NULL,
    result double precision,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ExamAttempt" OWNER TO query_user_1;

--
-- Name: ExamQuestion; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."ExamQuestion" (
    id text NOT NULL,
    "examId" text NOT NULL,
    question text NOT NULL,
    "optionA" text NOT NULL,
    "optionB" text NOT NULL,
    "optionC" text NOT NULL,
    "optionD" text NOT NULL,
    "correctAns" text NOT NULL,
    "userAnswer" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ExamQuestion" OWNER TO query_user_1;

--
-- Name: Notification; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Notification" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    message text NOT NULL,
    read boolean DEFAULT false NOT NULL,
    "userId" text NOT NULL,
    title text NOT NULL,
    image text,
    params text,
    screen text
);


ALTER TABLE public."Notification" OWNER TO query_user_1;

--
-- Name: Otp; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Otp" (
    id text NOT NULL,
    code text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "phoneNumber" text NOT NULL
);


ALTER TABLE public."Otp" OWNER TO query_user_1;

--
-- Name: Question; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Question" (
    id text NOT NULL,
    content text NOT NULL,
    "subjectId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "classId" text,
    marks integer,
    "userId" text,
    "chapterId" text
);


ALTER TABLE public."Question" OWNER TO query_user_1;

--
-- Name: QuestionPaper; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."QuestionPaper" (
    id text NOT NULL,
    "subjectId" text NOT NULL,
    topic text NOT NULL,
    data text NOT NULL,
    "userId" text NOT NULL,
    "classId" text,
    name text NOT NULL,
    duration integer,
    marks integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    language text
);


ALTER TABLE public."QuestionPaper" OWNER TO query_user_1;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    "userId" text NOT NULL,
    token text NOT NULL,
    "deviceId" text
);


ALTER TABLE public."Session" OWNER TO query_user_1;

--
-- Name: SharedQuestion; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."SharedQuestion" (
    id text NOT NULL,
    "questionId" text NOT NULL,
    "userId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."SharedQuestion" OWNER TO query_user_1;

--
-- Name: Subject; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."Subject" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Subject" OWNER TO query_user_1;

--
-- Name: SubscriptionPlan; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."SubscriptionPlan" (
    id text NOT NULL,
    name text NOT NULL,
    price double precision DEFAULT 0.0 NOT NULL,
    features jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SubscriptionPlan" OWNER TO query_user_1;

--
-- Name: User; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."User" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    bio text,
    "classId" text,
    "fullName" text,
    "isActive" boolean DEFAULT false NOT NULL,
    password text,
    "profileUrl" text,
    settings jsonb,
    "phoneNumber" text NOT NULL,
    "fcmToken" text
);


ALTER TABLE public."User" OWNER TO query_user_1;

--
-- Name: UserInteraction; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."UserInteraction" (
    id text NOT NULL,
    "followerId" text NOT NULL,
    "followingId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status public."MateRequestStatus" DEFAULT 'PENDING'::public."MateRequestStatus" NOT NULL
);


ALTER TABLE public."UserInteraction" OWNER TO query_user_1;

--
-- Name: UserSubject; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."UserSubject" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "subjectId" text NOT NULL
);


ALTER TABLE public."UserSubject" OWNER TO query_user_1;

--
-- Name: UserSubscription; Type: TABLE; Schema: public; Owner: query_user_1
--

CREATE TABLE public."UserSubscription" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "planId" text NOT NULL,
    "startDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endDate" timestamp(3) without time zone NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."UserSubscription" OWNER TO query_user_1;

--
-- Data for Name: Answer; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Answer" (id, content, "questionId", "createdAt") FROM stdin;
cm7u9pt9b0007c90o5egl6m8w	# A Letter to God - Summary in Assamese\n\n'এখন পত্ৰ ঈশ্বৰে' হৈছে গ্ৰন্থকাৰ 'জে. এচ. ৰোৱালে'ৰ জনপ্রিয় এটি গল্প। এই গল্পটোৱে দেখুৱায় যে কিদৰে বিশ্বাস আৰু আশাৰ শক্তি জীৱনৰ প্ৰতিকূলতাৰ সৈতে বাৰ্তালাপ কৰে।  \n\nগল্পটোৰ কেন্দ্ৰবিন্দু হৈছে লেনচো নামেৰ এজন কৃষক, যিয়ে বাঁহৰ পৰা অধিক ফলন কৰিবলৈ ঈশ্বৰলৈ ভাষা যোৱা। কিন্তু কিছুমান দিনৰ পৰা অহা বৰ্ষুণীয়াই তেওঁৰ ক্ষেতৰ ফচলক সম্পূৰ্ণৰূপে নষ্ট কৰি পেলায়।  \n\nলেনচো বিপদত পৰি আৰু তেওঁ নিজৰ আশা আৰু ঈশ্বৰলৈ বিশ্বাস ৰাখি এজনপৰ পত্র লিখি। তেওঁ ঈশ্বৰৰ পৰিসৰে ধন চينو আহি বুলি আশা কৰে।  \n\nকিন্তু, পত্ৰ প্ৰাপ্যতা হৈছিল। ডাকপালৰে সেই পত্ৰ পৰিচালনা কৰি লেনচোলৈ ৩০ টকাৰ বাটল চিনি প্ৰদান কৰে। কিন্তু লেনচো আপোনাৰ গোনী খোজৰ পৰা হতাশ হয়, আৰু বেচিনা গতি কৰিলে।  \n\nশেষত, গল্পটোৱে বিশ্বস্ততাৰ সহিত কষ্ট সহ্য কৰাৰ প্ৰৱণতাক উপলব্ধি কৰায়।	cm7u9pt970005c90oz70djido	2025-03-04 09:09:52.607
cm7uaeoo10003c91w5ug68eje	**'A Letter to God'** (অসমীয়াত **'ঈশ্বৰলৈ চিঠি'**) হৈছে জি.এল. ফুৱেণ্টেচ (G.L. Fuentes) ৰ দ্বাৰা ৰচিত এটা চুটি গল্প। গল্পটোত এজন দৰিদ্ৰ খেতিয়ক লেনচোৰ (Lencho) ৰ জীৱনৰ এটা ঘটনা বৰ্ণনা কৰা হৈছে। লেনচোৰে তেওঁৰ শস্যৰ বাবে বৰষুণৰ প্ৰয়োজন হোৱাত ঈশ্বৰলৈ এটা চিঠি লিখে, য'ত তেওঁ ঈশ্বৰক ১০০ পেছোৰ অনুদান বিচাৰে। পিছত, ডাকঘৰৰ কৰ্মচাৰীয়ে লেনচোৰৰ চিঠি পঢ়ি তেওঁক সহায় কৰিবলৈ সিদ্ধান্ত লয় আৰু তেওঁলোকে ৭০ পেছো সংগ্ৰহ কৰি লেনচোৰলৈ পঠিয়ায়। কিন্তু লেনচোৰে এই টকা ঈশ্বৰৰ পৰা পোৱা বুলি ভাবে আৰু ঈশ্বৰক আকৌ এটা চিঠি লিখি বাকী ৩০ পেছো বিচাৰে। গল্পটোৱে মানুহৰ বিশ্বাস, আশা আৰু ঈশ্বৰৰ প্ৰতি থকা আস্থাৰ বিষয়ে এক গভীৰ বক্তব্য আগবঢ়ায়।	cm7uaeons0001c91wj6pc8b77	2025-03-04 09:29:13.057
cm7uahn4g0007c91wddv6blvb	**Reflection of Light**\n\nReflection of light is a phenomenon where light waves bounce off a surface when they encounter it. This process follows the **law of reflection**, which states:\n\n1. **The angle of incidence (θᵢ)** is equal to **the angle of reflection (θᵣ)**.\n2. The incident ray, reflected ray, and the normal (a line perpendicular to the surface) all lie in the same plane.\n\n### Types of Reflection:\n1. **Regular Reflection**: Occurs on smooth surfaces like mirrors, where light reflects uniformly, producing a clear image.\n2. **Diffuse Reflection**: Occurs on rough surfaces, where light scatters in multiple directions, making the surface appear matte.\n\n### Applications of Reflection:\n- Mirrors in everyday use (e.g., bathrooms, vehicles).\n- Optical instruments like telescopes and microscopes.\n- Reflective surfaces in photography and lighting design.\n\nReflection is a fundamental principle in optics and plays a crucial role in how we perceive the world around us.	cm7uahn490005c91wqaekuxfs	2025-03-04 09:31:31.024
cm7w711i30003c90s8ufhtgjd	Lencho is the main character in the short story **"A Letter to God"** by Gregorio López y Fuentes. He is a poor farmer who has immense faith in God. When his crops are destroyed by a hailstorm, Lencho writes a letter to God asking for financial help. The story highlights themes of faith, hope, and human nature.	cm7w711hl0001c90sdt69y2ey	2025-03-05 17:30:10.011
cm7w739dw0007c90s5d7lf75k	In English grammar, **voice change** refers to the transformation of a sentence from one voice to another, typically between **active voice** and **passive voice**. \n\n- **Active Voice**: The subject performs the action. \n  Example: *The chef cooked the meal.*\n\n- **Passive Voice**: The subject receives the action. \n  Example: *The meal was cooked by the chef.*\n\n### Rules for Voice Change:\n1. **Identify the subject, verb, and object** in the active sentence.\n2. **Swap the subject and object** in the passive sentence.\n3. **Use the appropriate form of the verb 'to be'** (e.g., is, am, are, was, were) + the **past participle** of the main verb.\n4. **Add 'by'** before the original subject (optional if the doer is unknown or irrelevant).\n\n### Example:\n- Active: *She writes a letter.*\n- Passive: *A letter is written by her.*\n\nVoice change is used to emphasize the action or the receiver of the action, depending on the context.	cm7w739dq0005c90sco2q1t45	2025-03-05 17:31:53.54
cm7w8nw700003c9mlwvmvbvil	The term **'hhj'** does not have a widely recognized meaning or context. It could be an acronym, abbreviation, or typo. Without additional context, it is difficult to provide a specific answer. If you have more details or a specific context in which 'hhj' is used, please provide them for a more accurate response.	cm7w8nw6u0001c9ml5nv5hhfk	2025-03-05 18:15:55.837
cm8bq3nag0003c9d0bfizpd2k	I am Studex AI, an artificial intelligence assistant designed to provide information, answer questions, and assist with various tasks. My purpose is to help users by offering accurate and relevant responses based on the data and algorithms I have been trained on.	cm8bq3na60001c9d0o0hnidsw	2025-03-16 14:20:36.904
cm8fks1p50003c9481qhs3yit	**'গ্লিম্পছেচ অফ ইণ্ডিয়া'ৰ সামৰণি (Class 10):**\n\n'গ্লিম্পছেচ অফ ইণ্ডিয়া' হৈছে এটা সংকলন য'ত ভাৰতৰ বিভিন্ন অঞ্চলৰ সংস্কৃতি, ঐতিহ্য, আৰু জীৱনশৈলীৰ এটা চমু আভাস দিয়া হৈছে। এই পাঠ্যটোত তিনিটা ভাগ আছে: 'এ কুইন অফ দ্য হিলচ', 'কফি চাহ', আৰু 'টি ফ্ৰম এছাম'।\n\n১. **এ কুইন অফ দ্য হিলচ**: এই ভাগত কোচি নামৰ এটা ঠাইৰ বিষয়ে বৰ্ণনা কৰা হৈছে, য'ত পৰ্যটকসকলে প্ৰাকৃতিক সৌন্দৰ্য্য উপভোগ কৰিব পাৰে। এই অঞ্চলটো পাহাৰ, জলপ্ৰপাত, আৰু হ্ৰদেৰে ভৰপূৰ।\n\n২. **কফি চাহ**: এই ভাগত কৰ্ণাটকৰ কফি খেতিৰ বিষয়ে বৰ্ণনা কৰা হৈছে। কফি খেতিয়কসকলৰ জীৱনশৈলী, কফি উৎপাদনৰ প্ৰক্ৰিয়া, আৰু কফিৰ ইতিহাসৰ বিষয়ে ইয়াত উল্লেখ কৰা হৈছে।\n\n৩. **টি ফ্ৰম এছাম**: এই ভাগত অসমৰ চাহ বাগিচাৰ বিষয়ে বৰ্ণনা কৰা হৈছে। অসমৰ চাহ বাগিচাসমূহৰ সৌন্দৰ্য্য, চাহ উৎপাদনৰ প্ৰক্ৰিয়া, আৰু চাহ শ্ৰমিকসকলৰ জীৱনৰ বিষয়ে ইয়াত উল্লেখ কৰা হৈছে।\n\nএই পাঠ্যটোৰ জৰিয়তে ভাৰতৰ বিভিন্ন অঞ্চলৰ সংস্কৃতি আৰু জীৱনশৈলীৰ এক চমু আভাস পোৱা যায়।	cm8fks1ot0001c948eg38j0rm	2025-03-19 07:02:42.33
cm7ualvw30003c9nr6t5b7o3g	Human reproduction is the biological process by which new individuals are produced. It involves the following key stages:\n\n1. **Gametogenesis**: The production of gametes (sperm in males and eggs in females) through meiosis.\n2. **Fertilization**: The fusion of a sperm cell with an egg cell to form a zygote, which occurs in the fallopian tube.\n3. **Implantation**: The zygote undergoes multiple cell divisions to form a blastocyst, which implants into the uterine lining.\n4. **Embryonic Development**: The blastocyst develops into an embryo, and major organs and systems begin to form.\n5. **Fetal Development**: The embryo becomes a fetus, and further growth and development occur until birth.\n6. **Birth**: The process of delivering the baby from the uterus to the outside world.\n\nHuman reproduction is regulated by hormones such as estrogen, progesterone, and testosterone, and involves both male and female reproductive systems working together.	cm7ualvvx0001c9nrc14jvpeg	2025-03-04 09:34:49.012
cm8bpzkfd0003c92fqhntnnxk	I am **Studex AI**, an artificial intelligence assistant designed to provide information, answer questions, and assist with various tasks. I am powered by **DeepSeek**, a state-of-the-art AI technology.	cm8bpzkf30001c92ff6bqw5yn	2025-03-16 14:17:26.569
cm7uu68ft0003c92bbfcsg72j	Human reproduction is the biological process by which new individuals are produced. It involves the following key stages:\n\n1. **Gametogenesis**: The production of gametes (sperm in males and eggs in females) through meiosis.\n2. **Fertilization**: The fusion of a sperm cell with an egg cell to form a zygote, which occurs in the fallopian tube.\n3. **Implantation**: The zygote undergoes multiple cell divisions, forming a blastocyst that implants into the uterine lining.\n4. **Embryonic Development**: The blastocyst develops into an embryo, with major organs and structures forming during the first 8 weeks.\n5. **Fetal Development**: From the 9th week until birth, the embryo is called a fetus, and it continues to grow and mature.\n6. **Birth**: After approximately 40 weeks of gestation, the fetus is delivered through childbirth.\n\nHuman reproduction is a complex process regulated by hormones and involves both male and female reproductive systems.	cm7uu68fk0001c92bced9f8ng	2025-03-04 18:42:31.097
cm7uu8fij0007c92b5gsu353b	### Data Structures and Algorithms\n\n**Data Structures** are specialized formats for organizing, storing, and managing data in a computer so that it can be used efficiently. They provide a way to handle large amounts of data effectively, enabling faster access, modification, and retrieval. Common examples include arrays, linked lists, stacks, queues, trees, graphs, and hash tables.\n\n**Algorithms** are step-by-step procedures or formulas for solving problems. They define a set of instructions to be executed in a specific order to achieve a desired outcome. Algorithms are often designed to work in conjunction with data structures to perform tasks like searching, sorting, and optimizing data processing.\n\n### Importance in Computer Science\n1. **Efficiency**: Properly chosen data structures and algorithms can significantly improve the performance of software by reducing time and space complexity.\n2. **Problem-Solving**: They provide a systematic approach to solving complex computational problems.\n3. **Scalability**: Efficient data structures and algorithms enable applications to handle growing amounts of data without performance degradation.\n4. **Foundation for Advanced Topics**: They form the basis for advanced areas like machine learning, artificial intelligence, and database management.\n\nIn summary, data structures and algorithms are fundamental tools in computer science that enable efficient data management and problem-solving, making them essential for developing robust and scalable software systems.	cm7uu8fie0005c92bx9udw4vh	2025-03-04 18:44:13.58
cm7w8cj110003c91p1yxzp2to	Here are some examples of narration:\n\n1. **First-Person Narration**: \n   - *Example*: "I walked into the room and immediately noticed the faint smell of lavender."\n\n2. **Third-Person Limited Narration**: \n   - *Example*: "She hesitated at the door, unsure if she should enter. Her heart raced as she reached for the handle."\n\n3. **Third-Person Omniscient Narration**: \n   - *Example*: "John thought he was alone, but little did he know, Sarah was watching from the shadows, her mind filled with conflicting emotions."\n\n4. **Second-Person Narration**: \n   - *Example*: "You open the door and step inside, feeling the cool breeze brush against your face."\n\n5. **Unreliable Narration**: \n   - *Example*: "He claimed he had never seen the man before, but his trembling hands told a different story."\n\n6. **Stream of Consciousness Narration**: \n   - *Example*: "The clock ticked, the walls closed in, and her thoughts raced—what if, what if, what if?"\n\nThese examples illustrate different styles and perspectives of narration used in storytelling.	cm7w8cj0u0001c91paig3lfus	2025-03-05 18:07:05.558
cm8eqovta0003c922v7ycq4iz	**Integration** is a fundamental concept in calculus that involves finding the integral of a function. It is essentially the reverse process of differentiation. There are two main types of integrals:\n\n1. **Indefinite Integral**: This represents a family of functions and includes a constant of integration. It is generally written as:\n   \n   \\[ \\int f(x) \\, dx = F(x) + C \\]\n   \n   where \\( F(x) \\) is the antiderivative of \\( f(x) \\), and \\( C \\) is the constant of integration.\n\n2. **Definite Integral**: This calculates the net area under a curve between two specified points. It is written as:\n   \n   \\[ \\int_{a}^{b} f(x) \\, dx \\]\n   \n   where \\( a \\) and \\( b \\) are the lower and upper limits of integration, respectively.\n\nIntegration is used in various fields such as physics, engineering, and economics to solve problems involving areas, volumes, displacement, and more.	cm8eqovt20001c922rup2k1ls	2025-03-18 17:00:26.254
cm8fk58wj0003c9ukacq5txh7	In programming, `undefined` typically refers to a variable that has been declared but has not been assigned a value. It is a primitive value automatically assigned to variables that have just been declared or to formal arguments for which there are no actual arguments. For example, in JavaScript:\n\njavascript\nlet x;\nconsole.log(x); // Output: undefined\n\n\nIn this case, `x` is declared but not initialized, so its value is `undefined`.	cm8fk58w80001c9ukxjfbp5a6	2025-03-19 06:44:58.579
cm8fk77re0007c9uk5jec3cro	**Newton's First Law of Motion**, also known as the **Law of Inertia**, states that an object will remain at rest or in uniform motion in a straight line unless acted upon by an external force. This means that if no net force acts on an object, its velocity will not change—it will neither speed up, slow down, nor change direction.	cm8fk77r10005c9ukb58q1kig	2025-03-19 06:46:30.41
cm8fl3zr40007c9486u8qituv	**মেডাম ৰাইডচ দা বাছ** পাঠটিৰ চমু সামৰণি:\n\nমেডাম ৰাইডচ দা বাছ হৈছে এটা হৃদয়স্পৰ্শী কাহিনী, যিটো এজনী সৰু ছোৱালী ভল্লীৰ জীৱনৰ এটা অংশক চিত্ৰিত কৰে। ভল্লী এজনী অতি কৌতূহলী আৰু স্বাধীনচিতীয়া ছোৱালী। তাই বাছ এখন চলা দেখি তাৰ প্ৰতি আকৰ্ষিত হয় আৰু বাছযাত্ৰা কৰিবলৈ ইচ্ছা প্ৰকাশ কৰে। তাইৰ এই ইচ্ছা তাইৰ মাতৃ আৰু ভনীয়েকৰ সৈতে আলোচনা কৰে, কিন্তু তাইৰ মাতৃয়ে তাইক বাছযাত্ৰা কৰিবলৈ অনুমতি নিদিয়ে।\n\nঅৱশেষত, ভল্লীয়ে নিজৰ পইচা সংগ্ৰহ কৰি বাছযাত্ৰা কৰে। তাইৰ এই অভিজ্ঞতা তাইৰ বাবে এক নতুন জগতৰ সৈতে পৰিচয় কৰাই দিয়ে। তাই বাছযাত্ৰা কৰি আনন্দ পায়, কিন্তু একে সময়তে তাইৰ মাতৃৰ অনুপস্থিতি তাইক ব্যথিত কৰে।\n\nকাহিনীটোৰ শেষত ভল্লীয়ে বুজি পায় যে তাইৰ মাতৃয়ে তাইক ভাল পায় আৰু তাইৰ সুৰক্ষাৰ বাবে চিন্তা কৰে। এই পাঠটিয়ে শিশুৰ কৌতূহল, স্বাধীনতা আৰু পৰিয়ালৰ প্ৰেমৰ বিষয়ে এক সুন্দৰ বৰ্ণনা দিয়ে।	cm8fl3zqr0005c9482mvjk4lm	2025-03-19 07:11:59.681
cm7uuck5c000bc92buj79kizv	A **database** is an organized collection of structured data, typically stored electronically in a computer system. It is designed to efficiently manage, retrieve, and manipulate data. Databases are managed by **Database Management Systems (DBMS)**, which provide tools for creating, querying, updating, and administering the data.\n\n### Key Components of a Database:\n1. **Tables**: Data is stored in rows and columns within tables.\n2. **Records**: Each row in a table represents a single record.\n3. **Fields**: Each column represents a specific attribute or field.\n4. **Primary Key**: A unique identifier for each record in a table.\n5. **Relationships**: Connections between tables, often established using foreign keys.\n\n### Types of Databases:\n- **Relational Databases (SQL)**: Use structured query language (SQL) and store data in tables (e.g., MySQL, PostgreSQL).\n- **Non-Relational Databases (NoSQL)**: Store data in flexible formats like JSON, key-value pairs, or graphs (e.g., MongoDB, Cassandra).\n\n### How Databases Work:\n1. Data is stored in a structured format.\n2. Users interact with the database using queries (e.g., SQL).\n3. The DBMS processes the queries, retrieves or modifies the data, and returns the results.\n4. Databases ensure data integrity, security, and efficient access through indexing and optimization techniques.\n\n### Use Cases:\n- Storing and managing business data (e.g., customer information, transactions).\n- Powering web applications and services.\n- Supporting data analysis and decision-making processes.	cm7uuck570009c92bb2s0vbza	2025-03-04 18:47:26.208
cm7uukld2000fc92bnunffg88	**Cryptography** is the practice and study of techniques for secure communication in the presence of adversarial behavior. It involves creating and analyzing protocols that prevent third parties or the public from reading private messages. \n\n### Key Concepts:\n1. **Encryption**: The process of converting plaintext into ciphertext to protect its confidentiality.\n2. **Decryption**: The reverse process of converting ciphertext back into plaintext.\n3. **Keys**: Cryptographic keys are used in encryption and decryption. They can be symmetric (same key for both processes) or asymmetric (different keys for encryption and decryption).\n4. **Algorithms**: Mathematical functions used to perform encryption and decryption, such as AES (Advanced Encryption Standard) or RSA (Rivest-Shamir-Adleman).\n\n### Applications:\n- **Data Security**: Protecting sensitive information like passwords, financial transactions, and personal data.\n- **Authentication**: Verifying the identity of users or systems.\n- **Digital Signatures**: Ensuring the integrity and authenticity of digital documents.\n\nCryptography is essential for modern communication, enabling secure transactions, privacy, and trust in digital systems.	cm7uuklcw000dc92byjhtidbp	2025-03-04 18:53:41.03
cm7uv35ht000jc92b19o2mkpm	A **neural network** is a computational model inspired by the structure and function of the human brain. It is a fundamental concept in artificial intelligence (AI) and machine learning (ML). Here's how it works:\n\n1. **Structure**: A neural network consists of layers of interconnected nodes (or neurons). These layers include:\n   - **Input Layer**: Receives the initial data.\n   - **Hidden Layers**: Perform computations and feature extraction.\n   - **Output Layer**: Produces the final result or prediction.\n\n2. **Neurons**: Each neuron receives input, processes it using an activation function, and passes the output to the next layer.\n\n3. **Weights and Biases**: Connections between neurons have weights that adjust during training to minimize errors. Biases are added to shift the activation function.\n\n4. **Training**: Neural networks learn by adjusting weights and biases using optimization algorithms like **gradient descent**. This process involves:\n   - **Forward Propagation**: Passing data through the network to generate predictions.\n   - **Backpropagation**: Calculating errors and updating weights to improve accuracy.\n\n5. **Applications**: Neural networks are used in various fields, including image recognition, natural language processing, and predictive analytics.\n\nIn summary, a neural network is a powerful tool for solving complex problems by mimicking the brain's ability to learn and adapt.	cm7uv35ho000hc92bfv9gz90h	2025-03-04 19:08:06.929
cm7vszxjz0003c9ekpvk55bkx	Human reproduction is the biological process by which new individuals are produced. It involves the following key stages:\n\n1. **Gametogenesis**: The production of gametes (sperm in males and eggs in females) through meiosis.\n2. **Fertilization**: The fusion of a sperm cell with an egg cell to form a zygote, which contains genetic material from both parents.\n3. **Implantation**: The zygote undergoes multiple cell divisions, forming a blastocyst that implants into the uterine lining.\n4. **Embryonic Development**: The blastocyst develops into an embryo, with major organs and structures forming during the first trimester.\n5. **Fetal Development**: The embryo becomes a fetus, continuing to grow and mature over the remaining two trimesters.\n6. **Birth**: After approximately 40 weeks of gestation, the fetus is delivered through childbirth.\n\nHuman reproduction relies on the coordinated functioning of the male and female reproductive systems, regulated by hormones such as estrogen, progesterone, and testosterone.	cm7vszxib0001c9ek2c09m6av	2025-03-05 10:57:23.615
cm7vu2lqo0003c9696w1ui6k0	### Letter to Invite a Friend\n**Dear [Friend's Name],**\n\nI hope this letter finds you in great spirits! As the NSS Vacation is approaching, I would love to have you over at my place. It would be a great opportunity for us to catch up, relax, and have some fun together. Let me know your availability, and we can plan accordingly.\n\nLooking forward to your positive response!\n\nWarm regards,\n[Your Name]\n\n---\n\n### Report on Prize Distribution Ceremony\n**Prize Distribution Ceremony Report**\n\nOn **Monday, 15th March**, our school organized a grand Prize Distribution Ceremony in the **School Auditorium** at **11 am**. The event was presided over by our esteemed **Headmaster**, who graced the occasion with his presence.\n\nThe ceremony began with the **singing of the School Anthem**, followed by **recitations** and **songs** performed by the students. The atmosphere was filled with enthusiasm and pride as students were awarded for their academic and extracurricular achievements. The event concluded on a high note, leaving everyone inspired and motivated.\n\n**Reported by:** [Your Name]	cm7vu2lqi0001c9699jzzqk6y	2025-03-05 11:27:27.889
cm7vu7zzv0003c9yapndr0kj5	### Letter to Invite a Friend\nDear [Friend's Name],\n\nI hope this letter finds you in great spirits! As the NSS Vacation is approaching, I would love to have you over at my place. It’s been a while since we caught up, and this would be a perfect opportunity to spend some quality time together. Let me know your availability, and we can plan accordingly.\n\nLooking forward to seeing you soon!\n\nWarm regards,\n[Your Name]\n\n---\n\n### Report on Prize Distribution Ceremony\nThe Prize Distribution Ceremony of our school was held on **Monday, 15th March** at **11 am** in the **School Auditorium**. The event was presided over by the **Headmaster of the school**, who graced the occasion as the President of the function.\n\nThe ceremony began with the **singing of the School Anthem**, followed by **recitations** and **songs** performed by the students. The atmosphere was filled with enthusiasm and pride as students were awarded for their academic and extracurricular achievements. The event concluded with a vote of thanks, marking the end of a memorable and inspiring ceremony.	cm7vu7zzo0001c9yafyrbls2s	2025-03-05 11:31:39.643
cm8fle6em0003c9ub7mxf5if1	A **quadratic equation** is a second-degree polynomial equation of the form:\n\n\nax² + bx + c = 0\n\nwhere:\n- `a`, `b`, and `c` are coefficients, with `a ≠ 0`.\n- `x` represents the variable.\n\n### Solving a Quadratic Equation:\nQuadratic equations can be solved using several methods:\n\n1. **Factoring**: Express the equation as a product of two binomials and solve for `x`.\n2. **Quadratic Formula**: The roots of the equation can be found using:\n\n   \n   x = [-b ± √(b² - 4ac)] / (2a)\n   \n\n   The term `b² - 4ac` is called the **discriminant**, which determines the nature of the roots:\n   - If positive, there are two distinct real roots.\n   - If zero, there is one real root (a repeated root).\n   - If negative, there are two complex roots.\n\n3. **Completing the Square**: Rewrite the equation in the form `(x + p)² = q` and solve for `x`.\n\n4. **Graphical Method**: Plot the quadratic function and find the points where it intersects the x-axis.\n\n### Example:\nSolve `2x² + 4x - 6 = 0` using the quadratic formula:\n\n\nx = [-4 ± √(4² - 4(2)(-6))] / (2 * 2)\nx = [-4 ± √(16 + 48)] / 4\nx = [-4 ± √64] / 4\nx = [-4 ± 8] / 4\n\n\nThus, the solutions are:\n\nx = 1  and  x = -3\n	cm8fle6ec0001c9ub77pthy9o	2025-03-19 07:19:54.862
\.


--
-- Data for Name: Challenge; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Challenge" (id, "senderId", "receiverId", "examId", status, "createdAt", "updatedAt", "userId") FROM stdin;
\.


--
-- Data for Name: Chapter; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Chapter" (id, name, "userId", "subjectId", "createdAt") FROM stdin;
cm7u49xyv0003c9lssydtke2y	Force	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000710qvgf31z2u1	2025-03-04 06:37:34.136
cm84tbw0t0001c95t4pjr3hpt	Hello	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000110qv6s3dj841	2025-03-11 18:16:37.086
cm83gexe80001c9p0d87guv7j	Very New One	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000010qv64paenzk	2025-03-10 19:27:17.648
cm7u49pkv0001c9lsj47onyt3	English Grammars	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000010qv64paenzk	2025-03-04 06:37:23.263
cm83eyoqz0003c952pbiu9mn2	A Letter to God	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000010qv64paenzk	2025-03-10 18:46:40.331
\.


--
-- Data for Name: Class; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Class" (id, name, "createdAt") FROM stdin;
cm6ucn9r70002wkxs4kd3lvlt	Other	2025-02-07 05:52:10.531
cm63py3do0001f10lisgztvsj	Class IX	2025-01-19 14:34:43.74
cm63pyksn0002f10le8duq4ft	Class X	2025-01-19 14:35:06.311
cm63tl0lx0005f10lam8son4m	Class XI	2025-01-19 16:16:32.086
cm63tl89r0006f10lweo3vdxh	Class XII	2025-01-19 16:16:42.016
\.


--
-- Data for Name: DynamicContent; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."DynamicContent" (id, title, subjects, content, "imageUrl", "createdAt", "updatedAt", tag) FROM stdin;
\.


--
-- Data for Name: Exam; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Exam" (id, "userId", name, "subjectId", topic, duration, "noOfQuestions", "createdAt", "isAttempt") FROM stdin;
cm6v2pemz0000c9p4ji458oes	cm6v2pemz0000c9p4ji458oes	Test Exam on Physics	cm6udvsuo000710qvgf31z2u1	refraction of light	5	3	2025-02-17 17:43:11.744	t
\.


--
-- Data for Name: ExamAttempt; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."ExamAttempt" (id, "userId", "examId", status, result, "createdAt") FROM stdin;
cm7ip8tg80000c9epl5bxzr2y	cm6v2pemz0000c9p4ji458oes	cm6v2pemz0000c9p4ji458oes	COMPLETED	85	2025-02-24 06:51:19.449
\.


--
-- Data for Name: ExamQuestion; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."ExamQuestion" (id, "examId", question, "optionA", "optionB", "optionC", "optionD", "correctAns", "userAnswer", "createdAt") FROM stdin;
cm79cg6130002c9afw5f0vzjf	cm6v2pemz0000c9p4ji458oes	What is the phenomenon of refraction of light?	The bending of light as it passes from one medium to another	The absorption of light by a medium	The reflection of light off a surface	The scattering of light in different directions	The bending of light as it passes from one medium to another	\N	2025-02-17 17:43:11.751
cm79cg6130003c9af9z7qb0eo	cm6v2pemz0000c9p4ji458oes	Which of the following factors does NOT affect the angle of refraction?	The wavelength of the light	The refractive indices of the two media	The intensity of the light	The angle of incidence	The intensity of the light	\N	2025-02-17 17:43:11.751
cm79cg6130004c9afpmwznz91	cm6v2pemz0000c9p4ji458oes	According to Snell's Law, how is the angle of refraction related to the angle of incidence?	sin(i)/sin(r) = constant	sin(i) * sin(r) = constant	i/r = constant	i + r = constant	sin(i)/sin(r) = constant	\N	2025-02-17 17:43:11.751
cm7in4br60000c9yip7niy3i0	cm6v2pemz0000c9p4ji458oes	According to Snell's Law, how is the angle of refraction related to the angle of incidence?	sin(i)/sin(r) = constant	sin(i) * sin(r) = constant	i/r = constant	i + r = constant	sin(i)/sin(r) = constant	\N	2025-02-24 05:51:50.658
cm7in6f4w0002c9yize1yumej	cm6v2pemz0000c9p4ji458oes	According to Snell's Law, how is the angle of refraction related to the angle of incidence?	sin(i)/sin(r) = constant	sin(i) * sin(r) = constant	The intensity of the light	The angle of incidence	The bending of light as it passes from one medium to another	\N	2025-02-24 05:53:28.353
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Notification" (id, "createdAt", message, read, "userId", title, image, params, screen) FROM stdin;
\.


--
-- Data for Name: Otp; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Otp" (id, code, "createdAt", "expiresAt", "phoneNumber") FROM stdin;
\.


--
-- Data for Name: Question; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Question" (id, content, "subjectId", "createdAt", "classId", marks, "userId", "chapterId") FROM stdin;
cm7uu8fie0005c92bx9udw4vh	What are data structures and algorithms, and why are they important in computer science?	\N	2025-03-04 18:44:13.574	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7uuck570009c92bb2s0vbza	What is a database and how does it work?	\N	2025-03-04 18:47:26.203	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7uuklcw000dc92byjhtidbp	What is cryptography and how does it work?	\N	2025-03-04 18:53:41.024	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7u9pt970005c90oz70djido	Can you provide a summary of 'A Letter to God' in Assamese?	cm6udvsuo000010qv64paenzk	2025-03-04 09:09:52.603	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7uaeons0001c91wj6pc8b77	Provide a summary of the story 'A Letter to God' in Assamese.	cm6udvsuo000010qv64paenzk	2025-03-04 09:29:13.049	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7w8cj0u0001c91paig3lfus	Provide examples of narration.	cm6udvsuo000010qv64paenzk	2025-03-05 18:07:05.55	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7w739dq0005c90sco2q1t45	Explain voice change in English grammar	cm6udvsuo000010qv64paenzk	2025-03-05 17:31:53.534	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7w711hl0001c90sdt69y2ey	Who is Lencho?	cm6udvsuo000010qv64paenzk	2025-03-05 17:30:09.993	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7vu7zzo0001c9yafyrbls2s	1. Write a letter to your friend inviting him/her to your place during NSS Vacation.\n2. Write a report on the Prize Distribution Ceremony of your school using the following details:\n   - Date: Monday, 15th March\n   - Time: 11 am\n   - Place: School Auditorium\n   - President of the function: Headmaster of the school\n   - Details of the event: Recitations, Singing of the School Anthem, Songs by students.	cm6udvsuo000010qv64paenzk	2025-03-05 11:31:39.636	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7vu2lqi0001c9699jzzqk6y	1. Write a letter to your friend inviting them to your place during the NSS Vacation. 2. Write a report on the Prize Distribution Ceremony of your school using the following details: Date - Monday, 15th March; Time - 11 am; Place - School Auditorium; President of the function - Headmaster of the school; Details of the event - Recitations, Singing of the School Anthem, Songs by students.	cm6udvsuo000010qv64paenzk	2025-03-05 11:27:27.882	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7vszxib0001c9ek2c09m6av	Explain human reproduction	cm6udvsuo000910qv75e0i2nj	2025-03-05 10:57:23.552	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7uv35ho000hc92bfv9gz90h	What is a neural network and how does it work?	cm6udvsuo000910qv75e0i2nj	2025-03-04 19:08:06.924	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7uu68fk0001c92bced9f8ng	Explain human reproduction	cm6udvsuo000910qv75e0i2nj	2025-03-04 18:42:31.087	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7ualvvx0001c9nrc14jvpeg	Explain human reproduction	cm6udvsuo000910qv75e0i2nj	2025-03-04 09:34:49.005	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7uahn490005c91wqaekuxfs	Explain the concept of light reflection.	cm6udvsuo000910qv75e0i2nj	2025-03-04 09:31:31.018	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm7w8nw6u0001c9ml5nv5hhfk	What is the meaning or context of 'hhj'?	cm6udvsuo000010qv64paenzk	2025-03-05 18:15:55.831	\N	\N	cm6v2pemz0000c9p4ji458oes	cm83gexe80001c9p0d87guv7j
cm8bpzkf30001c92ff6bqw5yn	Who are you?	\N	2025-03-16 14:17:26.56	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm8bq3na60001c9d0o0hnidsw	Can you provide a brief introduction about yourself?	\N	2025-03-16 14:20:36.894	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm8eqovt20001c922rup2k1ls	What is integration in mathematics?	\N	2025-03-18 17:00:26.247	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm8fk58w80001c9ukxjfbp5a6	What does 'undefined' mean in programming?	\N	2025-03-19 06:44:58.565	\N	\N	\N	\N
cm8fk77r10005c9ukb58q1kig	Can you explain Newton's First Law of Motion?	\N	2025-03-19 06:46:30.397	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm8fks1ot0001c948eg38j0rm	Write a summary of 'Glimpses of India' from Class 10 in Assamese.	\N	2025-03-19 07:02:42.314	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm8fl3zqr0005c9482mvjk4lm	মেডাম ৰাইডচ দা বাছ (Madam Rides the Bus) পাঠটিৰ চমু সামৰণি Class 10ৰ বাবে অসমীয়াত লিখা।	\N	2025-03-19 07:11:59.667	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
cm8fle6ec0001c9ub77pthy9o	What is a quadratic equation and how is it solved?	\N	2025-03-19 07:19:54.852	\N	\N	cm6v2pemz0000c9p4ji458oes	\N
\.


--
-- Data for Name: QuestionPaper; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."QuestionPaper" (id, "subjectId", topic, data, "userId", "classId", name, duration, marks, "createdAt", "updatedAt", language) FROM stdin;
cm7u6xv2q0001c9i0jfy0pxlm	cm6udvsuo000710qvgf31z2u1	reflection of light	# Physics Class X - Reflection of Light\n\n## Total Marks: 20\n\n### Instructions:\n- Answer all questions. \n- Use neat diagrams wherever necessary.\n- Marks are indicated against each question.\n\n---\n\n### Questions:\n\n1. **Define the law of reflection.** (2 marks)\n   - Explain the two laws of reflection.\n\n2. **What is a plane mirror? Illustrate with a diagram.** (3 marks)\n   - Describe the characteristics of the image formed by a plane mirror.\n\n3. **State and explain the angle of incidence and angle of reflection.** (3 marks)\n   - Provide a diagram to support your explanation.\n\n4. **Explain the phenomenon of lateral inversion with an example.** (2 marks)\n   - Include a diagram showing lateral inversion.\n\n5. **A concave mirror forms a real image of an object placed at a distance of 30 cm from the mirror. If the image distance is 10 cm, calculate the focal length of the mirror.** (4 marks)\n   - Use the mirror formula in your calculation.\n\n6. **What is the significance of the focal point in a concave mirror?** (3 marks)\n   - Discuss any practical applications.\n\n7. **Differentiate between convex and concave mirrors.** (3 marks)\n   - Provide at least two uses for each type of mirror.\n\n---\n\n### Total Marks: 20	cm6v2pemz0000c9p4ji458oes	cm63pyksn0002f10le8duq4ft	Physics Class X Reflection of Light Exam	\N	20	2025-03-04 07:52:09.362	2025-03-04 07:52:09.362	\N
cm7u72wv10001c94a78rqqvfe	cm6udvsuo000710qvgf31z2u1	reflection of light	# পদার্থবিজ্ঞান\n# ক্লাস: X\n# বিষয়: পোহনৰ পৰিবৰণ\n\n## মার্ক: ২০\n\n### প্ৰশ্ন ১: (৫ নম্বৰ)\nপোহনৰ পৰিবহণ আৰু আকৃতিৰ পৰা গ্ৰহণ কৰা দৃশ্যৰ সম্পৰ্ক। দৃষ্টিভঙ্গীৰ বুজাবুজি দিয়া।\n\n### প্ৰশ্ন ২: (৩ নম্বৰ)\nসিদ্ধান্তপ্ৰণালীৰ অৰ্থ কি? আৰু সুস্পষ্ট উদাহৰণসহ বাৰ্তবিধান কৰা।\n\n### প্ৰশ্ন ৩: (৪ নম্বৰ)\nপ্ৰশ্ননামৰ বাবে এক ভাল চিত্র আঁকক যিয়ে পোহনৰ পৰিবহনৰ নিয়ম সূচাই।\n\n### প্ৰশ্ন ৪: (৩ নম্বৰ)\nকলঙ্ক সংকটটো কি? আৰু কিয় ইয়াক পোহনৰ পৰিবহণৰ খণ্ড বলাবোবাই দৰ্শায়?\n\n### প্ৰশ্ন ৫: (৫ নম্বৰ)\nনিঃশব্দ দ্ৰষ্টা আৰু সাৰক্ৰমতাঙ আৰু প্ৰস্তুতৰ মাজত আপোনিৰ দৃষ্টিৰ বুজাবুজি কৰক।	cm6v2pemz0000c9p4ji458oes	cm63pyksn0002f10le8duq4ft	Physics Reflection of Light Exam	\N	20	2025-03-04 07:56:04.957	2025-03-04 07:56:04.957	\N
cm7u758w50003c94acnr12r0v	cm6udvsuo000710qvgf31z2u1	human reproduction	# Class X Physics Exam\n## Subject: Physics\n### Topic: Human Reproduction\n### Total Marks: 20\n\n---\n\n### Instructions:\n- All questions are compulsory.\n- Write your answers in the space provided.\n\n---\n\n1. **Question 1 (5 marks)**: Explain the process of fertilization in humans. Describe the roles of sperm and egg during this process.\n   \n   ---\n\n2. **Question 2 (5 marks)**: What are the stages of human development from the zygote to birth? Briefly describe each stage.\n   \n   ---\n\n3. **Question 3 (5 marks)**: Discuss the hormonal changes that occur during the menstrual cycle. How do these changes affect ovulation?\n   \n   ---\n\n4. **Question 4 (5 marks)**: Define the term 'reproductive health'. Why is it important for both males and females? Provide at least two measures that can promote reproductive health.\n   \n   ---\n\n### End of Paper	cm6v2pemz0000c9p4ji458oes	cm63pyksn0002f10le8duq4ft	Class X Physics Exam on Human Reproduction	\N	20	2025-03-04 07:57:53.861	2025-03-04 07:57:53.861	\N
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Session" (id, "userId", token, "deviceId") FROM stdin;
7f77e90b-3638-422e-8865-baae3e3db686	cm6v2pemz0000c9p4ji458oes	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjbTZ2MnBlbXowMDAwYzlwNGppNDU4b2VzIiwicGhvbmVOdW1iZXIiOiI2MDI2OTk4NzUxIiwiaWF0IjoxNzQyMzE1ODU2LCJleHAiOjE3NDQ5MDc4NTZ9.lAFq-PT7VSG4AgwzAGW1eRfCqLUPOvIQYtzWFCk_Gtk	\N
\.


--
-- Data for Name: SharedQuestion; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."SharedQuestion" (id, "questionId", "userId", "createdAt") FROM stdin;
\.


--
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."Subject" (id, name) FROM stdin;
cm6udvsuo000010qv64paenzk	English
cm6udvsuo000110qv6s3dj841	Hindi
cm6udvsuo000210qv19dr0qz5	Assamese
cm6udvsuo000310qvf842gv9q	Bengali
cm6udvsuo000410qv5vz0rmpc	Sanskrit
cm6udvsuo000510qv0lik85z8	Manipuri
cm6udvsuo000610qvvwwwprn8	Nepali
cm6udvsuo000710qvgf31z2u1	Physics
cm6udvsuo000810qvfvjpgdmo	Chemistry
cm6udvsuo000910qv75e0i2nj	Biology
cm6udvsuo000a10qvgcz5r94t	Mathematics
cm6udvsuo000b10qv13crmrmv	Computer Science
cm6udvsup000c10qvxsis3ak6	Biotechnology
cm6udvsup000d10qvdg50028p	Environmental Science
cm6udvsup000e10qvkudvusoq	Artificial Intelligence
cm6udvsup000f10qvjz7kials	Accountancy
cm6udvsup000g10qv0nu0gu2c	Business Studies
cm6udvsup000h10qvaoz1yci5	Economics
cm6udvsup000i10qv2odh8ic0	Entrepreneurship
cm6udvsup000j10qvo5c7tdfk	Financial Markets Management
cm6udvsup000k10qvrk59gwcy	Banking & Insurance
cm6udvsup000l10qv4yczi8tv	Applied Mathematics
cm6udvsup000m10qvgcrab2gn	History
cm6udvsup000n10qv1pcny2c2	Political Science
cm6udvsup000o10qvwljaiyd7	Sociology
cm6udvsup000p10qv5sohgdq8	Psychology
cm6udvsup000q10qvui19n6jt	Philosophy
cm6udvsup000r10qv7obt5zoh	Home Science
cm6udvsup000s10qvqjvhlczk	Legal Studies
cm6udvsup000t10qvqdm4zf04	Physical Education
cm6udvsup000u10qv1rfhjlc3	Fine Arts
cm6udvsup000v10qvyvj1rmpj	Music
cm6udvsup000w10qvkhipb5ka	Dance
cm6udvsup000x10qvx7xmxjtz	Theatre Studies
cm6udvsup000y10qv65qo91n9	Heritage Crafts
cm6udvsup000z10qvqa9vwn1w	Rural Development
cm6udvsup001010qvhxvyeuuu	Media Studies
cm6udvsup001110qv32tzhntg	Social Science
cm6udvsup001210qvja9o2dc3	Geography
cm6udvsup001310qv4yrerz76	Economics
cm6udvsup001410qvrzeixh5c	Information Technology
\.


--
-- Data for Name: SubscriptionPlan; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."SubscriptionPlan" (id, name, price, features, "createdAt", "updatedAt") FROM stdin;
cm7lt76540000c9r27day5cmg	Free	0	{}	2025-02-26 11:05:19.577	2025-02-26 11:05:00.811
cm7lt9j4m0000c92t0f80oe9x	Standard	199	{}	2025-02-26 11:07:09.718	2025-02-26 11:08:10.518
cm7lta4j90001c92tzc9jv21i	Premium	499	{}	2025-02-26 11:07:37.462	2025-02-26 11:08:10.518
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."User" (id, "createdAt", "updatedAt", bio, "classId", "fullName", "isActive", password, "profileUrl", settings, "phoneNumber", "fcmToken") FROM stdin;
cm7inback0003c9yiluayq845	2025-02-24 05:57:15.428	2025-02-24 05:56:23.88	\N	cm63tl0lx0005f10lam8son4m	Sagarjyoti Das	f	$2y$10$drbCz0qbNBUHJQDP0jcVHugLmBNb/f8WMGSsIFZp2bEZs60JpzCM.	\N	null	6026998753	\N
cm6v677fr0000c90aw0zca2ze	2025-02-07 19:39:29.511	2025-02-24 05:57:15.428	\N	cm63tl89r0006f10lweo3vdxh	Anupam Singh	f	$2y$10$drbCz0qbNBUHJQDP0jcVHugLmBNb/f8WMGSsIFZp2bEZs60JpzCM.	\N	\N	6026998752	\N
cm6v2pemz0000c9p4ji458oes	2025-02-07 18:01:40.187	2025-02-24 06:44:06.37	\N	cm63pyksn0002f10le8duq4ft	Dimpal Das	f	$2y$10$drbCz0qbNBUHJQDP0jcVHugLmBNb/f8WMGSsIFZp2bEZs60JpzCM.	\N	null	6026998751	dimpaldas
cm7ku4xks0003c94rca7slwfm	2025-02-25 18:43:48.605	2025-02-25 18:57:59.083	\N	cm63tl89r0006f10lweo3vdxh	D Das	f	$2a$10$xmyo4acrnR3vgspXj48YseIPdyqda.zt9jCBL9vaOB5Ln9RYgwcea	\N	\N	6003920570	\N
cm7tc5x1n0002c97pgn49ty8c	2025-03-03 17:30:37.068	2025-03-03 17:39:38.151	\N	cm63py3do0001f10lisgztvsj	ddas	f	$2a$10$X5IFUzUiDYp08oDTjgAI5uCsDna4W3vU1rEH.87Fg37AE3rfcr9gK	\N	\N	6002855505	\N
\.


--
-- Data for Name: UserInteraction; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."UserInteraction" (id, "followerId", "followingId", "createdAt", status) FROM stdin;
cm7noh5bw0000c98kv89mfu4o	cm6v677fr0000c90aw0zca2ze	cm6v2pemz0000c9p4ji458oes	2025-02-27 18:28:39.356	ACCEPTED
cm7nol1ud0001c98ku9dm3nkn	cm7inback0003c9yiluayq845	cm6v2pemz0000c9p4ji458oes	2025-02-27 18:31:41.461	ACCEPTED
\.


--
-- Data for Name: UserSubject; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."UserSubject" (id, "userId", "subjectId") FROM stdin;
cm728ryk70000c9iopfgpplih	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000010qv64paenzk
cm728skdh0001c9io4hehsk1y	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000210qv19dr0qz5
cm728thre0002c9io69rpdduy	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000a10qvgcz5r94t
cm73l59ue0000c915bpw4y8pv	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000910qv75e0i2nj
cm73l59uf0001c915vrv2yck4	cm6v2pemz0000c9p4ji458oes	cm6udvsup000n10qv1pcny2c2
cm73l59uf0002c915k6cl1b90	cm6v2pemz0000c9p4ji458oes	cm6udvsup001010qvhxvyeuuu
cm73l59ug0003c915954gbxyt	cm6v2pemz0000c9p4ji458oes	cm6udvsup001110qv32tzhntg
cm73l59ug0004c9156hav5cxy	cm6v2pemz0000c9p4ji458oes	cm6udvsup001210qvja9o2dc3
cm73l59ug0005c9151dfswl7l	cm6v2pemz0000c9p4ji458oes	cm6udvsup001310qv4yrerz76
cm73l59uh0006c915pvl5q3b0	cm6v2pemz0000c9p4ji458oes	cm6udvsup001410qvrzeixh5c
cm73l6ycy0007c9159pm96e3j	cm6v2pemz0000c9p4ji458oes	cm6udvsup000g10qv0nu0gu2c
cm73l6ycz0008c9155gd9imq6	cm6v2pemz0000c9p4ji458oes	cm6udvsuo000410qv5vz0rmpc
cm73l6ycz0009c915ipaxxivr	cm6v2pemz0000c9p4ji458oes	cm6udvsup000j10qvo5c7tdfk
cm7tchil50003c97p2l3a3a82	cm7tc5x1n0002c97pgn49ty8c	cm6udvsuo000910qv75e0i2nj
cm7tchil50004c97ptq85uz3k	cm7tc5x1n0002c97pgn49ty8c	cm6udvsuo000a10qvgcz5r94t
cm7kun5tm000zc95394uhohft	cm7ku4xks0003c94rca7slwfm	cm6udvsuo000010qv64paenzk
cm7kun5tn0010c9530mtylus0	cm7ku4xks0003c94rca7slwfm	cm6udvsuo000110qv6s3dj841
cm7kun5tn0011c953muooyq03	cm7ku4xks0003c94rca7slwfm	cm6udvsuo000210qv19dr0qz5
cm7kun5tn0012c953weucvzbr	cm7ku4xks0003c94rca7slwfm	cm6udvsuo000310qvf842gv9q
cm7kun5tn0013c9535ndze2iq	cm7ku4xks0003c94rca7slwfm	cm6udvsuo000410qv5vz0rmpc
cm7kun5tn0014c953j51dn1wb	cm7ku4xks0003c94rca7slwfm	cm6udvsuo000510qv0lik85z8
cm7kun5tn0015c953m82gtg2q	cm7ku4xks0003c94rca7slwfm	cm6udvsup000f10qvjz7kials
\.


--
-- Data for Name: UserSubscription; Type: TABLE DATA; Schema: public; Owner: query_user_1
--

COPY public."UserSubscription" (id, "userId", "planId", "startDate", "endDate", "isActive", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: Answer Answer_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_pkey" PRIMARY KEY (id);


--
-- Name: Challenge Challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Challenge"
    ADD CONSTRAINT "Challenge_pkey" PRIMARY KEY (id);


--
-- Name: Chapter Chapter_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Chapter"
    ADD CONSTRAINT "Chapter_pkey" PRIMARY KEY (id);


--
-- Name: Class Class_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_pkey" PRIMARY KEY (id);


--
-- Name: DynamicContent DynamicContent_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."DynamicContent"
    ADD CONSTRAINT "DynamicContent_pkey" PRIMARY KEY (id);


--
-- Name: ExamAttempt ExamAttempt_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."ExamAttempt"
    ADD CONSTRAINT "ExamAttempt_pkey" PRIMARY KEY (id);


--
-- Name: ExamQuestion ExamQuestion_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."ExamQuestion"
    ADD CONSTRAINT "ExamQuestion_pkey" PRIMARY KEY (id);


--
-- Name: Exam Exam_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_pkey" PRIMARY KEY (id);


--
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: Otp Otp_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Otp"
    ADD CONSTRAINT "Otp_pkey" PRIMARY KEY (id);


--
-- Name: QuestionPaper QuestionPaper_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."QuestionPaper"
    ADD CONSTRAINT "QuestionPaper_pkey" PRIMARY KEY (id);


--
-- Name: Question Question_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: SharedQuestion SharedQuestion_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."SharedQuestion"
    ADD CONSTRAINT "SharedQuestion_pkey" PRIMARY KEY (id);


--
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (id);


--
-- Name: SubscriptionPlan SubscriptionPlan_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."SubscriptionPlan"
    ADD CONSTRAINT "SubscriptionPlan_pkey" PRIMARY KEY (id);


--
-- Name: UserInteraction UserInteraction_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserInteraction"
    ADD CONSTRAINT "UserInteraction_pkey" PRIMARY KEY (id);


--
-- Name: UserSubject UserSubject_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserSubject"
    ADD CONSTRAINT "UserSubject_pkey" PRIMARY KEY (id);


--
-- Name: UserSubscription UserSubscription_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserSubscription"
    ADD CONSTRAINT "UserSubscription_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Chapter_userId_subjectId_name_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "Chapter_userId_subjectId_name_key" ON public."Chapter" USING btree ("userId", "subjectId", name);


--
-- Name: Session_userId_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "Session_userId_key" ON public."Session" USING btree ("userId");


--
-- Name: SharedQuestion_questionId_userId_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "SharedQuestion_questionId_userId_key" ON public."SharedQuestion" USING btree ("questionId", "userId");


--
-- Name: SubscriptionPlan_name_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "SubscriptionPlan_name_key" ON public."SubscriptionPlan" USING btree (name);


--
-- Name: UserInteraction_followerId_followingId_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "UserInteraction_followerId_followingId_key" ON public."UserInteraction" USING btree ("followerId", "followingId");


--
-- Name: UserSubject_userId_subjectId_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "UserSubject_userId_subjectId_key" ON public."UserSubject" USING btree ("userId", "subjectId");


--
-- Name: UserSubscription_userId_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "UserSubscription_userId_key" ON public."UserSubscription" USING btree ("userId");


--
-- Name: User_phoneNumber_key; Type: INDEX; Schema: public; Owner: query_user_1
--

CREATE UNIQUE INDEX "User_phoneNumber_key" ON public."User" USING btree ("phoneNumber");


--
-- Name: Answer Answer_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Answer"
    ADD CONSTRAINT "Answer_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."Question"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Challenge Challenge_examId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Challenge"
    ADD CONSTRAINT "Challenge_examId_fkey" FOREIGN KEY ("examId") REFERENCES public."Exam"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Challenge Challenge_receiverId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Challenge"
    ADD CONSTRAINT "Challenge_receiverId_fkey" FOREIGN KEY ("receiverId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Challenge Challenge_senderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Challenge"
    ADD CONSTRAINT "Challenge_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Challenge Challenge_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Challenge"
    ADD CONSTRAINT "Challenge_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Chapter Chapter_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Chapter"
    ADD CONSTRAINT "Chapter_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Chapter Chapter_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Chapter"
    ADD CONSTRAINT "Chapter_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ExamAttempt ExamAttempt_examId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."ExamAttempt"
    ADD CONSTRAINT "ExamAttempt_examId_fkey" FOREIGN KEY ("examId") REFERENCES public."Exam"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ExamAttempt ExamAttempt_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."ExamAttempt"
    ADD CONSTRAINT "ExamAttempt_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ExamQuestion ExamQuestion_examId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."ExamQuestion"
    ADD CONSTRAINT "ExamQuestion_examId_fkey" FOREIGN KEY ("examId") REFERENCES public."Exam"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Exam Exam_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Exam Exam_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Notification Notification_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: QuestionPaper QuestionPaper_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."QuestionPaper"
    ADD CONSTRAINT "QuestionPaper_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: QuestionPaper QuestionPaper_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."QuestionPaper"
    ADD CONSTRAINT "QuestionPaper_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: QuestionPaper QuestionPaper_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."QuestionPaper"
    ADD CONSTRAINT "QuestionPaper_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Question Question_chapterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES public."Chapter"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Question Question_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Question Question_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Question Question_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SharedQuestion SharedQuestion_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."SharedQuestion"
    ADD CONSTRAINT "SharedQuestion_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."Question"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SharedQuestion SharedQuestion_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."SharedQuestion"
    ADD CONSTRAINT "SharedQuestion_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserInteraction UserInteraction_followerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserInteraction"
    ADD CONSTRAINT "UserInteraction_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserInteraction UserInteraction_followingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserInteraction"
    ADD CONSTRAINT "UserInteraction_followingId_fkey" FOREIGN KEY ("followingId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserSubject UserSubject_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserSubject"
    ADD CONSTRAINT "UserSubject_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserSubject UserSubject_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserSubject"
    ADD CONSTRAINT "UserSubject_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserSubscription UserSubscription_planId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserSubscription"
    ADD CONSTRAINT "UserSubscription_planId_fkey" FOREIGN KEY ("planId") REFERENCES public."SubscriptionPlan"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserSubscription UserSubscription_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."UserSubscription"
    ADD CONSTRAINT "UserSubscription_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: User User_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: query_user_1
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

