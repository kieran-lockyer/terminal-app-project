require 'test/unit'
require_relative '../classes/show-class'
require_relative '../classes/season-class'
require_relative '../classes/episode-class'

class ShowTest < Test::Unit::TestCase
    def test_show #Will pass if the name of the show is the same as set - "Silicon Valley"
        seasons = [Season.new('Silicon Valley', 1, 4, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])]
        show = Show.new('Silicon Valley', "Comedy", 1, seasons)
        assert_equal("Silicon Valley", show.show)
    end
    def test_genre #Will pass if the genre of the show is the same as set - "Comedy"
        seasons = [Season.new('Silicon Valley', 1, 4, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])]
        show = Show.new('Silicon Valley', "Comedy", 1, seasons)
        assert_equal("Comedy", show.genre)
    end
    def test_number_of_seasons #Will pass if the .number_of_seasons of the show is the same as set - 1
        seasons = [Season.new('Silicon Valley', 1, 4, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])]
        show = Show.new('Silicon Valley', "Comedy", 1, seasons)
        assert_equal(1, show.number_of_seasons)
    end
    def test_list_seasons #Don't know how to write this test yet.
        seasons = [Season.new('Silicon Valley', 1, 4, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])]
        show = Show.new('Silicon Valley', "Comedy", 1, seasons)
        assert_equal("???", show.list_seasons)
    end
end