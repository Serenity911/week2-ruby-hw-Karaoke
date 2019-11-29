require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song")


class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Heart of Courage", "Two Steps From Hell")
  end

  def test_song_has_title()
    assert_equal("Heart of Courage", @song1.title)
  end

  def test_song_has_artist()
    assert_equal("Two Steps From Hell", @song1.artist)
  end


end
