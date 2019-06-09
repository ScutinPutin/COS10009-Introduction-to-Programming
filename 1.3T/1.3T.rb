require 'date'

INCHES = 0.393701  # This is a global constant

def main
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
	puts 'Finished'
end

main  # call the main procedure
