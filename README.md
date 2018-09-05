# terminal-app-project
### Coder Academy 1st semester terminal app project in Ruby

# TV Show Organisor (TVSO)

### Problem Definition
Have you ever felt the pain of coming back to a show from a long hiatus (maybe due to being a good student and swapping Game of Thrones for your History text book so you can ace your final exam) and not remembering where you left off? Have you spent 20 minutes watching an episode, only to realise you've already seen it? How did that make you feel? If you're anything like me, you might have given up on watching that series all together rather than dig through episode by episode to try and find the right place to pick up again.

### Solution
TVSO is a simple app that runs in the terminal that allows you to easily keep track of all your favourite shows from one easy to use location. Simply load up TVSO, add the details of a show you want to track, and mark off each episode as you watch it.

Never waste your time unintentionally rewatching shows again.

### Ethical Considerations
We are not responsible for any shows obtained by illegal methods such as torrents or bootleg dvd's. If you enjoy the work, support the creators by paying for it.

### Features:
- Add TV shows you are currently watching
- Add seasons to your shows
- Add episodes to your seasons
- Remove shows
- Remove seasons
- Remove episodes
- View list of shows you have added
- View list of seasons and episodes for each added TV Show
- Mark a show as watched or not yet watched

### Prerequisites:
Espeak Ruby Gem
This gem is required for TTS Accessibility functionality and must be required in tvsorb and menu-class.rb
https://rubygems.org/gems/espeak-ruby/versions/1.0.3

### Launching the App:
Open up terminal and navigate to the directory that contains the terminal app files and type `ruby tvso.rb`

### Using the App:
The app was designed to take as little input as possible to navigate the menu. Each menu can be navigated by typing a number corresponding with the onscreen prompts. 

### Screenshots:
##### Show Menu

![Show Menu](https://github.com/kieran-lockyer/terminal-app-project/blob/master/ppt/show-menu-screen.jpg)

##### Season Menu

![Show Menu](https://github.com/kieran-lockyer/terminal-app-project/blob/master/ppt/season-menu-screen.jpg)

##### Episode Menu

![Show Menu](https://github.com/kieran-lockyer/terminal-app-project/blob/master/ppt/episode-menu-screen.jpg)

### User Stories

![Show Menu](https://github.com/kieran-lockyer/terminal-app-project/blob/master/ppt/trello-progress-updated.jpg)

### User Workflow

![Show Menu](https://github.com/kieran-lockyer/terminal-app-project/blob/master/ppt/user-workflow.jpg)

### Design Decisions
- We decided to make Shows, Seasons and Episodes objects in order to have the code base more seperated into modules, and to make it easier to interact with and manipulate the data within the main ruby file.
- We also added User classes to make the app more extensible in the future for adding multiple user features.
- A menu class was added as a layer of abstraction in order to not be directly manipulating data outside the bounds of what is required for the app.

### List of Tools Used
- Visual Studio Code
- GitHub
- Ubuntu Terminal
- Trello
- Slack
- Google Slides

### Bugs
No known bugs at this time, please let us know if you find any.

### Future Updates
- Rename Shows
- Multiple users with different shows
- Show the next episode to watch in a series
- Filter shows by genre
- Automatically retrieve info about shows you add from IMDB/Wikipedia

