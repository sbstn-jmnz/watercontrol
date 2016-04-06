ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl_rails'
require 'minitest/reporters'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(reporter_options)]


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FactoryGirl::Syntax::Methods
  # Add more helper methods to be used by all tests here...
  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def token_header(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  def create_headers
    
    user = User.create!
    
    { 'Accept' => Mime::JSON, 
      'Content-Type'=> Mime::JSON.to_s,
      'Authorization' => token_header(user.auth_token)
    }
  end
  

end
