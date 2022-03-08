create table if not exists genre (
	ID serial primary key,
	title varchar(40) not null unique
);

create table if not exists singer (
	ID serial primary key,
	title varchar(40) not null
);

create table singers_in_genre (
	genre_id integer not null references genre(ID),
	singer_id integer not null references singer(ID),
	constraint pk primary key (genre_id, singer_id)
);

create table if not exists album (
	ID serial primary key,
	title varchar(40) not null,
	since integer not null
);

create table if not exists who_sing_in_albums (
	singer_id integer not null references singer(ID),
	album_id integer not null references album(ID),
	constraint p primary key (singer_id, album_id)
);

create table if not exists track (
	ID serial primary key,
	title text not null,
	duration numeric not null check(duration > 0),
	album_id integer not null references album(ID)
);

create table if not exists collection (
	ID serial primary key,
	title text not null,
	since integer not null
);

create table if not exists tracks_in_collection (
	collection_id integer not null references collection(ID),
	track_id integer not null references track(ID),
	constraint pr primary key (collection_id, track_id)
);