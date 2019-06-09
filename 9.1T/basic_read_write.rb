
# writes the number of lines then each line as a string.

def write_data_to_file(aFile)
   aFile.puts('5')
   aFile.puts('Fred')
   aFile.puts('Sam')
   aFile.puts('Jill')
   aFile.puts('Jenny')
   aFile.puts('Zorro')
end

# reads in each line.
# you need to change the following code
# so that it uses a loop which repeats
# acccording to the number of lines in the File
# which is given in the first line of the File
def read_data_from_file(aFile)
  count = aFile.gets.to_i
  puts count.to_s
  puts aFile.gets
  puts aFile.gets
  puts aFile.gets
  puts aFile.gets
  puts aFile.gets
end

# writes data to a file then reads it in and prints
# each line as it reads.
# you should improve the modular decomposition of the
# following by moving as many lines of code
# out of main as possible.
def main
  aFile = File.new("mydata.txt", "w") # open for writing
  if aFile  # if nil this test will be false
    write_data_to_file(aFile)
    aFile.close
  else
    puts "Unable to open file to write!"
  end

  aFile = File.new("mydata.txt", "r") # open for reading
  if aFile  # if nil this test will be false
    read_data_from_file(aFile)
    aFile.close
  else
    puts "Unable to open file to read!"
  end
end

main
