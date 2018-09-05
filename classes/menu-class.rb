require_relative '../classes/episode-class'
require_relative '../classes/season-class'
require_relative '../classes/show-class'
require_relative '../classes/user-class'
require 'espeak'

class Menu
    attr_accessor 

    def initialize(user, audio)
        @user = user
        @show_number = -1
        @season_number = -1
        @episode_number = -1
        @audio = audio
    end

    def view_shows
        if @user.shows.count > 0
            @user.list_shows
            if @audio
                ESpeak::Speech.new(@user.shows.map{|show| "#{show.show_name} #{show.genre}"}.join).speak
            end
        else
            puts
            puts "No Shows Added"
            puts
            if @audio
                ESpeak::Speech.new("No Shows Added").speak
            end
        end
    end

    def select_show
        selection = gets.chomp.to_i
        if selection <= @user.shows.count
            @show_number = selection - 1
            true
        else
            false
        end
    end

    def add_show
        print "Please enter the name of the show you want to add: "
        if @audio
            ESpeak::Speech.new("Please enter the name of the show you want to add: ").speak
        end
        show_name = gets.chomp
        print "Please enter the genre of the show you want to add: "
        if @audio
            ESpeak::Speech.new("Please enter the genre of the show you want to add: ").speak
        end
        genre = gets.chomp
        @user.add_show(show_name, genre)
        self
    end

    def view_seasons
        if @user.shows[@show_number].seasons.count > 0
            @user.shows[@show_number].list_seasons
            if @audio
                ESpeak::Speech.new(@user.shows[@show_number].seasons.map{|season| "Season #{season.season_number}"}.join).speak
            end
        else
            puts "#{@user.shows[@show_number].show_name}"
            puts
            puts "No Seasons Added"
            puts
            if @audio
                ESpeak::Speech.new("No Seasons Added").speak
            end
        end
    end

    def select_season
        selection = gets.chomp.to_i
        if selection <= @user.shows[@show_number].seasons.count
            @season_number = selection - 1
            true
        else
            false
        end
    end

    def add_season
        @user.shows[@show_number].add_season
        self
    end

    def view_episodes
        if @user.shows[@show_number].seasons[@season_number].episodes.count > 0
            @user.shows[@show_number].seasons[@season_number].list_episodes
            if @audio
                ESpeak::Speech.new(@user.shows[@show_number].seasons[@season_number].episodes.map{|episode| episode.watched ? "Episode #{episode.episode_number} watched" : "Episode #{episode.episode_number} not watched"}.join).speak
            end
        else
            puts "#{@user.shows[@show_number].show_name}"
            puts "Season: #{@user.shows[@show_number].seasons[@season_number].season_number}"
            puts
            puts "No Episodes Added"
            puts
            if @audio
                ESpeak::Speech.new("No Episodes Added").speak
            end
        end
    end

    def select_episode
        selection = gets.chomp.to_i
        if selection <= @user.shows[@show_number].seasons[@season_number].episodes.count
            @episode_number = selection - 1
            true
        else
            false
        end
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