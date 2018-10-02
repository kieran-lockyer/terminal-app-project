require_relative '../classes/episode-class'
require_relative '../classes/season-class'
require_relative '../classes/show-class'
require_relative '../classes/user-class'
# require 'espeak'
require_relative '../classes/scrape'

class Menu

    def initialize(user, audio)
        @user = user #passes in the user object that contains an array of shows as an attribute
        @show_number = -1 #user.shows returns an array of shows. @show_number points to the index of that array
        @season_number = -1 #user.shows[@show_number].seasons returns an array of seasons. @season_number points to the index of that array
        @episode_number = -1 #user.shows[@show_number].seasons[@season_number].episodes returns an array of episodes. @episode number points to the index of that array
        @audio = audio #true or false value of if audio guidance is required
    end

    def view_shows
        if @user.shows.count > 0 #if .count == 0, the array is empty so puts "No Shows Added"
            @user.list_shows #User method that lists shows in shows array
            if @audio #if @audio is true, 'espeak' gem will read out the strings of the show names and genre
                ESpeak::Speech.new(@user.shows.map{|show| "#{show.show_name} #{show.genre}"}.join).speak
            end
        else
            puts
            puts "No Shows Added"
            puts
            if @audio #if @audio is true, 'espeak' will read out "no shows added"
                ESpeak::Speech.new("No Shows Added").speak
            end
        end
    end

    def select_show #sets the @show_number pointer if the input is within the range of ovailable shows, otherwise returns to the menu without setting @show_number
        selection = gets.chomp.to_i
        if selection <= @user.shows.count
            @show_number = selection - 1
            true
        else
            false
        end
    end

    def add_show #takes show name and genre and calls add show method with required attributes, pushing the show object to the end of the shows array in user object.
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

        show_data = ShowFetch.new(show_name)
        show_data.scrape
        
        if show_data.seasons.length > 0
            @show_number = -1
            @season_number = -1
            @episode_number = -1
            @user.add_show(show_name, genre)
            for season in show_data.seasons
                if season > 0
                    @user.shows[@show_number].add_season
                    season.times do
                        @user.shows[@show_number].seasons[@season_number].add_episode
                    end
                end
            end
        else
            @user.add_show(show_name, genre)
        end
        self
    end

    def remove_show #removes a show from the shows array
        @user.remove_show(@show_number)
    end

    def view_seasons #if seasons isn't empty, will list the seasons in a show, else "no seasons addded" will be displayed
        if @user.shows[@show_number].seasons.count > 0
            @user.shows[@show_number].list_seasons
            if @audio
                ESpeak::Speech.new(@user.shows[@show_number].seasons.map{|season| "Season #{season.season_number}"}.join).speak
            end
        else
            puts "#{@user.shows[@show_number].show_name}"
            puts
            puts "Show data could not be found. Please add seasons and episodes manually."
            puts
            if @audio
                ESpeak::Speech.new("Show data could not be found. Please add seasons and episodes manually.").speak
            end
        end
    end

    def select_season #sets @season_number if user input is within the range of number of seasons added, else does nothing
        selection = gets.chomp.to_i
        if selection <= @user.shows[@show_number].seasons.count
            @season_number = selection - 1
            true
        else
            false
        end
    end

    def add_season #pushes a season object the the end of the seasons array in the show object
        @user.shows[@show_number].add_season
        self
    end

    def remove_season #pops a season object from the end of the seasons array in show object
        @user.shows[@show_number].remove_season
    end

    def view_episodes #if episodes array isn't empty, episodes will be listed, else puts "No episodes added"
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

    def select_episode #sets @episode_number pointer if input is within range of episodes added to the seasons, else does nothing
        selection = gets.chomp.to_i
        if selection <= @user.shows[@show_number].seasons[@season_number].episodes.count
            @episode_number = selection - 1
            true
        else
            false
        end
    end

    def add_episode #pushes episode object to the end of the episodes array in the season object
        @user.shows[@show_number].seasons[@season_number].add_episode
        self
    end

    def remove_episode
        @user.shows[@show_number].seasons[@season_number].remove_episode
    end

    def episode_watched #sets watched attribute of the episode object to true
        @user.shows[@show_number].seasons[@season_number].episodes[@episode_number].mark_as_watched
        self
    end

    def episode_not_watched #sets watched attribute of the episode object to false
        @user.shows[@show_number].seasons[@season_number].episodes[@episode_number].mark_as_unwatched
        self
    end

end