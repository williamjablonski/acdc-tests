class SuperStarsHomePage
	include PageObject

	page_url 'https://superstars.avenuecode.com/#!/signin'
	
	div		:superstars_logo, 		:class => 'superstars-logo'
	button 	:sign_in, 			  	:class => 'signin-btn'
	link 	:learn_more, 		    :class => 'learn-more'

	expected_element :superstars_logo

	def initialize_page
		has_expected_element?
	end

end

