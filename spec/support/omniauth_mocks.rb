module OmniauthMocks
  def twitter_mock
    OmniAuth.config.mock_auth[:twitter2] = OmniAuth::AuthHash.new({ 
      "provider" => "twitter2",
      "uid" => "108252390",
      "info" => {
        "name" => "Mock User",
        "email" => nil,
        "image" => "https://pbs.twimg.com/profile_images/580019517608218624/KzEZSzUy_normal.jpg",
        "urls" => {
          "Website" => "",
          "Twitter" => "https://twitter.com/yu_suke1994"
        }
      },
      "credentials" => {
        "token" => "TOKENTOKENTOKENTOKENTOKENTOKEN",
        "expires_at" => 1642016242,
        "expires" => true
      },
      "extra" => {
        "raw_info" => {
          "name" => "Mock User",
          "id" => "108252390",
          "followers_count" => 2188,
          "following_count" => 1478,
          "tweet_count" => 162937,
          "listed_count" => 110
        }
      }
    })
  end
  def twitter_invalid_mock
    OmniAuth.config.mock_auth[:twitter2] = :invalid_credentails
  end

  def google_mock
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      "provider" => "google_oauth2",
      "uid" => "000000",
      "info" => {
        "email" => "tester1@example.com",
        "name" => "test employee"
      },
      "credentials" => {
        "token" => "google_oauth2_test"
      }
    })
  end

  def google_invalid_mock
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentails
  end
end