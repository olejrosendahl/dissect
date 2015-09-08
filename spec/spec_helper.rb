$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dissect'
require 'pry-byebug'
require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end
