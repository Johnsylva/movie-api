require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/actors.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Actor.count, data.count
  end

  test "show" do
    post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { email: "test@test.com", password: "password" }

    get "/actors/#{Actor.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id","first_name", "last_name", "known_for", "friendly_created_at"],  #update with custom models
    data.keys
  end

  test "create" do
    assert_difference "Actor.count", 1 do
      post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      post "/sessions.json", params: { email: "test@test.com", password: "password" }
      post "/actors.json", params: {first_name: "John", last_name: "Silver", known_for: "Gold"}
      assert_response 201
    end
  end

  test "update" do
    post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    actor = Actor.first
    put "/actors/#{actor.id}.json", params:
    {first_name: "Updated name"}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["first_name"]
  end
  
  test "destroy" do
    assert_difference "Actor.count", -1 do
      post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      post "/sessions.json", params: { email: "test@test.com", password: "password" }
      delete "/actors/#{Actor.first.id}.json"
      assert_response 200
    end
  end
end
