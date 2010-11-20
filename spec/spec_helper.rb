$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'viddlereo'
require 'vcr'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


Viddlereo.configuration.configure_from_yaml(File.dirname(__FILE__) + "/viddlereo.yml")

VCR.config do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.stub_with :webmock
  c.default_cassette_options = { :record => :new_episodes, :erb => {
    :key      => Viddlereo.key,
    :password => Viddlereo.password,
    :user     => Viddlereo.user
  } }
end


RSpec.configure do |config|
  config.extend VCR::RSpec::Macros  
end
