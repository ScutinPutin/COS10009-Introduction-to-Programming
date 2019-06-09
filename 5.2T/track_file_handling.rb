#helped by Ned in places.
# Look at Task 5.1 T Music Records for an example of how to create the following
class Track
  attr_accessor :track_title, :track_location
  def initialize(track_title, track_location)
    @track_title = track_title
    @track_location = track_location
  end
end
# Returns an array of tracks read from the given file
# Put a while loop here which increments an index to read the tracks
def read_tracks music_file
	count = music_file.gets().to_i
  tracks = Array.new
  track = File.open("input.txt")
  i = 0
  while (i < count)
    track = read_track(music_file)
    tracks << track
    i += 1
  end  
tracks
end
# reads in a single track from the given file.
# complete this function
# you need to create a Track here - see 5.1 T, Music Record for this too.
def read_track a_file
  track_title = a_file.gets()
  track_location = a_file.gets()
  track = Track.new(track_title, track_location)
 track
end
# Takes an array of tracks and prints them to the terminal
# Use a while loop with a control variable index
# to print each track. Use tracks.length to determine how
# many times to loop.
# Print each track use: tracks[index] to get each track record
def print_tracks tracks
  index = 0
  while index < tracks.length 
    print_track tracks[index]
    index += 1
  end
end
# Takes a single track and prints it to the terminal
def print_track track
  puts('Track title is: ' + track.track_title)
	puts('Track file location is: ' + track.track_location)
end
# Open the file and read in the tracks then print them
# if nil this test will be false
# open for reading
# Print all the tracks
def main
  a_file = File.new("input.txt", "r") 
  if a_file  
    tracks = read_tracks(a_file)
    a_file.close
  else
    puts "Unable to open file to read!"
  end
  print_tracks(tracks)
end

main
