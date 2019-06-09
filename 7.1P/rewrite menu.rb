def update_album(albums)
    if (!albums)
        puts "No album has been selected."
    else
    album_menu = true
    while (album_menu  == true) 
        index = 0
        count = albums.length
        modify_menu = true
        album_selction = modify_menu(albums)

        while (index < count && modify_menu == true)
            if (album_selction == (index + 1))
                puts ""
                puts ("Current Title: " + albums[index].title)
                puts ("Current Genre: " + albums[index].genre)

                puts "1: Update Title"
                puts "2: Update Genre"
                puts "3: Return"
            menu_choice = read_integer_in_range("Please select an option", 1, 3)

            case menu_choice
            when 1
                albums[album_selction - 1].title = read_string("Enter updated title: ")
                puts ("Updated Title is: " + albums[album_selection - 1].title)
                modify_menu = false
            when 2
                albums[album_selection - 1].genre = read_string("Enter updated genre: ")
                puts ("Updated Genre is:" + albums[album_selction - 1].genre)
                modify_menu = false
            when 3
                modify_menu = false
            end
        end
    end
    end
    end
    return albums
end

def modify_menu(albums)
    puts "Change title or genre of album"
    index = 0
    count = albums.length
    while (index < count) 
        puts "Albums #{index +1} Details: "
        puts ("Title: " + albums[index].title)
        puts ("Genre: " + albums[index].genre)
        index += 1
    end

    index = 0
    while (index < count)
        puts "#{index + 1}: " + albums[index].title.chomp
        index += 1
    end
    puts("#{index + 1}: Exit Sub-Menu")
    album_selction = read_integer_in_range("Menu Choice: ", 1, (index + 1))
    return album_selection
end


def print_single_album(albums)
    if (!albums)
        puts "No albums have been read"
    else
        puts "Read Albums"
        index = 0
        count = albums.length
        while (index < count)
            puts ("Album #{index + 1}:" + albums[index].title)
            index += 1
        end

        album_selection = read_integer_in_range("Select an album to play", 1, count)

        if (!albums[album_selction - 1])
            puts ("Tracks in album " + album_selection)
            index = 0
            count = albums[album_selection - 1].tracks.length
            while (index < count)
                puts ("Track " + index + albums[album_selection - 1].tracks[index].name)
                index += 1
            end
            
            puts count

        track_selection = read_integer_in_range("Select a track to play", 1, albums[album_selection].tracks[track_selection - 1].name)
        puts ("Playing Track " + track_selection + ":" + albums[album_selction - 1].tracks[track_selection - 1].name)
        sleep(3.0)
        read_string("Press enter to continue...")
        end
    end
end

