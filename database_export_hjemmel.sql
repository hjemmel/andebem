--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: ahc; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ahc;


SET search_path = ahc, pg_catalog;

--
-- Name: acessorio_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE acessorio_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: acessorio_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('acessorio_id_seq', 9, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acessorio; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE acessorio (
    id integer DEFAULT nextval('acessorio_id_seq'::regclass) NOT NULL,
    nome character varying(30) NOT NULL
);


--
-- Name: alteracoes_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE alteracoes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: alteracoes_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('alteracoes_id_seq', 7, true);


--
-- Name: alteracoes; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE alteracoes (
    id integer DEFAULT nextval('alteracoes_id_seq'::regclass) NOT NULL,
    descricao text,
    ativa boolean DEFAULT false NOT NULL,
    id_automovel integer NOT NULL
);


--
-- Name: automovel_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE automovel_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: automovel_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('automovel_id_seq', 15, true);


--
-- Name: automovel; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE automovel (
    id integer DEFAULT nextval('automovel_id_seq'::regclass) NOT NULL,
    id_modelo integer NOT NULL,
    ano integer NOT NULL,
    placa character varying(10),
    chassi character varying(20) NOT NULL,
    preco numeric(10,2) NOT NULL,
    data_insert timestamp without time zone NOT NULL,
    data_update timestamp without time zone,
    id_usuario_gravacao integer NOT NULL,
    cor character varying(25) NOT NULL,
    combustivel character varying(25) NOT NULL,
    renavam character varying(10),
    data_compra date,
    num_nota character varying(25),
    id_categoria integer NOT NULL,
    num_portas integer NOT NULL,
    id_status integer NOT NULL
);


--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE categoria_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('categoria_id_seq', 3, true);


--
-- Name: categoria; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE categoria (
    id integer DEFAULT nextval('categoria_id_seq'::regclass) NOT NULL,
    nome character varying(30)
);


--
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE cidade_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('cidade_id_seq', 1, true);


--
-- Name: cidade; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE cidade (
    id integer DEFAULT nextval('cidade_id_seq'::regclass) NOT NULL,
    nome character varying(50) NOT NULL,
    id_estado integer NOT NULL
);


--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE cliente_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('cliente_id_seq', 11, true);


--
-- Name: cliente; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE cliente (
    id integer DEFAULT nextval('cliente_id_seq'::regclass) NOT NULL,
    nome character varying(50) NOT NULL,
    cpf_cnpj character varying(16) NOT NULL,
    data_nasc date NOT NULL,
    endereco character varying(150) NOT NULL,
    tempo_carteira integer NOT NULL,
    seguro_opcional boolean DEFAULT false NOT NULL,
    id_tipo_pessoa integer NOT NULL,
    id_cidade integer NOT NULL
);


--
-- Name: estado_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE estado_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('estado_id_seq', 2, true);


--
-- Name: estado; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE estado (
    id integer DEFAULT nextval('estado_id_seq'::regclass) NOT NULL,
    nome character varying(50)
);


--
-- Name: locacao_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE locacao_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: locacao_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('locacao_id_seq', 12, true);


--
-- Name: locacao; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE locacao (
    id integer DEFAULT nextval('locacao_id_seq'::regclass) NOT NULL,
    id_automovel integer NOT NULL,
    id_cliente integer NOT NULL,
    data_saida date NOT NULL,
    data_entrada date,
    tempo_locacao integer NOT NULL
);


--
-- Name: marca_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE marca_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: marca_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('marca_id_seq', 24, true);


--
-- Name: marca; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE marca (
    id integer DEFAULT nextval('marca_id_seq'::regclass) NOT NULL,
    nome character varying(30) NOT NULL
);


--
-- Name: modelo_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE modelo_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: modelo_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('modelo_id_seq', 31, true);


--
-- Name: modelo; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE modelo (
    id integer DEFAULT nextval('modelo_id_seq'::regclass) NOT NULL,
    nome character varying(30) NOT NULL,
    id_marca integer NOT NULL
);


--
-- Name: opcionais_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE opcionais_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: opcionais_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('opcionais_id_seq', 111, true);


--
-- Name: opcionais; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE opcionais (
    id integer DEFAULT nextval('opcionais_id_seq'::regclass) NOT NULL,
    id_acessorio integer NOT NULL,
    id_automovel integer NOT NULL
);


--
-- Name: ordem_servico_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE ordem_servico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ordem_servico_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('ordem_servico_id_seq', 1, false);


--
-- Name: ordem_servico; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE ordem_servico (
    id integer DEFAULT nextval('ordem_servico_id_seq'::regclass) NOT NULL,
    observacao text,
    data_entrada date NOT NULL,
    date_saida date,
    finalizada boolean DEFAULT false NOT NULL
);


--
-- Name: servicos_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE servicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: servicos_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('servicos_id_seq', 1, false);


--
-- Name: servicos; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE servicos (
    id integer DEFAULT nextval('servicos_id_seq'::regclass) NOT NULL,
    id_alteracao integer NOT NULL,
    descricao text,
    id_ordem_servico integer NOT NULL
);


--
-- Name: status_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE status_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('status_id_seq', 7, true);


--
-- Name: status; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE status (
    id integer DEFAULT nextval('status_id_seq'::regclass) NOT NULL,
    nome character varying(25) NOT NULL,
    disponivel boolean DEFAULT false NOT NULL
);


--
-- Name: tipo_pessoa_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE tipo_pessoa_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tipo_pessoa_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('tipo_pessoa_id_seq', 2, true);


--
-- Name: tipo_pessoa; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE tipo_pessoa (
    id integer DEFAULT nextval('tipo_pessoa_id_seq'::regclass) NOT NULL,
    nome character varying(20) NOT NULL
);


--
-- Name: tipo_usuario_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE tipo_usuario_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tipo_usuario_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('tipo_usuario_id_seq', 3, true);


--
-- Name: tipo_usuario; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE tipo_usuario (
    id integer DEFAULT nextval('tipo_usuario_id_seq'::regclass) NOT NULL,
    nome character varying(25)
);


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: ahc; Owner: -
--

CREATE SEQUENCE usuario_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: ahc; Owner: -
--

SELECT pg_catalog.setval('usuario_id_seq', 11, true);


--
-- Name: usuario; Type: TABLE; Schema: ahc; Owner: -; Tablespace:
--

CREATE TABLE usuario (
    id integer DEFAULT nextval('usuario_id_seq'::regclass) NOT NULL,
    nome character varying(150) NOT NULL,
    login character varying(15) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(50) NOT NULL,
    id_tipo_usuario integer NOT NULL
);


--
-- Data for Name: acessorio; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO acessorio VALUES (7, 'Trava Elétrica');
INSERT INTO acessorio VALUES (8, 'Sensor de Estacionam');
INSERT INTO acessorio VALUES (4, 'Bancos de couro');
INSERT INTO acessorio VALUES (5, 'Direção Hidráulica');
INSERT INTO acessorio VALUES (6, 'Vidros Elétricos');
INSERT INTO acessorio VALUES (9, 'Limpador automático');


--
-- Data for Name: alteracoes; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO alteracoes VALUES (1, 'Arranhão na porta esquerda', false, 3);
INSERT INTO alteracoes VALUES (2, 'Pequeno amassado no capô', false, 3);
INSERT INTO alteracoes VALUES (6, 'tecido do banoc do motorista rasgado', false, 6);
INSERT INTO alteracoes VALUES (7, 'arranhão na porta dereita', false, 6);


--
-- Data for Name: automovel; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO automovel VALUES (6, 16, 1998, 'lCI5344', 'YY41N4H1G4F1F41DS', 15000.00, '2011-06-29 10:58:23.979', '2011-06-29 19:48:28.384', 3, 'Cinza', 'Gasolina', '70049656fr', '2011-06-29', '5454564', 1, 2, 1);
INSERT INTO automovel VALUES (2, 3, 2010, 'AAP 6535', 'CB400BR2053625', 200000.00, '2011-06-28 14:46:27.672', '2011-06-28 14:46:27.672', 1, 'Preto', 'Gasolina', '536123214', '2011-06-28', '645', 1, 4, 2);
INSERT INTO automovel VALUES (3, 26, 2009, 'DMH 7613', 'CB400BR2353525', 50000.00, '2011-06-28 14:46:27.672', '2011-06-28 14:46:27.672', 1, 'Prata', 'Flex', '933125214', '2011-06-28', '563', 1, 4, 4);
INSERT INTO automovel VALUES (12, 29, 2007, 'DFR2124', '21SD25FR21UJ96AQW', 50000.00, '2011-06-29 12:44:31.078', NULL, 2, 'Prata', 'Flex', '321485697', '2011-06-29', '100023662512', 1, 2, 1);
INSERT INTO automovel VALUES (1, 30, 1967, 'KAZ 2654', '9FFNP41AX2M000001', 200000.00, '2011-06-28 14:46:27.672', '2011-06-29 19:47:12.936', 1, 'Preto', 'Gasolina', '736125213', '2011-06-28', '435', 1, 4, 4);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO categoria VALUES (1, 'Passeio');
INSERT INTO categoria VALUES (2, 'Carga');
INSERT INTO categoria VALUES (3, 'Coletivo');


--
-- Data for Name: cidade; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO cidade VALUES (1, 'Rio de Janeiro', 1);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO cliente VALUES (1, 'Hans Jakob Emmel', '12295964709', '1987-12-30', 'Tr. Pedreiras', 4, false, 1, 1);
INSERT INTO cliente VALUES (2, 'Robson de Mello', '000000000', '1987-11-14', 'Tr. do taco', 4, false, 1, 1);
INSERT INTO cliente VALUES (3, 'Roberto Guimarães da Costa', '12145232563', '1985-03-13', 'Rua Itapuã Nº9', 4, true, 1, 1);
INSERT INTO cliente VALUES (4, 'José Dias Amaral', '32612512458', '1984-02-10', 'Av Costa Lemos 121', 2, true, 2, 1);
INSERT INTO cliente VALUES (5, 'Ana Claudia', '31523621521', '1983-06-14', 'Rua Gozaga Nº520', 10, false, 1, 1);
INSERT INTO cliente VALUES (11, 'Caio Pol', '03758004764', '1993-06-02', 'RUA MARIA CARVALHO, 80', 4, false, 1, 1);


--
-- Data for Name: estado; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO estado VALUES (1, 'Rio de Janeiro');
INSERT INTO estado VALUES (2, 'São Paulo');


--
-- Data for Name: locacao; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO locacao VALUES (1, 1, 1, '2011-03-03', '2011-06-28', 1);
INSERT INTO locacao VALUES (2, 1, 2, '2011-02-03', '2011-02-03', 1);
INSERT INTO locacao VALUES (3, 1, 2, '2011-02-03', '2011-06-28', 1);
INSERT INTO locacao VALUES (4, 2, 1, '2011-03-03', '2011-06-28', 1);
INSERT INTO locacao VALUES (5, 3, 2, '2011-02-03', '2011-06-28', 1);
INSERT INTO locacao VALUES (6, 1, 2, '2011-06-28', '2011-06-28', 0);
INSERT INTO locacao VALUES (7, 3, 2, '2011-06-28', '2011-06-28', 0);
INSERT INTO locacao VALUES (8, 1, 5, '2011-06-28', NULL, 0);
INSERT INTO locacao VALUES (9, 2, 3, '2011-06-29', '2011-06-29', 0);
INSERT INTO locacao VALUES (10, 3, 3, '2011-06-29', NULL, 0);
INSERT INTO locacao VALUES (11, 6, 4, '2011-06-29', '2011-06-29', 0);
INSERT INTO locacao VALUES (12, 6, 11, '2011-06-29', '2011-06-29', 0);


--
-- Data for Name: marca; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO marca VALUES (1, 'Agrale');
INSERT INTO marca VALUES (2, 'Alfa Romeo');
INSERT INTO marca VALUES (3, 'Audi');
INSERT INTO marca VALUES (4, 'BMW');
INSERT INTO marca VALUES (5, 'Cadillac');
INSERT INTO marca VALUES (6, 'CBT');
INSERT INTO marca VALUES (7, 'Chevrolet');
INSERT INTO marca VALUES (8, 'Citroën');
INSERT INTO marca VALUES (9, 'Dodge');
INSERT INTO marca VALUES (10, 'Ferrari');
INSERT INTO marca VALUES (11, 'Fiat');
INSERT INTO marca VALUES (12, 'Ford');
INSERT INTO marca VALUES (13, 'Honda');
INSERT INTO marca VALUES (14, 'Hyundai');
INSERT INTO marca VALUES (15, 'Jaguar');
INSERT INTO marca VALUES (16, 'KIA');
INSERT INTO marca VALUES (17, 'Lamborghini');
INSERT INTO marca VALUES (18, 'Mazda');
INSERT INTO marca VALUES (19, 'Mitsubishi');
INSERT INTO marca VALUES (20, 'Nissan');
INSERT INTO marca VALUES (21, 'Peugeot');
INSERT INTO marca VALUES (22, 'Renault');
INSERT INTO marca VALUES (23, 'Toyota');
INSERT INTO marca VALUES (24, 'Volkswagen');


--
-- Data for Name: modelo; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO modelo VALUES (1, 'Belina', 12);
INSERT INTO modelo VALUES (2, 'Jumper', 8);
INSERT INTO modelo VALUES (3, 'Cerato', 16);
INSERT INTO modelo VALUES (4, 'C6', 8);
INSERT INTO modelo VALUES (5, 'Série 1', 4);
INSERT INTO modelo VALUES (6, 'A3', 3);
INSERT INTO modelo VALUES (7, 'RS4 Sedan', 3);
INSERT INTO modelo VALUES (8, 'C3', 8);
INSERT INTO modelo VALUES (9, 'TT Coupé', 3);
INSERT INTO modelo VALUES (10, 'Livina', 20);
INSERT INTO modelo VALUES (11, 'C4 Pallas', 8);
INSERT INTO modelo VALUES (12, '350Z', 20);
INSERT INTO modelo VALUES (13, 'Fusion', 12);
INSERT INTO modelo VALUES (14, 'Sportage', 16);
INSERT INTO modelo VALUES (15, 'Tiida', 20);
INSERT INTO modelo VALUES (16, 'Uno', 11);
INSERT INTO modelo VALUES (17, 'Fusca', 24);
INSERT INTO modelo VALUES (18, 'Tipo', 11);
INSERT INTO modelo VALUES (19, 'Punto', 11);
INSERT INTO modelo VALUES (20, 'Omega', 7);
INSERT INTO modelo VALUES (21, '206 SW', 21);
INSERT INTO modelo VALUES (22, 'Celta', 7);
INSERT INTO modelo VALUES (23, 'Accord', 13);
INSERT INTO modelo VALUES (24, 'Corrolla', 23);
INSERT INTO modelo VALUES (25, 'Uno', 11);
INSERT INTO modelo VALUES (26, 'Fox', 24);
INSERT INTO modelo VALUES (27, 'Opirus', 16);
INSERT INTO modelo VALUES (28, 'Twingo', 22);
INSERT INTO modelo VALUES (29, 'Logan', 22);
INSERT INTO modelo VALUES (30, 'Impala', 7);
INSERT INTO modelo VALUES (31, 'New Civic', 13);


--
-- Data for Name: opcionais; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO opcionais VALUES (83, 7, 12);
INSERT INTO opcionais VALUES (111, 4, 6);


--
-- Data for Name: ordem_servico; Type: TABLE DATA; Schema: ahc; Owner: -
--



--
-- Data for Name: servicos; Type: TABLE DATA; Schema: ahc; Owner: -
--



--
-- Data for Name: status; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO status VALUES (1, 'Disponivel', true);
INSERT INTO status VALUES (2, 'Passivo de Locação', false);
INSERT INTO status VALUES (3, 'Locação', false);
INSERT INTO status VALUES (4, 'Manutenção', false);
INSERT INTO status VALUES (5, 'O.S.', false);
INSERT INTO status VALUES (6, 'Venda', true);
INSERT INTO status VALUES (7, 'Vendido', false);


--
-- Data for Name: tipo_pessoa; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO tipo_pessoa VALUES (1, 'Física');
INSERT INTO tipo_pessoa VALUES (2, 'Jurídica');


--
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO tipo_usuario VALUES (1, 'Gerente');
INSERT INTO tipo_usuario VALUES (2, 'Atendente');
INSERT INTO tipo_usuario VALUES (3, 'Inspetor');


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: ahc; Owner: -
--

INSERT INTO usuario VALUES (1, 'Hans Jakob Emmel', 'hjemmel', 'hans.emmel@gmail.com', 'abc123', 1);
INSERT INTO usuario VALUES (10, 'atendente', 'atend', 'atend@atend.com', 'abc123', 2);
INSERT INTO usuario VALUES (11, 'inspetor', 'insp', 'insp@insp.com', 'abc123', 3);


--
-- Name: pk_id_acessorio; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY acessorio
    ADD CONSTRAINT pk_id_acessorio PRIMARY KEY (id);


--
-- Name: pk_id_alteracoes; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY alteracoes
    ADD CONSTRAINT pk_id_alteracoes PRIMARY KEY (id);


--
-- Name: pk_id_automovel; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY automovel
    ADD CONSTRAINT pk_id_automovel PRIMARY KEY (id);


--
-- Name: pk_id_categoria; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT pk_id_categoria PRIMARY KEY (id);


--
-- Name: pk_id_cidade; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT pk_id_cidade PRIMARY KEY (id);


--
-- Name: pk_id_cliente; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_id_cliente PRIMARY KEY (id);


--
-- Name: pk_id_estado; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pk_id_estado PRIMARY KEY (id);


--
-- Name: pk_id_locacao; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY locacao
    ADD CONSTRAINT pk_id_locacao PRIMARY KEY (id);


--
-- Name: pk_id_marca; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT pk_id_marca PRIMARY KEY (id);


--
-- Name: pk_id_modelo; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT pk_id_modelo PRIMARY KEY (id);


--
-- Name: pk_id_opcionais; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY opcionais
    ADD CONSTRAINT pk_id_opcionais PRIMARY KEY (id);


--
-- Name: pk_id_ordem_servico; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT pk_id_ordem_servico PRIMARY KEY (id);


--
-- Name: pk_id_servicos; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY servicos
    ADD CONSTRAINT pk_id_servicos PRIMARY KEY (id);


--
-- Name: pk_id_status; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY status
    ADD CONSTRAINT pk_id_status PRIMARY KEY (id);


--
-- Name: pk_id_tipo_pessoa; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY tipo_pessoa
    ADD CONSTRAINT pk_id_tipo_pessoa PRIMARY KEY (id);


--
-- Name: pk_id_tipo_usuario; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY tipo_usuario
    ADD CONSTRAINT pk_id_tipo_usuario PRIMARY KEY (id);


--
-- Name: pk_id_usuario; Type: CONSTRAINT; Schema: ahc; Owner: -; Tablespace:
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_id_usuario PRIMARY KEY (id);


--
-- Name: fk_alteracoes_automovel; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY alteracoes
    ADD CONSTRAINT fk_alteracoes_automovel FOREIGN KEY (id_automovel) REFERENCES automovel(id);


--
-- Name: fk_automovel_categoria; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY automovel
    ADD CONSTRAINT fk_automovel_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id);


--
-- Name: fk_automovel_modelo; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY automovel
    ADD CONSTRAINT fk_automovel_modelo FOREIGN KEY (id_modelo) REFERENCES modelo(id);


--
-- Name: fk_automovel_status; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY automovel
    ADD CONSTRAINT fk_automovel_status FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: fk_automovel_usuario_gravacao; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY automovel
    ADD CONSTRAINT fk_automovel_usuario_gravacao FOREIGN KEY (id_usuario_gravacao) REFERENCES usuario(id);


--
-- Name: fk_cidade_estado; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado(id);


--
-- Name: fk_cliente_cidade; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_cliente_cidade FOREIGN KEY (id_cidade) REFERENCES cidade(id);


--
-- Name: fk_cliente_tipo_pessoa; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_cliente_tipo_pessoa FOREIGN KEY (id_tipo_pessoa) REFERENCES tipo_pessoa(id);


--
-- Name: fk_locacao_automovel; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY locacao
    ADD CONSTRAINT fk_locacao_automovel FOREIGN KEY (id_automovel) REFERENCES automovel(id);


--
-- Name: fk_locacao_cliente; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY locacao
    ADD CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- Name: fk_modelo_marca; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT fk_modelo_marca FOREIGN KEY (id_marca) REFERENCES marca(id);


--
-- Name: fk_opcionais_acessorio; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY opcionais
    ADD CONSTRAINT fk_opcionais_acessorio FOREIGN KEY (id_acessorio) REFERENCES acessorio(id);


--
-- Name: fk_opcionais_automovel; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY opcionais
    ADD CONSTRAINT fk_opcionais_automovel FOREIGN KEY (id_automovel) REFERENCES automovel(id);


--
-- Name: fk_servicos_alteracoes; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY servicos
    ADD CONSTRAINT fk_servicos_alteracoes FOREIGN KEY (id_alteracao) REFERENCES alteracoes(id);


--
-- Name: fk_servicos_ordem_servico; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY servicos
    ADD CONSTRAINT fk_servicos_ordem_servico FOREIGN KEY (id_ordem_servico) REFERENCES ordem_servico(id);


--
-- Name: fk_tipo_usuario_usuario; Type: FK CONSTRAINT; Schema: ahc; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_tipo_usuario_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM hjemmel1;
GRANT ALL ON SCHEMA public TO hjemmel1;


--
-- PostgreSQL database dump complete
--
