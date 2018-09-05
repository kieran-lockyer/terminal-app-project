require 'test/unit'
require_relative '../classes/episode-class'

class EpisodeTest < Test::Unit::TestCase
    def test_episode_number #passes if .episode_number returns correct episode number
        episode = Episode.new(1)
        assert_equal(1, episode.episode_number)
    end
    def test_watched #passes if .watched returns true if the episode has been watched
        episode = Episode.new(1, true)
        assert_equal(true, episode.watched)
    end
    def test_unwatched #passes if .watched returns false if the episode has been watched
        episode = Episode.new(1)
        assert_equal(false, episode.watched)
    end
    def test_mark_as_watched #passes if episode.watched has been changed from false to true
        episode = Episode.new(1)
        episode.mark_as_watched
        assert_equal(true, episode.watched)
    end
    def test_mark_as_unwatched #passes if episode.watched has been changed from true to false
        episode = Episode.new(1, true)
        episode.mark_as_unwatched
        assert_equal(false, episode.watched)
    end
end