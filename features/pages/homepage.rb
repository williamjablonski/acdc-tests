class SuperStarsHomePage
	include PageObject

	page_url 'http://192.168.0.7:3030'
	
	div		  :superstars_logo, 	:class => 'superstars-logo'
	button 	:sign_in, 			  	:class => 'signin-btn'
	link 	  :learn_more, 		    :class => 'learn-more'

	expected_element :superstars_logo

	def initialize_page
    @browser.driver.manage.timeouts.implicit_wait = 10
		has_expected_element?
	end

end

