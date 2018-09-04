require 'test/unit'
require_relative '../classes/season-class'
require_relative '../classes/episode-class'

class SeasonTest < Test::Unit::TestCase
    def test_show #Will pass if the name of the show is the same as set - "Silicon Valley"
        season = Season.new('Silicon Valley', 1, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])
        assert_equal("Silicon Valley", season.show)
    end
    def test_season_number #passes if .season_number returns correct season number
        season = Season.new('Silicon Valley', 1, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])
        assert_equal(1, season.season_number)
    end
    def test_number_of_episodes #Will pass if it shows the correct number of episodes
        season = Season.new('Silicon Valley', 1, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])
        assert_equal(4, season.number_of_episodes)
    end
    def test_list_episodes #Don't know how to write this test yet.
        season = Season.new('Silicon Valley', 1, [Episode.new('Silicon Valley', 1, 1), Episode.new('Silicon Valley', 1, 2), Episode.new('Silicon Valley', 1, 3), Episode.new('Silicon Valley', 1, 4)])
        assert_equal()
    end
end