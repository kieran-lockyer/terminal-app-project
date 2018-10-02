require_relative '../classes/episode-class'

class Season
    attr_accessor :season_number, :episodes, :show

    def initialize(show, season_number, episodes = [])
        @show = show #name of the show
        @season_number = season_number #the number of the season in the series
        @episodes = episodes #an array of episode objects
    end

    def list_episodes #will puts to the screen a list of the episodes in the season
        puts "#{@show}"
        puts "Season: #{@season_number}"
        puts
        for episode in @episodes
            print "Episode Number: #{episode.episode_number} " #print to keep the "watched/unwatched" on the same line
            if episode.watched
                puts "- Watched"
            else
                puts "- Unwatched"
            end
        end
        puts
    end

    def add_episode #pushes a new episode object to the end of the episodes array, watched set to false by default
        @episodes.push(Episode.new(@episodes.count + 1))
    end

    def remove_episode #removes the last episode from the episodes array
        @episodes.delete_at(@episodes.count - 1)
    end

    def to_s
        puts "#{@show} - Season: #{@season_number} - Episodes: #{@episodes.length}"
    end
end


