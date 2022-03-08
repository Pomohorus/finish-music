select title, count(singer_id) from genre
join singers_in_genre on genre.id = singers_in_genre.genre_id
	group by title;
	
select album.since, count(track.id) from album
	join track on album.id = track.album_id
	where since between 2019 and 2020
	group by since;
	
select album.title, avg(track.duration) from album
	join track on album.id = track.album_id
	group by album.title;
	
select singer.title from singer
	join who_sing_in_albums on singer.id = who_sing_in_albums.singer_id
	join album on who_sing_in_albums.album_id = album.id
	where album.id = (
		select album.id from singer
			where album.since != 2020
			group by album.id)
	group by singer.title;
	
select collection.title from collection
	join tracks_in_collection on collection.id = tracks_in_collection.collection_id
	join track on tracks_in_collection.track_id = track.id
	join album on track.album_id = album.id 
	join who_sing_in_albums on album.id = who_sing_in_albums.album_id
	join singer on who_sing_in_albums.singer_id = singer.id
	where singer.id = 1
	group by collection.title;
	
select album.id, album.title, count(genre_id) from album
	join who_sing_in_albums on album.id = who_sing_in_albums.album_id
	join singer on who_sing_in_albums.singer_id = singer.id
	join singers_in_genre on singer.id = singers_in_genre.singer_id
	join genre on singers_in_genre.genre_id = genre.id
	group by album.id
	having count(genre_id) > 1;
	
select track.id, track.title from track
	left join tracks_in_collection on track.id = tracks_in_collection.track_id
	where tracks_in_collection.track_id is null
	group by track.id;
	
select singer.id, singer.title from singer
	join who_sing_in_albums on singer.id = who_sing_in_albums.singer_id
	join album on who_sing_in_albums.album_id = album.id
	join track on album.id = track.album_id
	where duration =  (
		select duration from track
		order by duration
		limit 1)
	group by singer.id;
	
select album.id, album.title, count(track.id) from album
	join track on album.id = track.album_id
	group by album.id
	order by count(track.id)