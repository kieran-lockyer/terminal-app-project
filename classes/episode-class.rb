class Episode
    attr_accessor :show, :season_number, :episode_number, :watched

    def initialize(show, season_number, episode_number, watched = false)
        @show = show #the name of the show the episode belongs to
        @season_number = season_number #Which season the episode belongs to
        @episode_number = episode_number #the number of the episode in the season
        @watched = watched #true if watched, false if not watched - will be set to false by default
    end

    def mark_as_watched
        @watched = true #sets the episode watched status to true
        puts "Show marked as watched"
    end

    def mark_as_unwatched
        @watched = false #sets the episode watched status to false
        puts "Show marked as unwatched"
    end
end