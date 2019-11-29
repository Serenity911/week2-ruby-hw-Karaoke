require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")


class RoomTest < MiniTest::Test

    def setup
      @room1 = Room.new("The blue room")

    end

end
