require 'rubygems'
require 'gosu'
require 'tk'

TOP_COLOR = Gosu::Color.new(0xFF1EB1FA)
BOTTOM_COLOR = Gosu::Color.new(0xFF1D4D85)

module ZOrder
		BACKGROUND, MIDDLE, TOP = *0..2
end

module Genre
	POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class ArtWork
	attr_accessor :bmp

	def initialize (file)
		@bmp = Gosu::Image.new(file)
	end
end

class Track
	attr_accessor :name, :location
	def initialize (name, location)
		@name = name
		@location = location
	end
end

class Album
	attr_accessor :title, :artist, :genre, :tracks
	def initialize (title, artist, genre, tracks)
		@title = title
		@artist = artist
		@genre = genre
		@tracks = tracks
	end
end

class MusicPlayerMain < Gosu::Window
	
	def initialize
		super(600, 800)
		self.caption = "Music Player"
		@info_font = Gosu::Font.new(10)
		@title_font = Gosu::Font.new(20)
		@song_font = Gosu::Font.new(15)

		@play = Gosu::Image.new("images/play.png")
		@pause = Gosu::Image.new("images/pause.png")
		@next = Gosu::Image.new("images/next.png")
		@stop = Gosu::Image.new("images/stop.png")

		
		@album1 = Gosu::Image.new("album1/album1.jpg")
		@album2 = Gosu::Image.new("album2/album2.jpg")
		@album3 = Gosu::Image.new("album3/album3.jpg")
		@album4 = Gosu::Image.new("album4/album4.jpg")
		@file_name = "albums.txt"
		@selection = 1
	end

def read_albums(music_file, albums)
	albums = Array.new()
	count = music_file.gets.to_i
	index = 0

	while (index < count)
		albums.push(read_album(music_file))
		index +=1
	end
	music_file.close()
	return albums
end


def read_album(music_file)
	album_title = music_file.gets()
	album_artist = music_file.gets()
	album_genre = music_file.gets()
	album_tracks = read_all_tracks(music_file)
	album = Album.new(album_title, album_artist, album_genre, album_tracks)
end

def read_all_tracks(music_file)
	tracks = Array.new()
	count = music_file.gets().to_i
	index = 0

	while (index < count)
		tracks.push(read_track(music_file))
		index += 1
	end
	tracks
end

def read_track(music_file)
	song_title = music_file.gets()
	file_location = music_file.gets()
	track = Track.new(song_title, file_location)
	track
end

def print_album(albums, selection)
	index = 0
	selection = @selection
	tracks = albums.tracks
	count = albums[selection - 1].tracks.length

	while (index < count)
		albums[selection - 1].print_tracks(albums.tracks)
	end
end

def print_tracks(tracks)
	index = 0
	xpos = 20
	xpos2 = 330
	ypos = 220
	while (index < tracks.length)
		ypos += 20
		print_track(tracks[index], xpos2, xpos, ypos, index).to_s
		index += 1
	end
end

def print_track(track, xpos2, xpos, ypos, index)
	@song_font.draw("#{index}: #{track.name}", xpos, ypos, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	@song_font.draw("#{index}: #{track.location}", xpos2, ypos, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
end

def display_album_information(album)
	@song_font.draw("Album:  #{album.artist.to_s}", 20, 160, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	@song_font.draw("Artist:  #{album.title.to_s}", 20, 180, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	@song_font.draw("Genre:  #{$genre_names[album.genre]}", 20, 200, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	@song_font.draw("Track List: ", 20, 220, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	@song_font.draw("Track Location List: ", 330, 220, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)

	print_tracks(album.tracks)
end

def playTrack(track, album)
	@song = Gosu::Song.new(album.tracks[track].location)
	@song.play(false)
end

def draw()
	Gosu.draw_rect(0, 0, 600, 800, Gosu::Color::WHITE, ZOrder::BACKGROUND, mode=:default)
	@title_font.draw("Welcome to my Music Player!", 200, 10, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)

		draw_album()


end

def draw_album()
	@info_font.draw("mouse_x: #{mouse_x}", 0, 780, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	@info_font.draw("mouse_y: #{mouse_y}", 0, 790, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	
	@album1.draw(25, 50, ZOrder::TOP, scale_x = 1, scale_y = 1)
	@album2.draw(175, 50, ZOrder::TOP, scale_x = 1, scale_y = 1)
	@album3.draw(325, 50, ZOrder::TOP, scale_x = 1, scale_y = 1)
	@album4.draw(475, 50, ZOrder::TOP, scale_x = 1, scale_y = 1)

	if ((mouse_x > 25 and mouse_x < 125) and (mouse_y > 20 and mouse_y < 120))
		Gosu.draw_rect(24, 49, 102, 102, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
		@selection = 1
	end

	if ((mouse_x > 175 and mouse_x < 275) and (mouse_y > 20 and mouse_y < 120))
		Gosu.draw_rect(174, 49, 102, 102, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
		@selection = 2
	end

	if ((mouse_x > 325 and mouse_x < 425) and (mouse_y > 20 and mouse_y < 120))
		Gosu.draw_rect(324, 49, 102, 102, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
		@selection = 3
	end

	if ((mouse_x > 475 and mouse_x < 575) and (mouse_y > 20 and mouse_y < 120))
		Gosu.draw_rect(474, 49, 102, 102, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
		@selection = 4
	end

	albums = nil
	music_file = File.new(@file_name, "r")
	albums = read_albums(music_file, albums)
	selection = @selection
	print_album(selection, albums)
end
def needs_cursor?; true; end
end




MusicPlayerMain.new.show if __FILE__ == $0

