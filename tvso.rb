require_relative 'classes/episode-class'
require_relative 'classes/season-class'
require_relative 'classes/show-class'
require_relative 'classes/user-class'
require_relative 'classes/menu-class'

bb_seasons = [Season.new('Breaking Bad', 1, [Episode.new('Breaking Bad', 1, 1), Episode.new('Breaking Bad', 1, 2)])]
sv_seasons = [Season.new('Silicon Valley', 1, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])]
user = User.new("Test", [Show.new('Silicon Valley', "Comedy", sv_seasons), Show.new("Breaking Bad", 'Drama', bb_seasons)])

def show_menu(main)
    system "clear"
    puts "Welcome to TV Show Organisor!"
    while true
        puts "Show Menu"
        main.view_shows
        print "Press 1 to view a show, 2 to add a show or 3 to exit: "
        choice = gets.chomp
        case choice
        when "1"
            print "Please enter the show number: "
            main.select_show
            season_menu(main)
        when "2"
            main.add_show
        when "3"
            break
        else
            # main.reset_menu
            puts "Invalid Selection. Please try again!"
        end
        system "clear"
    end
end

def season_menu(main)
    while true
        system "clear"
        puts "Season Menu"
        main.view_seasons
        print "Press 1 to view a season, 2 to add a season or 3 to return to 'Show Menu': "
        choice = gets.chomp
        case choice
        when "1"
            print "Please enter the season number: "
            main.select_season
            episode_menu(main)
            break
        when "2"
            main.add_season
        when "3"
            # main.reset_menu
            break
        else
            puts "Invalid Selection. Please try again!"
        end
    end
end

def episode_menu(main)
    while true
        system "clear"
        puts "Episode Menu"
        main.view_episodes
        print "Press 1 to mark an episode as watched, 2 to mark an episode as unwatched, 3 to add an episode or 4 to return to 'Season Menu': "
        choice = gets.chomp
        case choice
        when "1"
            print "Please enter the episode number: "
            main.select_episode.episode_watched
        when "2"
            print "Please enter the episode number: "
            main.select_episode.episode_not_watched
        when "3"
            main.add_episode
        when "4"
            # main.reset_menu
            season_menu(main)
            break
        else
            puts "Invalid Selection. Please try again!"
        end
    end
end


main = show_menu(Menu.new(user))

system "clear"
puts "Thanks for using TV Show Organisor"