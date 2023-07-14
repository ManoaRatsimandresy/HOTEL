DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;


CREATE TABLE role(
     id_role   SERIAL PRIMARY KEY,
     name VARCHAR(20)
);

CREATE TABLE public."user"(
	id                 SERIAL NOT NULL ,
	username           VARCHAR (255) NOT NULL ,
	password           VARCHAR (255) NOT NULL ,
	first_name         VARCHAR (128) NOT NULL ,
	last_name          VARCHAR (128) NOT NULL ,
	cin                VARCHAR (20) NOT NULL ,
	society_name       VARCHAR (128) NOT NULL ,
	number             VARCHAR (20) NOT NULL ,
	email              VARCHAR (50) NOT NULL ,
	secondary_number   VARCHAR (20) NOT NULL ,
	gender             CHAR (1)  NOT NULL ,
	birthdate          DATE  NOT NULL  ,
	CONSTRAINT user_PK PRIMARY KEY (id),
	id_role INT REFERENCES role(id_role)
) WITHOUT OIDS;

CREATE TABLE public.payment_method(
	id     SERIAL NOT NULL ,
	name   VARCHAR (20) NOT NULL  ,
	CONSTRAINT payment_method_PK PRIMARY KEY (id)
) WITHOUT OIDS;

CREATE TABLE city(
     id_city        SERIAL PRIMARY KEY,
     name      VARCHAR(255)
);

CREATE TABLE public.hotel(
	id          SERIAL NOT NULL ,
	name        VARCHAR (255) NOT NULL ,
	address     VARCHAR (2000)  NOT NULL ,
	is_active   BOOL  NOT NULL  ,
	CONSTRAINT hotel_PK PRIMARY KEY (id),
	id_city INT REFERENCES city(id_city)
) WITHOUT OIDS;

CREATE TABLE public.room_type(
	id           SERIAL NOT NULL ,
	name         VARCHAR (255) NOT NULL ,
	base_price   NUMERIC (20,2)  NOT NULL  ,
	CONSTRAINT room_type_PK PRIMARY KEY (id)
) WITHOUT OIDS;

CREATE TABLE public.room(
	id             SERIAL NOT NULL ,
	id_hotel       INT  NOT NULL ,
	id_room_type   INT  NOT NULL  ,
	CONSTRAINT room_PK PRIMARY KEY (id),
	CONSTRAINT room_hotel_FK FOREIGN KEY (id_hotel) REFERENCES public.hotel(id),
	CONSTRAINT room_room_type_FK FOREIGN KEY (id_room_type) REFERENCES public.room_type(id)
) WITHOUT OIDS;

CREATE TABLE public.room_reservation(
	id                     SERIAL NOT NULL ,
	start_date             DATE  NOT NULL ,
	end_date               DATE  NOT NULL ,
	special_requests       VARCHAR (2000)  NOT NULL ,
	is_paid                BOOL  NOT NULL ,
	is_canceled            BOOL  NOT NULL ,
	penalty_rate           FLOAT  NOT NULL ,
	id_user                INT  NOT NULL ,
	id_user_take_booking   INT  NOT NULL ,
	id_payment_method      INT  NOT NULL ,
	id_room                INT  NOT NULL  ,
	CONSTRAINT room_reservation_PK PRIMARY KEY (id),
	CONSTRAINT room_reservation_user_FK FOREIGN KEY (id_user) REFERENCES public."user"(id),
	CONSTRAINT room_reservation_user_take_booking_FK FOREIGN KEY (id_user_take_booking) REFERENCES public."user"(id),
	CONSTRAINT room_reservation_payment_method_FK FOREIGN KEY (id_payment_method) REFERENCES public.payment_method(id),
	CONSTRAINT room_reservation_room_FK FOREIGN KEY (id_room) REFERENCES public.room(id)
) WITHOUT OIDS;

CREATE TABLE public.discount(
	id           SERIAL NOT NULL ,
	name         VARCHAR (255) NOT NULL ,
	rate         FLOAT  NOT NULL ,
	start_time   TIMESTAMP  NOT NULL ,
	end_time     TIMESTAMP  NOT NULL  ,
	CONSTRAINT discount_PK PRIMARY KEY (id)
) WITHOUT OIDS;

CREATE TABLE public.conference_room(
	id               SERIAL NOT NULL ,
	capacity         INT  NOT NULL ,
	price_per_hour   NUMERIC (20,2)  NOT NULL ,
	id_hotel         INT  NOT NULL  ,
	CONSTRAINT conference_room_PK PRIMARY KEY (id),
	CONSTRAINT conference_room_hotel_FK FOREIGN KEY (id_hotel) REFERENCES public.hotel(id)
) WITHOUT OIDS;

CREATE TABLE public.conference_room_reservation(
	id                                SERIAL NOT NULL ,
	date                              DATE  NOT NULL ,
	start_time                        TIMESTAMP  NOT NULL ,
	end_time                          TIMESTAMP  NOT NULL ,
	special_requests                  VARCHAR (2000)  NOT NULL ,
	is_paid                           BOOL  NOT NULL ,
	is_canceled                       BOOL  NOT NULL ,
	penalty_rate                      FLOAT  NOT NULL ,
	id_conference_room                INT  NOT NULL ,
	id_user                           INT  NOT NULL ,
	id_user_take_booking_conference   INT  NOT NULL ,
	id_payment_method                 INT  NOT NULL  ,
	CONSTRAINT conference_room_reservation_PK PRIMARY KEY (id),
	CONSTRAINT conference_room_reservation_conference_room_FK FOREIGN KEY (id_conference_room) REFERENCES public.conference_room(id),
	CONSTRAINT conference_room_reservation_user_FK FOREIGN KEY (id_user) REFERENCES public."user"(id),
	CONSTRAINT conference_room_reservation_user_take_booking_conference_FK FOREIGN KEY (id_user_take_booking_conference) REFERENCES public."user"(id),
	CONSTRAINT conference_room_reservation_payment_method_FK FOREIGN KEY (id_payment_method) REFERENCES public.payment_method(id)
) WITHOUT OIDS;



CREATE TABLE rating(
     id_rating SERIAL PRIMARY KEY,
     rate int,
     comment text,
     user_id INT REFERENCES public."user"(id),
     room_type_id INT REFERENCES public.room_type(id)
);

CREATE TABLE have_reduced_price(
     id_have_reduced_price SERIAL PRIMARY KEY,
     room_type_id INT REFERENCES public.room_type(id),
     discount_id INT REFERENCES public.discount(id)
);

CREATE TABLE have_reduced_price_conference_room(
     id_have_reduced_price_conference_room SERIAL PRIMARY KEY,
     discount_id INT REFERENCES public.discount(id),
     conference_room_id INT REFERENCES public.conference_room(id)
);

CREATE TABLE room_option(
     id_room_option SERIAL PRIMARY KEY,
     name VARCHAR(255) NOT NULL,
     description TEXT,
     price NUMERIC
);

CREATE TABLE have_room_options(
     room_id INT REFERENCES public.room(id),
     option_id INT REFERENCES room_option(id_room_option),
     PRIMARY KEY (room_id, option_id)
);
