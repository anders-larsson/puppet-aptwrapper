require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

# Include hiera
RSpec.configure do |c|
  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'
end
