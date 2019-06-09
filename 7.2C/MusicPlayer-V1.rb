require 'rubygems'
require 'gosu'
require 'tk'

TOP_COLOR = Gosu::Color.new(0xFF1EB1FA)
BOTTOM_COLOR = Gosu::Color.new(0xFF1D4DB5)

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
			@album_choice = "album1.txt"
	end

	def read_in_album(music_file)
		artist = music_file.gets.chomp
		title = music_file.gets.chomp
		genre = music_file.gets.chomp.to_i
		Album.new(artist, title, genre, read_tracks(music_file))
	end

	def read_tracks(music_file)
		count = music_file.gets().to_i
		tracks = Array.new()

		index = 0
		while (index < count)
			track = read_track(music_file)
			tracks << track
			index += 1
		end
		return tracks
	end

	def read_track(music_file)
		name = music_file.gets()
		location = music_file.gets()
		track = Track.new(name, location)
		return track
	end
	
	def area_clicked(leftX, topY, rightX, bottomY)
		if ((mouse_x > 50 and mouse_x < 150) and (mouse_y > 20 and mouse_y < 120))
			true
		end
		if ((mouse_x > 200 and mouse_x < 350) and (mouse_y > 20 and mouse_y < 120))
			true
		end
		if ((mouse_x > 350 and mouse_x < 450) and (mouse_y > 20 and mouse_y < 120))
			true
		end
	end
	
	def button_down(id)
		case id
		when Gosu::MsLeft
			if area_clicked(leftX, topY, rightX, bottomY)
				@album_choice = "album1.txt"
			end
		end
	end

	def display_album_information(album)
		@song_font.draw("Album:  #{album.artist.to_s}", 20, 160, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
		@song_font.draw("Artist:  #{album.title.to_s}", 20, 180, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
		@song_font.draw("Genre:  #{$genre_names[album.genre]}", 20, 200, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
		@song_font.draw("Track List: ", 20, 220, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
		@song_font.draw("Track Location List: ", 330, 220, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)

		print_tracks(album.tracks)
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
		
		@album1.draw(50, 50, ZOrder::TOP, scale_x = 1, scale_y = 1)
		@album2.draw(200, 50, ZOrder::TOP, scale_x = 1, scale_y = 1)
		@album3.draw(350, 50, ZOrder::TOP, scale_x = 1, scale_y = 1)

		if ((mouse_x > 50 and mouse_x < 150) and (mouse_y > 20 and mouse_y < 120))
			Gosu.draw_rect(49, 49, 102, 102, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
			@album_choice = "album1.txt"
		end

		if ((mouse_x > 200 and mouse_x < 350) and (mouse_y > 20 and mouse_y < 120))
			Gosu.draw_rect(199, 49, 102, 102, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
			@album_choice = "album2.txt"
		end

		if ((mouse_x > 350 and mouse_x < 450) and (mouse_y > 20 and mouse_y < 120))
			Gosu.draw_rect(349, 49, 102, 102, Gosu::Color::RED, ZOrder::MIDDLE, mode=:default)
			@album_choice = "album3.txt"
		end
		# @album_choice = "album1.txt"
		music_file = File.new(@album_choice, "r")
		album = read_in_album(music_file)
		draw_album_info(album)
	end

	def draw_album_info(album)
		display_album_information(album)
		@play.draw(200, 600, ZOrder::TOP, scale_x = 0.20, scale_y = 0.20)
		@pause.draw(240, 600, ZOrder::TOP, scale_x = 0.20, scale_y = 0.20)
		@next.draw(280, 600, ZOrder::TOP, scale_x = 0.20, scale_y = 0.20)
		@stop.draw(320, 600, ZOrder::TOP, scale_x = 0.20, scale_y = 0.20)
		# @song_font.draw("Now playing: ", 380, 680, ZOrder::TOP, 1.0, 1.0, Gosu::Color::BLACK)
	end

 	def needs_cursor?; true; end
	
	# def mouse_over_button(mouse_x, mouse_y)
	# 	if ((mouse_x > 50 and mouse_x < 150) and (mouse_y > 200 and mouse_y <300))
	# 		true
	# 	else
	# 		false
	# 	end
	# 	# if ((mouse_x > 200 and mouse_x <350) and (mouse_y > 200 and mouse_y <300))
	# 	# 	true
	# 	# 	album_selection = "album2"
	# 	# else
	# 	# 	false
	# end

	def album_Onlick ()

	end

end



# Show is a method that loops through update and draw
MusicPlayerMain.new.show if __FILE__ == $0
