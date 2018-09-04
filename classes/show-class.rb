require_relative '../classes/episode-class'
require_relative '../classes/season-class'

class Show
    attr_accessor :show, :genre, :season_number, :number_of_seasons, :seasons

    def initialize(show, genre, seasons = [])
        @show = show #The name of the show the episode belongs to
        @genre = genre #The genre of the show
        @seasons = seasons #an array of season objects
        @number_of_seasons = @seasons.count #the number of the seasons is set to the number of items in the @seasons array
    end

    def list_seasons
        puts "#{@show}"
        for season in @seasons
            print "Season Number: #{season.season_number} - #{season.number_of_episodes} Episodes "
            watched = 0
            for episode in season.episodes
                if episode.watched
                    watched += 1
                end
            end
            puts "- #{season.number_of_episodes - watched} Unwatched"
        end
    end

    def add_season
        @seasons.push(Season.new((show, @number_of_seasons + 1, episodes = []))
    end
end

