# helped by matt in places
require './input_functions'

# Task 6.2 T - use the code from 6.2 T to help with this

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
  # you will need to add tracks to the following and the initialize()
	attr_accessor :title, :artist, :genre, :tracks
	def initialize (title, artist, genre, tracks)
		@title = title
		@artist = artist
		@genre = genre
		@tracks = tracks
	end
end

class Track
	attr_accessor :name, :location
	def initialize (name, location)
		@name = name
		@location = location
	end
end

# Reads in and returns a single track from the given file

def read_track music_file
	name = music_file.gets()
	location = music_file.gets()
	track = Track.new(name, location)
	return track
end

# Returns an array of tracks read from the given file

def read_tracks music_file
	count = music_file.gets().to_i
	tracks = Array.new()
  track = File.open('album.txt')
  # Put a while loop here which increments an index to read the tracks
	i = 0
	while (i < count)
  	track = read_track(music_file)
		tracks << track
		i += 1
	end
	return tracks
end

# Takes an array of tracks and prints them to the terminal

def print_tracks tracks
	index = 0
	while index < tracks.length
		print_track tracks[index]
		index += 1
	end
end

# Reads in and returns a single album from the given file, with all its tracks

def read_album music_file
	artist = music_file.gets.chomp
	title = music_file.gets.chomp
	genre = music_file.gets.chomp.to_i

	album = Album.new(artist, title, genre, read_tracks(music_file))
end


# Takes a single album and prints it to the terminal along with all its tracks
def print_album album
	puts 'Title is ' + album.title.to_s
	puts 'Artist is ' + album.artist.to_s
	puts 'Genre is ' + $genre_names[album.genre]
	# print out the tracks
	print_tracks(album.tracks)
end

# Takes a single track and prints it to the terminal
def print_track track
  puts('Track title is: ' + track.title)
	puts('Track file location is: ' + track.file_location)
end


# search for track by name.
# Returns the index of the track or -1 if not found
# Put a while loop here that searches through the tracks
# Use the read_string() function from input_functions.
# NB: you might need to use .chomp to compare the strings correctly
# Put your code here.
def search_for_track_name(tracks, search_string)
puts ("Searching for track: " + search_string)
found_index = -1
i = 0
	while (i < tracks.length)
			# track = tracks[i]
			if (tracks[i].name.chomp == search_string.chomp)
				found_index = i
			end
			i += 1
		end
	found_index
end

# Reads in an Album from a file and then prints all the album
# to the terminal

def main
  music_file = File.new("album.txt", "r")
	album = read_album(music_file)
  music_file.close()

  search_string = read_string("Enter the track name you wish to find: ")
  index = search_for_track_name(album.tracks, search_string)
  if index > -1
    puts "Found " + album.tracks[index].name + " at " + index.to_s
  else
    puts "Entry not Found"
  end

end

main
