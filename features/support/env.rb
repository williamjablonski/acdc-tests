require 'watir-webdriver'
require 'page-object'
require 'rspec/expectations'
require 'data_magic'

World(PageObject::PageFactory)
World(RSpec::Matchers)
