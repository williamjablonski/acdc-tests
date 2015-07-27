class SuperStarsHomePage
	include PageObject

	div		:superstars_logo, 		:class => 'superstars-logo'
	button 	:sign_in, 			  	:class => 'signin-btn'
	link 	:learn_more, 		    :class => 'learn-more'

	page_url 'http://staging-superstars.avenuecode.com'
	expected_element :superstars_logo

	def initialize_page
		has_expected_element?
	end

end

