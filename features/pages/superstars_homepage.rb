class SuperStarsHomePage
	include PageObject

  page_url 'http://superstars.avenuecode.com:3030/#!/signin'
	#page_url 'http://192.168.0.7:3030'
	#page_url 'http://superstars.avenuecode.com'

	div		  :superstars_logo, 	:class => 'superstars-logo'
	button 	:sign_in, 			  	:class => 'signin-btn'
	link 	  :learn_more, 		    :class => 'learn-more'

	expected_element :superstars_logo

	def initialize_page
		#has_expected_element?
    wait_until(20, "ERROR: Home page did not load"){superstars_logo_element.visible?}
	end

  def click_on(button)
    wait_until(10, "ERROR: SignIn button did not load"){sign_in_element.visible?}

  end

end

