require './input_functions'
require 'gosu'

module Genre
    POP, CLASSIC, JAZZ, ROCK = *0..3
end

$genre_names = ['Pop', 'Classic', 'Jazz', 'Rock']

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

# class Albums
#     attr_accessor :albums
#     def initialize (albums)
#         @albums = albums
#     end
# end

def main_menu()
    finshed = false
    begin
        puts "Main Menu: "
        puts "1. Read in Album"
        puts "2. Display Album Infomation"
        puts "3. Play Album"
        puts "4. Update Album"
        puts "5. Exit"
        choice = read_integer_in_range("Please enter your choice: ", 1, 5)
        case choice
        when 1
            file_name = read_string("Please enter the filename of the album: ")
            music_file = File.new(file_name, "r")
            album = read_in_album(music_file)
            read_in_albums(music_file)
            puts('Now reading in album... ')
        when 2
            count = albums.length
            index = 0
            while (index < count)
            puts albums[index]
                index += 1
             end

           album_choice = read_string("Please enter the number of your album:")
            display_album_information(album_choice)
            read_string("Press Enter to Continue: ")
        when 3
            play_album(album)
        when 4
            update_album(album)
        when 5
            puts "Now exiting album... "
            finshed = true
        end
    end until finshed
end

def read_in_albums(music_file)
    count = albums.length
    index = 0

    while (index < count)
        album = read_in_album(music_file)
        albums << album
        index += 1
    end
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

def display_album_information(album)
    puts 'Title is ' + album.title.to_s
    puts 'Artist is ' + album.artist.to_s
    puts 'Genre is ' + $genre_names[album.genre]

    # Print all tracks
    print_tracks(album.tracks)
end

def print_tracks(tracks)
    index = 0
    while (index < tracks.length)
        puts "Track Number: " + index.to_s 
        print_track(tracks[index]).to_s
        index += 1
    end
end

def print_track(track)
    puts('Track title is: ' + track.name)
    puts('Track file location is: ' + track.location)
end

def play_album(album)
    print_tracks(album.tracks)
    track = read_integer_in_range("Please select a track to play: ", 0, album.tracks.length)
    puts "Now playing " + album.tracks[track].location
    sleep(3)
end

def update_album(album)
    puts 'You have selected ' + album.title + 'by ' + album.artist

    changed_title = read_string("Update Album > New title [Press Enter to Skip]: ")

    puts "Genres"
    for i in 0...$genre_names.length
        puts (i+1).to_s + ". " + $genre_names[i]
    end
    changed_genre = read_integer_in_range("Pick a genre", 1, $genre_names.length)
    puts $genre_names[changed_genre - 1]

    if !changed_title.empty?
    album.title = changed_title
    end
    album.genre = changed_genre
    return album
end

def main()
    main_menu()
end

main()