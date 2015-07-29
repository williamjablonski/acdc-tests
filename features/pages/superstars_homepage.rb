class SuperStarsHomePage
	include PageObject

	page_url 'http://192.168.0.7:3030'
	#page_url 'http://superstars.avenuecode.com'

  #http://192.168.0.7:3030/auth/google/callback?code=4/HyeJn5vSb1LwJhYp0zZ-V0GByTvqKBo5-YAshciShbI#

	div		  :superstars_logo, 	:class => 'superstars-logo'
	button 	:sign_in, 			  	:class => 'signin-btn'
	link 	  :learn_more, 		    :class => 'learn-more'

	expected_element :superstars_logo

	def initialize_page
    @browser.driver.manage.timeouts.implicit_wait = 10
		has_expected_element?
	end

end

