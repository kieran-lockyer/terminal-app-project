require_relative '../classes/episode-class'

class Season
    attr_accessor :season_number, :episodes, :show

    def initialize(show, season_number, episodes = [])
        @show = show
        @season_number = season_number #the number of the season in the series
        @episodes = episodes #an array of episode objects
    end

    def list_episodes #will puts to the screen a list of the episodes in the season
        puts "#{@show}"
        puts "Season: #{@season_number}"
        puts
        for episode in @episodes
            print "Episode Number: #{episode.episode_number} "
            if episode.watched
                puts "- Watched"
            else
                puts "- Unwatched"
            end
        end
        puts
    end

    def add_episode
        @episodes.push(Episode.new(@episodes.count + 1, watched = false))
    end
end


