# Helped by Nicholas Williams in places


require './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *0..3
end

# Maybe the following needs to be changed? How?
$genre_names = ['Pop', 'Classic', 'Jazz', 'Rock']

class Album
    attr_accessor :album_title, :album_artist, :album_genre
    
    def initialize(album_title, album_artist, album_genre)
        @album_title = album_title
        @album_artist = album_artist
        @album_genre = album_genre
    end
end

# Reads in and returns a single album from the given file, with all its tracks
# complete the missing lines


def read_album()
  # You could use get_integer_range below to get a genre.
  # You only the need validation if reading from the terminal
  # (i.e when using a file later, you can assume the data in
  # the file is correct)
  i = 0
  while (i < $genre_names.length)
    puts i.to_s + ":  " + $genre_names[i]
    i += 1
  end
  # insert lines here - use read_integer_in_range to get a genre
  menu_choice = read_integer_in_range("Please select a genre:", 0, 3)
  # puts "You chose: " + $genre_names[menu_choice]
  
  album_title = "Title_Placeholder"
  album_artist = "Artist_Placeholder"
  album_genre = $genre_names[menu_choice]

  # @album = [album_title, album_artist, album_genre]
  Album.new(album_title, album_artist, album_genre)
end

# Takes a single album and prints it to the terminal
# complete the missing lines:

def print_album album
  puts('Album information is: ')
  puts 'Album: ' + album.album_title
  puts 'Artist: ' + album.album_artist
  puts 'Genre: ' + album.album_genre
end

# Reads in an Album then prints it to the terminal

def main
	album = read_album()
	print_album(album)
end

main
