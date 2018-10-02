class Episode
    attr_accessor :episode_number, :watched

    def initialize(episode_number, watched = false)
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