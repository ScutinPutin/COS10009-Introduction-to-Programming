require './input_functions'

ASK_YOUR_TUTOR_FOR_THIS = 2

class Dog
    attr_accessor :id, :breed, :year_born, :name
    def initialize (id, breed, year_born, name)
        @id = id
        @breed = breed
        @year_born = year_born
        @name = name
    end
end

def read_dog()
    id = read_integer('Enter dogs ID: ')
    breed = read_string('Enter the dogs breed: ')
    year_born = read_integer('Enter the year the dog was born: ')
    name = read_string('Enter the dogs name: ')
    dog = Dog.new(id, breed, year_born, name)
    return dog
end

def display_dog(dog)
    puts('The dogs ID is: ' + dog.id.to_s)
    puts('The dogs breed is: ' + dog.breed)
    puts('The year the dog was born is: ' + dog.year_born.to_s)
    puts('The name of the dog is: ' + dog.name)
end

def read_dogs()
    dogs = Array.new()
    count = read_integer_in_range('How many dogs would you like to enter? ', 1, 3)
    i = 0
    while (i < count)
        dog = read_dog()
        dogs << dog
        i += 1
    end
    return dogs
end 

def display_dogs(dogs)
index = 0
    while (index < dogs.length)
        display_dog(dogs[index])
        index += 1
    end
end

def index_of_dog_with_id(dogs, search_id)
    # puts ("Searching for dog: " + search_id.to_s)
    search_id = ASK_YOUR_TUTOR_FOR_THIS
    found_index = -1
    i = 0
    while (i < dogs.length)
        if (dogs[i].id == search_id)
            found_index = i
        end
        i += 1
    end
    return found_index
end

def main
    dogs = read_dogs
    display_dogs(dogs)
    index = index_of_dog_with_id(dogs, ASK_YOUR_TUTOR_FOR_THIS)
    puts "Index is #{index}"
    if (index > -1)
        display_dog(dogs[index])
    end
end

main
