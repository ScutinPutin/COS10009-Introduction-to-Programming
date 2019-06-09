require './input_functions'

def maintain_albums
  # change this to display a sub-menu
  # in the sub menu the user can select
  # whether they want to:
  # 1 Enter a new album
  # 2 Update an existing album
  # 3 Return to the main menu
  # Implement stubs like this one for options 1 and 2
  puts 'You selected Enter or Update New Album'
  read_string("Press enter to continue")
end


# complete the case statement below and
# add a stub like the one above for option 2
# of this main menu
def main
  finished = false
  begin
    puts 'Main Menu:'
    puts '1 To Enter or Update Album'
    puts '2 To Play existing Album'
    puts '3 Exit'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    case choice
    when 1
      maintain_albums
    else
      puts 'Please select again'
    end
  end until finished
end

main
