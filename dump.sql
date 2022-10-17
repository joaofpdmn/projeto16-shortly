PGDMP     "                	    z            db9bu90pg88sgk     14.5 (Ubuntu 14.5-1.pgdg20.04+1)    14.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    2566914    db9bu90pg88sgk    DATABASE     e   CREATE DATABASE "db9bu90pg88sgk" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
     DROP DATABASE "db9bu90pg88sgk";
                toymrrobfozqbi    false            �           0    0    db9bu90pg88sgk    DATABASE PROPERTIES     V   ALTER DATABASE "db9bu90pg88sgk" SET "search_path" TO '$user', 'public', 'heroku_ext';
                     toymrrobfozqbi    false            �            1259    4881870    sessions    TABLE     �   CREATE TABLE "public"."sessions" (
    "userid" integer NOT NULL,
    "token" character varying(100) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT "now"() NOT NULL
);
     DROP TABLE "public"."sessions";
       public         heap    toymrrobfozqbi    false            �            1259    4897205    urls    TABLE     	  CREATE TABLE "public"."urls" (
    "id" integer NOT NULL,
    "url" "text" NOT NULL,
    "shorturl" "text" NOT NULL,
    "visitcount" integer DEFAULT 0 NOT NULL,
    "userid" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT "now"() NOT NULL
);
    DROP TABLE "public"."urls";
       public         heap    toymrrobfozqbi    false            �            1259    4897204    urls_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."urls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE "public"."urls_id_seq";
       public          toymrrobfozqbi    false    215            �           0    0    urls_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE "public"."urls_id_seq" OWNED BY "public"."urls"."id";
          public          toymrrobfozqbi    false    214            �            1259    4868946    users    TABLE     �   CREATE TABLE "public"."users" (
    "id" integer NOT NULL,
    "name" character varying(100) NOT NULL,
    "email" character varying(100) NOT NULL,
    "password" "text" NOT NULL,
    "createdAt" timestamp without time zone DEFAULT "now"() NOT NULL
);
    DROP TABLE "public"."users";
       public         heap    toymrrobfozqbi    false            �            1259    4868835    users_id_seq    SEQUENCE     �   CREATE SEQUENCE "public"."users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "public"."users_id_seq";
       public          toymrrobfozqbi    false            �            1259    4868945    users_id_seq1    SEQUENCE     �   CREATE SEQUENCE "public"."users_id_seq1"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE "public"."users_id_seq1";
       public          toymrrobfozqbi    false    212            �           0    0    users_id_seq1    SEQUENCE OWNED BY     H   ALTER SEQUENCE "public"."users_id_seq1" OWNED BY "public"."users"."id";
          public          toymrrobfozqbi    false    211            E           2604    4897208    urls id    DEFAULT     p   ALTER TABLE ONLY "public"."urls" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."urls_id_seq"'::"regclass");
 <   ALTER TABLE "public"."urls" ALTER COLUMN "id" DROP DEFAULT;
       public          toymrrobfozqbi    false    214    215    215            B           2604    4868949    users id    DEFAULT     s   ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq1"'::"regclass");
 =   ALTER TABLE "public"."users" ALTER COLUMN "id" DROP DEFAULT;
       public          toymrrobfozqbi    false    212    211    212            �          0    4881870    sessions 
   TABLE DATA           F   COPY "public"."sessions" ("userid", "token", "createdAt") FROM stdin;
    public          toymrrobfozqbi    false    213            �          0    4897205    urls 
   TABLE DATA           `   COPY "public"."urls" ("id", "url", "shorturl", "visitcount", "userid", "createdAt") FROM stdin;
    public          toymrrobfozqbi    false    215            �          0    4868946    users 
   TABLE DATA           S   COPY "public"."users" ("id", "name", "email", "password", "createdAt") FROM stdin;
    public          toymrrobfozqbi    false    212            �           0    0    urls_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"public"."urls_id_seq"', 13, true);
          public          toymrrobfozqbi    false    214            �           0    0    users_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"public"."users_id_seq"', 1, false);
          public          toymrrobfozqbi    false    210            �           0    0    users_id_seq1    SEQUENCE SET     ?   SELECT pg_catalog.setval('"public"."users_id_seq1"', 4, true);
          public          toymrrobfozqbi    false    211            M           2606    4897214    urls urls_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY "public"."urls"
    ADD CONSTRAINT "urls_pkey" PRIMARY KEY ("id");
 >   ALTER TABLE ONLY "public"."urls" DROP CONSTRAINT "urls_pkey";
       public            toymrrobfozqbi    false    215            I           2606    5029242    users users_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_email_key" UNIQUE ("email");
 E   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_email_key";
       public            toymrrobfozqbi    false    212            K           2606    4868954    users users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
 @   ALTER TABLE ONLY "public"."users" DROP CONSTRAINT "users_pkey";
       public            toymrrobfozqbi    false    212            �   w   x�]̹1�X��P�祣'K��	��p<���V�EL�/����+C�j�}c_]���۠ܣ�Y8斓��\֛B^����~�Cv>F9B�6�V�!y~��X�f�s��[��&$,      �   �   x����N�0��u�����k_O��"��
!!6����U�2==t	Bb���>�lj=�a�K�qx9L�ؗ�-{1ok^,���O�%��k�%e~Y�)��|�N�f��&ɍ�S����Bۮ�N7�Q�)%��@:�8����ǫ�w�|~�a(��FZb��:�{�u���1�@JXO �I�����s��/7e����GIJi�c"��uVJ�f�\���еf��}� t�2�����I0ƾ .���      �     x����N�@ �ϻO�k��-���&�(AJD�6^��ʲ�_��⋉x1=��M2��P[mAݗ�lkOFWʬL�
+��)�<!��W�h�a���4��1��,
I���'�u��Y~����ɢ� �:;Y��v���Q�1��s�Q�V��f�y���<�b�\n/��/x�̗�R�	4,.�|����G��`��v�k�Kr
�9ӅY���N�g�w�%@��	���1�띏�_ ��H)���#�7wHc�     