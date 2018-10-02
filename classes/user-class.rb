require_relative '../classes/episode-class'
require_relative '../classes/season-class'
require_relative '../classes/show-class'

class User
    attr_accessor :shows, :name #both name and shows attr accessors required for setting and getting data.

    def initialize(name, shows = []) 
        @name = name #name will be used for future feature, multiple users
        @shows = shows #shows are kept in an array, which is pointed to from the menu class
    end

    def list_shows
        puts
        @shows.count.times do |count| #.times do iterator used in order to add incrementing show number next to show name
            puts "#{count + 1}. #{@shows[count].show_name} - #{@shows[count].genre}"
        end
        puts
    end

    def add_show(show_name, genre) #pushes a new show object to the end of the shows array
        @shows.push(Show.new(show_name, genre))
    end

    def remove_show(index) #deletes a show at specified index
        @shows.delete_at(index)
    end
end