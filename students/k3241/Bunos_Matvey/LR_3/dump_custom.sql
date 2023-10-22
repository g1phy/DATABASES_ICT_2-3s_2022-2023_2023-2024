PGDMP  ,    +            	    {            dbg1phy #   14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)    16.0 =    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            t           1262    133796    dbg1phy    DATABASE     o   CREATE DATABASE dbg1phy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE dbg1phy;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            u           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    133927 	   accidents    TABLE     M  CREATE TABLE public.accidents (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    location character varying(64) NOT NULL,
    description character varying(128) NOT NULL,
    culprit integer NOT NULL,
    CONSTRAINT culprit CHECK (((culprit >= 1) AND (culprit <= 2)))
);
    DROP TABLE public.accidents;
       public         heap    dbg1phy    false    4            �            1259    133970    acts    TABLE       CREATE TABLE public.acts (
    id integer NOT NULL,
    type integer NOT NULL,
    note character varying(64) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    contact_id integer NOT NULL,
    CONSTRAINT type CHECK (((type >= 1) AND (type <= 2)))
);
    DROP TABLE public.acts;
       public         heap    dbg1phy    false    4            �            1259    133797 
   car_models    TABLE     �   CREATE TABLE public.car_models (
    id integer NOT NULL,
    name character varying(24) NOT NULL,
    technical_details character varying(256) NOT NULL,
    description character varying(256) NOT NULL
);
    DROP TABLE public.car_models;
       public         heap    dbg1phy    false    4            �            1259    133818    cars    TABLE     �  CREATE TABLE public.cars (
    id integer NOT NULL,
    registration_number character varying(10) NOT NULL,
    mileage integer NOT NULL,
    issue_year integer NOT NULL,
    engine_number character varying(32) NOT NULL,
    body_number character varying(32) NOT NULL,
    price integer NOT NULL,
    last_inspection date NOT NULL,
    special_marks character varying(128),
    return_mark integer NOT NULL,
    model_id integer NOT NULL,
    CONSTRAINT issue_year CHECK ((issue_year > 2000)),
    CONSTRAINT last_inspection CHECK ((last_inspection > '2020-01-01'::date)),
    CONSTRAINT mileage CHECK ((mileage >= 0)),
    CONSTRAINT price CHECK ((price > 0)),
    CONSTRAINT return_mark CHECK (((return_mark >= 0) AND (return_mark <= 1)))
);
    DROP TABLE public.cars;
       public         heap    dbg1phy    false    4            �            1259    133871    clients    TABLE     �  CREATE TABLE public.clients (
    id integer NOT NULL,
    mobile_phone character varying(16) NOT NULL,
    name character varying(48) NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    adress character varying(64) NOT NULL,
    passport_series character varying(4) NOT NULL,
    passport_number integer NOT NULL,
    CONSTRAINT discount CHECK (((discount >= 0) AND (discount <= 100)))
);
    DROP TABLE public.clients;
       public         heap    dbg1phy    false    4            �            1259    133891 	   contracts    TABLE     {  CREATE TABLE public.contracts (
    id integer NOT NULL,
    given_datetime timestamp with time zone NOT NULL,
    returned_datetime timestamp with time zone NOT NULL,
    result_price integer NOT NULL,
    deposit integer NOT NULL,
    returned_deposit boolean DEFAULT false NOT NULL,
    payment_status boolean DEFAULT false NOT NULL,
    common_status integer DEFAULT 0 NOT NULL,
    car_id integer NOT NULL,
    insurance_id integer NOT NULL,
    employee_id integer NOT NULL,
    client_id integer NOT NULL,
    CONSTRAINT common_status CHECK (((common_status >= 0) AND (common_status <= 1))),
    CONSTRAINT deposit CHECK ((deposit > 0)),
    CONSTRAINT given_datetime CHECK ((given_datetime > '2023-05-09 03:00:00+03'::timestamp with time zone)),
    CONSTRAINT result_price CHECK ((result_price > 0)),
    CONSTRAINT returned_datetime CHECK ((returned_datetime > given_datetime))
);
    DROP TABLE public.contracts;
       public         heap    dbg1phy    false    4            �            1259    133878 	   employees    TABLE     �   CREATE TABLE public.employees (
    id integer NOT NULL,
    name character varying(48) NOT NULL,
    passport_series character varying(4) NOT NULL,
    passport_number integer NOT NULL,
    position_id integer NOT NULL
);
    DROP TABLE public.employees;
       public         heap    dbg1phy    false    4            �            1259    133852 
   insurances    TABLE     �   CREATE TABLE public.insurances (
    id integer NOT NULL,
    type integer NOT NULL,
    price integer NOT NULL,
    CONSTRAINT price CHECK ((price > 0)),
    CONSTRAINT type CHECK (((type >= 1) AND (type <= 3)))
);
    DROP TABLE public.insurances;
       public         heap    dbg1phy    false    4            �            1259    133865 	   positions    TABLE     �   CREATE TABLE public.positions (
    id integer NOT NULL,
    name character varying(48) NOT NULL,
    salary integer NOT NULL,
    responsibilities character varying(128) NOT NULL,
    CONSTRAINT salary CHECK ((salary > 0))
);
    DROP TABLE public.positions;
       public         heap    dbg1phy    false    4            �            1259    133959    renewals    TABLE     �   CREATE TABLE public.renewals (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    hours integer NOT NULL,
    CONSTRAINT hours CHECK ((hours > 0))
);
    DROP TABLE public.renewals;
       public         heap    dbg1phy    false    4            �            1259    133839    rent_prices    TABLE     �  CREATE TABLE public.rent_prices (
    id integer NOT NULL,
    model_id integer NOT NULL,
    price integer NOT NULL,
    start_datetime timestamp with time zone NOT NULL,
    end_datetime timestamp with time zone,
    CONSTRAINT end_datetime CHECK ((end_datetime > start_datetime)),
    CONSTRAINT price CHECK ((price > 0)),
    CONSTRAINT start_datetime CHECK ((start_datetime > '2023-05-09 03:00:00+03'::timestamp with time zone))
);
    DROP TABLE public.rent_prices;
       public         heap    dbg1phy    false    4            �            1259    133938 
   violations    TABLE     �   CREATE TABLE public.violations (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    violations_dict_id integer NOT NULL,
    accident_id integer,
    payeer integer NOT NULL,
    CONSTRAINT payeer CHECK (((payeer >= 1) AND (payeer <= 2)))
);
    DROP TABLE public.violations;
       public         heap    dbg1phy    false    4            �            1259    133859    violations_dict    TABLE     �   CREATE TABLE public.violations_dict (
    id integer NOT NULL,
    fine_amount integer NOT NULL,
    description character varying(128) NOT NULL,
    CONSTRAINT fine_amount CHECK ((fine_amount >= 0))
);
 #   DROP TABLE public.violations_dict;
       public         heap    dbg1phy    false    4            k          0    133927 	   accidents 
   TABLE DATA           ^   COPY public.accidents (id, contract_id, datetime, location, description, culprit) FROM stdin;
    public          dbg1phy    false    218   nR       n          0    133970    acts 
   TABLE DATA           D   COPY public.acts (id, type, note, datetime, contact_id) FROM stdin;
    public          dbg1phy    false    221   S       b          0    133797 
   car_models 
   TABLE DATA           N   COPY public.car_models (id, name, technical_details, description) FROM stdin;
    public          dbg1phy    false    209   �S       c          0    133818    cars 
   TABLE DATA           �   COPY public.cars (id, registration_number, mileage, issue_year, engine_number, body_number, price, last_inspection, special_marks, return_mark, model_id) FROM stdin;
    public          dbg1phy    false    210   ET       h          0    133871    clients 
   TABLE DATA           m   COPY public.clients (id, mobile_phone, name, discount, adress, passport_series, passport_number) FROM stdin;
    public          dbg1phy    false    215   �T       j          0    133891 	   contracts 
   TABLE DATA           �   COPY public.contracts (id, given_datetime, returned_datetime, result_price, deposit, returned_deposit, payment_status, common_status, car_id, insurance_id, employee_id, client_id) FROM stdin;
    public          dbg1phy    false    217   �U       i          0    133878 	   employees 
   TABLE DATA           \   COPY public.employees (id, name, passport_series, passport_number, position_id) FROM stdin;
    public          dbg1phy    false    216   V       e          0    133852 
   insurances 
   TABLE DATA           5   COPY public.insurances (id, type, price) FROM stdin;
    public          dbg1phy    false    212   �V       g          0    133865 	   positions 
   TABLE DATA           G   COPY public.positions (id, name, salary, responsibilities) FROM stdin;
    public          dbg1phy    false    214   �V       m          0    133959    renewals 
   TABLE DATA           C   COPY public.renewals (id, contact_id, datetime, hours) FROM stdin;
    public          dbg1phy    false    220   oW       d          0    133839    rent_prices 
   TABLE DATA           X   COPY public.rent_prices (id, model_id, price, start_datetime, end_datetime) FROM stdin;
    public          dbg1phy    false    211   �W       l          0    133938 
   violations 
   TABLE DATA           ^   COPY public.violations (id, contract_id, violations_dict_id, accident_id, payeer) FROM stdin;
    public          dbg1phy    false    219   �W       f          0    133859    violations_dict 
   TABLE DATA           G   COPY public.violations_dict (id, fine_amount, description) FROM stdin;
    public          dbg1phy    false    213   �W       �           2606    133932    accidents accidents_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.accidents
    ADD CONSTRAINT accidents_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.accidents DROP CONSTRAINT accidents_pkey;
       public            dbg1phy    false    218            �           2606    133975    acts acts_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.acts
    ADD CONSTRAINT acts_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.acts DROP CONSTRAINT acts_pkey;
       public            dbg1phy    false    221            �           2606    133833    cars body_number 
   CONSTRAINT     R   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT body_number UNIQUE (body_number);
 :   ALTER TABLE ONLY public.cars DROP CONSTRAINT body_number;
       public            dbg1phy    false    210            �           2606    133801    car_models car_models_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.car_models
    ADD CONSTRAINT car_models_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.car_models DROP CONSTRAINT car_models_pkey;
       public            dbg1phy    false    209            �           2606    133827    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            dbg1phy    false    210            �           2606    133877    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            dbg1phy    false    215            �           2606    133903    contracts contracts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_pkey;
       public            dbg1phy    false    217            �           2606    133882    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            dbg1phy    false    216            �           2606    133831    cars engine_number 
   CONSTRAINT     V   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT engine_number UNIQUE (engine_number);
 <   ALTER TABLE ONLY public.cars DROP CONSTRAINT engine_number;
       public            dbg1phy    false    210            �           2606    133858    insurances insurances_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.insurances
    ADD CONSTRAINT insurances_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.insurances DROP CONSTRAINT insurances_pkey;
       public            dbg1phy    false    212            �           2606    133870    positions positions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_pkey;
       public            dbg1phy    false    214            �           2606    133829    cars regnumber 
   CONSTRAINT     X   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT regnumber UNIQUE (registration_number);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT regnumber;
       public            dbg1phy    false    210            �           2606    133964    renewals renewals_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.renewals
    ADD CONSTRAINT renewals_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.renewals DROP CONSTRAINT renewals_pkey;
       public            dbg1phy    false    220            �           2606    133846    rent_prices rent_prices_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.rent_prices
    ADD CONSTRAINT rent_prices_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.rent_prices DROP CONSTRAINT rent_prices_pkey;
       public            dbg1phy    false    211            �           2606    133864 $   violations_dict violations_dict_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.violations_dict
    ADD CONSTRAINT violations_dict_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.violations_dict DROP CONSTRAINT violations_dict_pkey;
       public            dbg1phy    false    213            �           2606    133943    violations violations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT violations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.violations DROP CONSTRAINT violations_pkey;
       public            dbg1phy    false    219            �           2606    133954    violations fk_accident_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT fk_accident_id FOREIGN KEY (accident_id) REFERENCES public.accidents(id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.violations DROP CONSTRAINT fk_accident_id;
       public          dbg1phy    false    218    219    3267            �           2606    133904    contracts fk_car_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES public.cars(id) ON DELETE SET NULL;
 =   ALTER TABLE ONLY public.contracts DROP CONSTRAINT fk_car_id;
       public          dbg1phy    false    217    210    3247            �           2606    133919    contracts fk_client_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE SET NULL;
 @   ALTER TABLE ONLY public.contracts DROP CONSTRAINT fk_client_id;
       public          dbg1phy    false    215    3261    217            �           2606    133933    accidents fk_contract_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accidents
    ADD CONSTRAINT fk_contract_id FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.accidents DROP CONSTRAINT fk_contract_id;
       public          dbg1phy    false    218    3265    217            �           2606    133944    violations fk_contract_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT fk_contract_id FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.violations DROP CONSTRAINT fk_contract_id;
       public          dbg1phy    false    217    3265    219            �           2606    133965    renewals fk_contract_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.renewals
    ADD CONSTRAINT fk_contract_id FOREIGN KEY (contact_id) REFERENCES public.contracts(id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.renewals DROP CONSTRAINT fk_contract_id;
       public          dbg1phy    false    3265    220    217            �           2606    133976    acts fk_contract_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.acts
    ADD CONSTRAINT fk_contract_id FOREIGN KEY (contact_id) REFERENCES public.contracts(id) ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.acts DROP CONSTRAINT fk_contract_id;
       public          dbg1phy    false    3265    221    217            �           2606    133914    contracts fk_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.contracts DROP CONSTRAINT fk_employee_id;
       public          dbg1phy    false    217    3263    216            �           2606    133909    contracts fk_insurance_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT fk_insurance_id FOREIGN KEY (insurance_id) REFERENCES public.insurances(id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.contracts DROP CONSTRAINT fk_insurance_id;
       public          dbg1phy    false    217    212    3255            �           2606    133834    cars fk_model_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT fk_model_id FOREIGN KEY (model_id) REFERENCES public.car_models(id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.cars DROP CONSTRAINT fk_model_id;
       public          dbg1phy    false    210    3243    209            �           2606    133847    rent_prices fk_model_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.rent_prices
    ADD CONSTRAINT fk_model_id FOREIGN KEY (model_id) REFERENCES public.car_models(id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.rent_prices DROP CONSTRAINT fk_model_id;
       public          dbg1phy    false    209    211    3243            �           2606    133883    employees fk_position_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_position_id FOREIGN KEY (position_id) REFERENCES public.positions(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_position_id;
       public          dbg1phy    false    214    3259    216            �           2606    133949     violations fk_violations_dict_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.violations
    ADD CONSTRAINT fk_violations_dict_id FOREIGN KEY (violations_dict_id) REFERENCES public.violations_dict(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.violations DROP CONSTRAINT fk_violations_dict_id;
       public          dbg1phy    false    213    3257    219            k   �   x�M�A
1E��)��J�эg�0N��Ka��т��^��F�n��!�Ҡ�[/¢��Va �Qۈ3�+&FAb���K�6�hG��)��,�?���K����qkGӻmmP�2N1��]�Dfk+�ѭ�"u��s��\0      n   i   x�3�4�0��֋�^�ra���.l���bӅ}� ��;.���id`d�k`�kh�`h`e B�Ɯ�\F�F�&Un�j �D� #C�F\1z\\\ �E>q      b   �   x�m�=�@���S�	���V�6�T^��Pc����H�(p�y7rL0�b23�{c�HpGb�C*�̑(�#c���Eጒz�޹{�l�)Q�����#u0��E�K䴖=�7�C=_��i~џ}Lܘp�WJOY��S3g��\a�����d�̖��Z��Y�֝xZ�7��w      c   y   x�]α�0���K�)YIk �'�P�@�H)4l7&|�ā��#Fk0����f�R�^Y������}����N2ztK�^WL�Oi��<����c�<~�Mai���p���.�[D�-      h   �   x�E�I�0E��)�gP�t�.��
	�-�@��B�W��NC�"���ge3���$�;Ԩ��C�7j2a�7/���X����ĭ����2p�6'��`��'�4r�/��C�©ǵ�����g^I��u��!r1Ֆ�4���� �5���"s��/Ć�Rp7����Ot���8����j>UJ}�J��      j   ]   x�m�1� g�
���v`�[:��O�� ��E,�bA�P�m��� ����ӼP��"a��AL���Α���-�ކK'�}�Y`�&v      i   q   x�-��	�0�s2��i���a��"x��RDgx��%����'���K0c����B�������a��0$X�C�ᗥ呒aK�p�����F��J,�N}�ܦ��Q�>      e   $   x�3�4�4500�2�4�44 ��9�9�b1z\\\ U��      g   �   x�u���0E��� U��aJB�S�� �%�iHY�{#~R�X�l}?����Cd?��Jvk����V��#d`��Y�1�Ӛ�m�}Y�2��f+h��'��[���N*R�z�O�WxK�L����&dl0E
8���$�.K)ǿ��1�OY�4      m   (   x�3�4�4202�50�54R04�2 !mcN�=... ka�      d      x������ � �      l      x�3�4�@.#N���4����� -ul      f   d   x�%��	�0C�{S�R�q���P
�"m]!��W�I /Io&k��)"���$D�UA'+f���*CP������ٿ��43�mi��^�B}     