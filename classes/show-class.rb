require_relative '../classes/episode-class'
require_relative '../classes/season-class'

class Show
    attr_accessor :show_name, :genre, :seasons

    def initialize(show_name, genre, seasons = [])
        @show_name = show_name #The show_name of the show the episode belongs to
        @genre = genre #The genre of the show
        @seasons = seasons #an array of season objects
    end

    def list_seasons
        puts "#{@show_name}"
        puts
        for season in @seasons
            print "Season Number: #{season.season_number} / #{season.episodes.count} Episodes "
            watched = 0
            for episode in season.episodes
                if episode.watched
                    watched += 1
                end
            end
            puts "/ #{season.episodes.count - watched} Unwatched"
        end
        puts
    end

    def add_season
        @seasons.push(Season.new(@seasons.count + 1, episodes = []))
    end
end

