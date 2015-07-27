require 'watir-webdriver'
require 'page-object'
require 'rspec/expectations'

World(PageObject::PageFactory)
World(RSpec::Matchers)
