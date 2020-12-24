# frozen_string_literal: true

require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/files/vcr'
  c.hook_into :webmock
end
