require './input_functions'

YEAR_TRUMP_ELECTED = 2016

# Create a function here to calculate the user's
# age when Trump elected
def calculate_age_when_trump_elected(year_born)
  age_when_trump_elected = YEAR_TRUMP_ELECTED - year_born
end

def main
  name = read_string('Please enter your name: ')
  year_born = read_integer('What year were you born? ')
# Replace the line below with a call to your function above:
  calculate_age_when_trump_elected(year_born)
  puts name + ' you were ' + calculate_age_when_trump_elected(year_born).to_s + ' years old when Trump was elected'
# Change the following line to call get_boolean
    brexit = read_boolean('Are you a Brexit supporter?') 
# prompting the user: 'Are you a Brexit supporter? '
  if brexit
    puts 'You are a Brexit supporter'
  else
    puts 'You are NOT a Brexit supporter'
  end
end

main
