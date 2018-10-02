require_relative 'classes/episode-class'
require_relative 'classes/season-class'
require_relative 'classes/show-class'
require_relative 'classes/user-class'
require_relative 'classes/menu-class'
require 'yaml'
require 'espeak'

def show_menu(main, audio) # Menu to interface with shows. From here you can view shows, add shows or exit.
    show_menu = true # sets condition to loop show menu to true
    system "clear"
    puts "Welcome to TV Show Organiser!"
    if audio
        ESpeak::Speech.new("Welcome to TV Show Organiser!").speak
    end
    while show_menu # Keeps user in the show menu loop incase they hit a wrong key, will be given another try.
        puts "Show Menu"
        if audio
            ESpeak::Speech.new("Show Menu").speak
        end
        main.view_shows #lists the shows in the user profile
        print "Press 1 to view a show, 2 to add a show, 3 to remove a show or 4 to exit: "
        if audio
            ESpeak::Speech.new("Press 1 to view a show, 2 to add a show, 3 to remove a show or 4 to exit: ").speak
        end
        choice = gets.chomp
        case choice
        when "1"
            print "Please enter the show number: "
            if audio
                ESpeak::Speech.new("Please enter the show number: ").speak
            end
            if main.select_show # sets the menu attribute for show number to the corresponding show number in the show list
                season_menu(main, audio) # sends the user to the 'Season Menu'
            end
        when "2"
            main.add_show #adds a show object to the user object
        when "3"
            print "Please enter the show number: "
            if audio
                ESpeak::Speech.new("Please enter the show number: ").speak
            end
            if main.select_show #sets the array pointer to the index of the show
                main.remove_show #removes the show from the shows array in user object
            end
        when "4"
            show_menu = false # exits the show_menu loop, and exits the function, sending you to line 102 to save data
        else
            puts "Invalid Selection. Please try again!"
            if audio
                ESpeak::Speech.new("Invalid Selection. Please try again!").speak
            end
        end
        system "clear"
    end
end

def season_menu(main, audio) # Menu to interface with seasons, view the episodes in a season or add a season to a show
    season_menu = true # sets condition to loop season menu to true
    while season_menu # Keeps user in the season menu loop incase they hit a wrong key, will be given another try.
        system "clear"
        puts "Season Menu"
        if audio
            ESpeak::Speech.new("Season Menu").speak
        end
        main.view_seasons #lists the seasons in the show
        print "Press 1 to view a season, 2 to add a season, 3 to remove a season or 4 to return to 'Show Menu': "
        if audio
            ESpeak::Speech.new("Press 1 to view a season, 2 to add a season, 3 to remove a season or 4 to return to 'Show Menu': ").speak
        end
        choice = gets.chomp
        case choice
        when "1"
            print "Please enter the season number: "
            if audio
                ESpeak::Speech.new("Please enter the season number: ").speak
            end
            if main.select_season # sets the menu attribute for season number to the corresponding season number in the season list
                episode_menu(main, audio) # sends the user to the 'Episode Menu'
                season_menu = false # sets condition to loop season menu to false, breaking the loop so you don't return to the loop when exiting another menu
            end
        when "2"
            main.add_season #adds a season object to the show object
        when "3"
            main.remove_season #removes a season object from the show object
        when "4"
            season_menu = false # sets condition to loop season menu to false, breaking the loop so you don't return to the loop when exiting another menu
        else
            puts "Invalid Selection. Please try again!"
            if audio
                ESpeak::Speech.new("Invalid Selection. Please try again!").speak
            end
        end
    end
end

def episode_menu(main, audio) # Menu to interface with episodes, Mark as watched or unwatched or add an episode to a season
    episode_menu = true # sets condition to loop episode menu to true
    while episode_menu # Keeps user in the episode menu loop incase they hit a wrong key, will be given another try.
        system "clear"
        puts "Episode Menu"
        if audio
            ESpeak::Speech.new("Episode Menu").speak
        end
        main.view_episodes #lists the episodes in season
        print "Press 1 to mark an episode as watched, 2 to mark an episode as unwatched, 3 to add an episode, 4 to remove an episode, or 5 to return to 'Season Menu': "
        if audio
            ESpeak::Speech.new("Press 1 to mark an episode as watched, 2 to mark an episode as unwatched, 3 to add an episode, 4 to remove an episode, or 5 to return to 'Season Menu': ").speak
        end
        choice = gets.chomp
        case choice
        when "1"
            print "Please enter the episode number: "
            if audio
                ESpeak::Speech.new("Please enter the episode number: ").speak
            end
            if main.select_episode # sets the menu attribute for episode number to the corresponding episode number in the episode list
                main.episode_watched #sets the episode as watched
            end
        when "2"
            print "Please enter the episode number: "
            if audio
                ESpeak::Speech.new("Please enter the episode number: ").speak
            end
            if main.select_episode # sets the menu attribute for episode number to the corresponding episode number in the episode list
                main.episode_not_watched #sets the episode as unwatched
            end
        when "3"
            main.add_episode #adds an episode object to the season object
        when "4"
            main.remove_episode #removes an episode object from the season object
        when "5"
            episode_menu = false # sets condition to loop episode menu to false, breaking the loop so you don't return to the loop when exiting another menu
            season_menu(main, audio) #returns user to season menu to make further changes to the season
        else
            puts "Invalid Selection. Please try again!"
            if audio
                ESpeak::Speech.new("Invalid Selection. Please try again!").speak
            end
        end
    end
end

# Program Starts Here!!!
begin
    user = YAML.load(File.read("data.yml")) # imports data from data.yml file if a file exists, and parses it as a User object which is set to user variable 
rescue => exception
    user = User.new("User 1", []) #if data.yml file doesn't exist, creates an new blank User object and assigns it to user variable
end

# a simple loop that allows you to select an audio guide for the app. Utilises the 'espeak' gem.
system 'clear'
puts "TV SHOW ORGANISER"
# while true
#     print "Do you require voice guidance? Please enter 'Y' for yes or 'N' for no: "
#     ESpeak::Speech.new("Do you require voice guidance? Please enter 'Y' for yes or 'N' for no.").speak
#     option = gets.chomp
#     case option
#     when 'Y', 'y'
#         audio = true
#         break
#     when 'N', 'n'
#         audio = false
#         break
#     else
#         puts "Invalid option"
#         ESpeak::Speech.new("Invalid option").speak
#     end
# end

audio = false

# On launch, executes the 'Show Menu' function. As you switch menus, the program will 
# jump to 'Season Menu' function or 'Episode Menu' function
main = show_menu(Menu.new(user, audio), audio) #user is the object that contains all show, season and episode information as objects.

# When you exit the 'Show Menu' Function, you will pop out here, and the data will be stored in the file below
File.open("data.yml", "w") { |file| file.write(user.to_yaml) } #converts the user object to yaml format and then written to data.yaml

#The screen is now cleared and a goodbye message is presented before the program terminates.
system "clear"
puts "Thanks for using TV Show Organiser"
if audio
    ESpeak::Speech.new("Thanks for using TV Show Organiser").speak
end
#Program Ends Here