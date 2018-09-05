require_relative '../classes/episode-class'
require_relative '../classes/season-class'
require_relative '../classes/show-class'

class User
    attr_accessor :shows, :name

    def initialize(name, shows = [])
        @name = name
        @shows = shows
    end

    def list_shows
        puts
        @shows.count.times do |count|
            puts "#{count + 1}. #{@shows[count].show_name} - #{@shows[count].genre}"
        end
        puts
    end

    def add_show
        print "Please enter the name of the show you want to add: "
        show_name = gets.chomp
        print "Please enter the genre of the show you want to add: "
        genre = gets.chomp
        @shows.push(Show.new(show_name, genre))
    end
end