require_relative '../classes/episode-class'
require_relative '../classes/season-class'

class Show
    attr_accessor :show_name, :genre, :seasons

    def initialize(show_name, genre, seasons = [])
        @show_name = show_name #The show_name of the show the episode belongs to
        @genre = genre #The genre of the show
        @seasons = seasons #an array of season objects
    end

    def list_seasons #lists the seasons in a show along with no. of episodes and no. of unwatched episodes
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

    def add_season #pushes a new season object to the end of the seasons array.
        @seasons.push(Season.new(@show_name, @seasons.count + 1))
    end

    def remove_season #pops a season object off the end of the seasons array.
        @seasons.delete_at(@seasons.count - 1)
    end

    def to_s
        "#{@show_name} - Seasons: #{@seasons.length}"
    end
end

