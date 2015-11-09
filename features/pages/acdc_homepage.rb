class ACDCHomePage
	include PageObject

  page_url 'http://acdc-staging.avenuecode.com/login'

	div		  :superstars_logo, 	:class => 'superstars-logo'
	button 	:sign_in, 			  	:class => 'btn btn-ajax btn-inverse'
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

