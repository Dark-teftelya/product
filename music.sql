PGDMP  0    4                {            Music    16.0    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16533    Music    DATABASE     �   CREATE DATABASE "Music" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Music";
                postgres    false                        2615    16565    music_shema    SCHEMA        CREATE SCHEMA music_shema;
    DROP SCHEMA music_shema;
                postgres    false            �            1259    16580    artists    TABLE     �   CREATE TABLE music_shema.artists (
    artist_id bigint NOT NULL,
    artist_name text NOT NULL,
    genre text,
    country text
);
     DROP TABLE music_shema.artists;
       music_shema         heap    postgres    false    6            �            1259    16573    songs    TABLE     �   CREATE TABLE music_shema.songs (
    song_id bigint NOT NULL,
    song_name text NOT NULL,
    lenght bigint,
    artist_id bigint NOT NULL
);
    DROP TABLE music_shema.songs;
       music_shema         heap    postgres    false    6            �            1259    16566    users    TABLE     �   CREATE TABLE music_shema.users (
    user_id bigint NOT NULL,
    username text NOT NULL,
    email text,
    password bigint,
    song_id bigint NOT NULL
);
    DROP TABLE music_shema.users;
       music_shema         heap    postgres    false    6            �          0    16580    artists 
   TABLE DATA           N   COPY music_shema.artists (artist_id, artist_name, genre, country) FROM stdin;
    music_shema          postgres    false    218          �          0    16573    songs 
   TABLE DATA           K   COPY music_shema.songs (song_id, song_name, lenght, artist_id) FROM stdin;
    music_shema          postgres    false    217   -       �          0    16566    users 
   TABLE DATA           Q   COPY music_shema.users (user_id, username, email, password, song_id) FROM stdin;
    music_shema          postgres    false    216   J       '           2606    16586    artists artists_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY music_shema.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);
 C   ALTER TABLE ONLY music_shema.artists DROP CONSTRAINT artists_pkey;
       music_shema            postgres    false    218            %           2606    16579    songs songs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY music_shema.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);
 ?   ALTER TABLE ONLY music_shema.songs DROP CONSTRAINT songs_pkey;
       music_shema            postgres    false    217            #           2606    16572    users users_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY music_shema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 ?   ALTER TABLE ONLY music_shema.users DROP CONSTRAINT users_pkey;
       music_shema            postgres    false    216            )           2606    16587    songs artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY music_shema.songs
    ADD CONSTRAINT artist_id_fkey FOREIGN KEY (artist_id) REFERENCES music_shema.artists(artist_id) ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY music_shema.songs DROP CONSTRAINT artist_id_fkey;
       music_shema          postgres    false    218    217    4647            (           2606    16592    users song_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY music_shema.users
    ADD CONSTRAINT song_id_fkey FOREIGN KEY (song_id) REFERENCES music_shema.songs(song_id) ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY music_shema.users DROP CONSTRAINT song_id_fkey;
       music_shema          postgres    false    217    216    4645            �      x������ � �      �      x������ � �      �      x������ � �     