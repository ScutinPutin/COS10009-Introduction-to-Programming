require 'date'
require './input_functions'

# Do you need something here?
INCHES = 0.393701 

# Insert into the following your hello_user code
# from task 1.3P and modify it to use the functions
# in my_functions
   
def main
	 # Copy in your code from your completed
	 # hello_user Task 1.3 P. Then modify it to
	 # use the code in my_functions.
   # use read_string for all strings (this will
   # remove all whitespace)
   name = read_string('What is your name?')
   puts 'Your name is ' + name + '!'
   family_name = read_string('What is your family name?')
   puts 'Your family name is: ' + family_name + '!'
   year_born = read_string('What year were you born?')
   age = Date.today.year - year_born.to_i
   puts 'So you are ' + age.to_s + ' years old'
   height = read_float('Enter your height in cms (i.e as a float): ')
   height_inches = height * INCHES
   puts ('Your height in inches is: ' + height_inches.to_s)
   puts 'Finished'
   continue = read_boolean("Do you want to continue?") 
   if continue == true 
      puts 'Okay let\'s continue'
      main
    else
      puts 'Ok goodbye'
    end
end
main