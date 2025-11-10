require "test_helper"

class ActorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "friendly_created_at" do
    actor = Actor.new(created_at: "2025-11-05 02:40:27.262209000 +0000")
    assert_equal "Nov  5,  2:40 AM", actor.friendly_created_at
  end
end
