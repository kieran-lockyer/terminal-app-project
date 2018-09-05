require_relative '../classes/episode-class'
require_relative '../classes/season-class'
require_relative '../classes/show-class'
require_relative '../classes/user-class'

class Menu
    attr_accessor 

    def initialize(user)
        @user = user
        @show_number = -1
        @season_number = -1
        @episode_number = -1
    end

    def view_shows
        if @user.shows.count > 0
            @user.list_shows
        else
            puts
            puts "No Shows Added"
            puts
        end
    end

    def select_show
        @show_number = gets.chomp.to_i - 1
        self
    end

    def add_show
        @user.add_show
        self
    end

    def view_seasons
        if @user.shows[@show_number].seasons.count > 0
            @user.shows[@show_number].list_seasons
        else
            puts
            puts "No Seasons Added"
            puts
        end
    end

    def select_season
        @season_number = gets.chomp.to_i - 1
        self
    end

    def add_season
        @user.shows[@show_number].add_season
        self
    end

    def view_episodes
        if @user.shows[@show_number].seasons[@season_number].episodes.count > 0
            @user.shows[@show_number].seasons[@season_number].list_episodes
        else
            puts
            puts "No Episodes Added"
            puts
        end
    end

    def select_episode
        @episode_number = gets.chomp.to_i - 1
        self
    end

    def add_episode
        @user.shows[@show_number].seasons[@season_number].add_episode
        self
    end

    def episode_watched
        @user.shows[@show_number].seasons[@season_number].episodes[@episode_number].mark_as_watched
        self
    end

    def episode_not_watched
        @user.shows[@show_number].seasons[@season_number].episodes[@episode_number].mark_as_unwatched
        self
    end

end