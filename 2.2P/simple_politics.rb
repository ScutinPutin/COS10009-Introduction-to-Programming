require './input_functions'

YEAR_TRUMP_ELECTED = 2016

# Create a function here to calculate the user's
# age when Trump elected

def main
  name = get_string('Please enter your name: ')
  year_born = get_integer('What year were you born? ')
# Replace the line below with a call to your function above:
  age_when_trump_elected = YEAR_TRUMP_ELECTED - year_born
  puts name + ' you were ' + age_when_trump_elected.to_s + ' years old when Trump was elected'
# Change the following line to call get_boolean
# prompting the user: 'Are you a Brexit supporter? '
  if true
    puts 'You are a Brexit supporter'
  else
    puts 'You are NOT a Brexit supporter'
  end
end

main
