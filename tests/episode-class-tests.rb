require 'test/unit'
require_relative '../classes/episode-class'

class EpisodeTest < Test::Unit::TestCase
    def test_show #passes if .show returns the show the episode belongs to.
        episode = Episode.new('Silicon Valley', 1, 2)
        assert_equal("Silicon Valley", episode.show)
    end
    def test_season_number #passes if .season_number returns correct season number
        episode = Episode.new('Silicon Valley', 1, 2)
        assert_equal(1, episode.season_number)
    end
    def test_episode_number #passes if .episode_number returns correct episode number
        episode = Episode.new('Silicon Valley', 1, 2)
        assert_equal(2, episode.episode_number)
    end
    def test_watched #passes if .watched returns true if the episode has been watched
        episode = Episode.new('Silicon Valley', 1, 2, true)
        assert_equal(true, episode.watched)
    end
    def test_unwatched #passes if .watched returns false if the episode has been watched
        episode = Episode.new('Silicon Valley', 1, 2, false)
        assert_equal(false, episode.watched)
    end
    def test_mark_as_watched #passes if episode.watched has been changed from false to true
        episode = Episode.new('Silicon Valley', 1, 2)
        episode.mark_as_watched
        assert_equal(true, episode.watched)
    end
    def test_mark_as_unwatched #passes if episode.watched has been changed from true to false
        episode = Episode.new('Silicon Valley', 1, 2, true)
        episode.mark_as_unwatched
        assert_equal(false, episode.watched)
    end
end