require 'open-uri'

class String
  def is_number?
    true if Float(self) rescue false
  end
end

class ShowFetch
    attr_reader :seasons
    def initialize(name)
        @show = name.split() * "_"
        @url = "https://en.wikipedia.org/wiki/List_of_#{@show}_episodes"
        @alternate = "https://en.wikipedia.org/wiki/#{@show}_(TV_series)"
        @seasons = []
        @show2 = @show.split("_").map { |word| word.capitalize} * "_"
        @url2 = "https://en.wikipedia.org/wiki/List_of_#{@show2}_episodes"
        @alternate2 = "https://en.wikipedia.org/wiki/#{@show2}_(TV_series)"
        @alternate3 = "https://en.wikipedia.org/wiki/#{@show2}"
    end

    def scrape
        begin
            puts "Fetching data from #{@url}"
            @data = open(@url).read.scan(/<tbody>(.*?)<\/tbody>/)[0][0].split("<tr>")
            @season_data = @data[2..@data.length - 1].map {|data| data.split("</td>")}
            for season in @season_data
                episodes = 0
                if season[2][-2].is_number?
                    episodes += season[2][-2].to_i * 10
                end
                if season[2][-1].is_number?
                    episodes += season[2][-1].to_i
                end
                @seasons.push(episodes)
            end
        rescue
            begin
                puts "Fetching data from #{@alternate}"
                @data = open(@alternate).read.scan(/<tbody>(.*?)<\/tbody>/)[0][0].split("<tr>")
                @season_data = @data[1..@data.length - 1].map {|data| data.split("</td>")}
                for season in @season_data
                    episodes = 0
                    if season[2][-2].is_number?
                        episodes += season[2][-2].to_i * 10
                    end
                    if season[2][-1].is_number?
                        episodes += season[2][-1].to_i
                    end
                    @seasons.push(episodes)
                end
            rescue
                begin
                    puts "Fetching data from #{@url2}"
                    @data = open(@url2).read.scan(/<tbody>(.*?)<\/tbody>/)[0][0].split("<tr>")
                    @season_data = @data[2..@data.length - 1].map {|data| data.split("</td>")}
                    for season in @season_data
                        episodes = 0
                        if season[2][-2].is_number?
                            episodes += season[2][-2].to_i * 10
                        end
                        if season[2][-1].is_number?
                            episodes += season[2][-1].to_i
                        end
                        @seasons.push(episodes)
                    end
                rescue
                    begin
                        puts "Fetching data from #{@alternate2}"
                        @data = open(@alternate2).read.scan(/<tbody>(.*?)<\/tbody>/)[0][0].split("<tr>")
                        @season_data = @data[1..@data.length - 1].map {|data| data.split("</td>")}
                        for season in @season_data
                            episodes = 0
                            if season[2][-2].is_number?
                                episodes += season[2][-2].to_i * 10
                            end
                            if season[2][-1].is_number?
                                episodes += season[2][-1].to_i
                            end
                            @seasons.push(episodes)
                        end
                    rescue
                        begin
                            puts "Fetching data from #{@alternate3}"
                            @data = open(@alternate3).read.scan(/<tbody>(.*?)<\/tbody>/)[0][0].split("<tr>")
                            @season_data = @data[1..@data.length - 1].map {|data| data.split("</td>")}
                            for season in @season_data
                                episodes = 0
                                if season[1][-2].is_number?
                                    episodes += season[2][-2].to_i * 10
                                end
                                if season[1][-1].is_number?
                                    episodes += season[2][-1].to_i
                                end
                                @seasons.push(episodes)
                            end
                        rescue
                            puts "Data could not be found. Please enter manually."
                        end
                    end
                end
            end
        end
    end
end

