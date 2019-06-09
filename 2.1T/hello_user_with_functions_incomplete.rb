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
   puts 'What is your name?'
	name = gets.chomp
	puts 'Your name is ' + name + '!'
	puts 'What is your family name?'
	family_name = gets.chomp
	puts 'Your family name is: ' + family_name + '!'
	puts 'What year were you born?'
	year_born = gets.to_i
	age = Date.today.year - year_born
	puts 'So you are ' + age.to_s + ' years old'
	puts 'Enter your height in cms (i.e as a float): '
	height = gets.to_f
	height_inches = height * INCHES
	puts 'Your height in inches is: '
	puts height_inches

	boolean = read_boolean('Do you wish to continue?')

	if boolean == true
		puts 'Ok, let\'s continue.'
		main
	else boolean == false
		puts 'Ok, goodbye.'
	end
end

main
