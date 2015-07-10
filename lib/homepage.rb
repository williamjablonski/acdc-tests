module SuperStars
	class HomePage
		include PageObject

		div		:superstars_logo, 	:class => 'superstars-logo'
		button 	:sign_in, 			:class => 'signin-btn'
		link 	:learn_more, 		:class => 'learn-more'

		page_url ExecutionEnvironment.url
		expected_element :superstars_logo

		def initialize_page
			has_expected_element?
		end

	end
end
