$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'simplecov'
require 'simplecov-gem-adapter'
SimpleCov.start 'gem'

require 'rspec'
require 'partyhat'

RSpec.configure do |config|

end
