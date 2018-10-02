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
        puts "Fetching data... "
    end

    def scrape
        begin
            @data = open(@url).read.scan(/<tbody>(.*?)<\/tbody>/)[0][0].split("<tr>")
            @season_data = @data[2..@data.length - 1].map {|data| data.split("</td>")}
            for season in @season_data
                # if season[1][-6].is_number?
                #     @seasons += season[1][-6].to_i * 10
                # end
                # if season[1][-5].is_number?
                #     @seasons += season[1][-5].to_i
                # end
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
            @data = open(@alternate).read.scan(/<tbody>(.*?)<\/tbody>/)[0][0].split("<tr>")
            @season_data = @data[1..@data.length - 1].map {|data| data.split("</td>")}
            for season in @season_data
                # if season[1][-6].is_number?
                #     @seasons += season[1][-6].to_i * 10
                # end
                # if season[1][-5].is_number?
                #     @seasons += season[1][-5].to_i
                # end
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
            puts "Data could not be found. Please enter manually."
        end
    end
end



