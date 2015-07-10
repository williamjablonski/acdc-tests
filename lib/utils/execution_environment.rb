require 'rubygems'
require 'selenium-cucumber'

module ExecutionEnvironment

	def config
		@config ||= YAML::load_file('config/framework.yml')
	end


	def url
		raise "The URL environment was not specified." if ENV['URL'].nil?
		ENV['URL']
	end

	def browser_name
    	env_browser = ENV['BROWSER'] || ENV['BROWSERNAME'] || ENV['BROWSER_NAME'] || ENV['DEVICE']
    	env_browser.nil_or_empty? ? config['default_browser'].to_sym : env_browser.downcase.to_sym
  end






end

