

Given (/^I navigate to (.+?)$/) do |page|
	visit(page)
end

And (/^I click on "(.*?)" button$/) do |button|
	@current_page = nil
	case button
		when 'Sign in'
			@current_page = on(SuperStarsHomePage)
			if @current_page.sign_in_element.visible?
				@current_page.sign_in
			end
			
		when 'Add account'
			@current_page = on(SignInPage)
			if @current_page.add_account_button_element.visible?
				@current_page.add_account_button
			end
			
		when 'Next'
			@current_page = on(SignInPage) 
			if @current_page.next_button_element.visible?
				@current_page.next_button
			end
			
		when 'Log in' 
			@current_page = on(SignInPage) 
			if @current_page.sign_in_button_element.visible?
				@current_page.sign_in_button_element.click
			end
			
	end
	#Log.instance.debug "Clicked on #{button} button"
end

Then (/^I fill the "(.*?)" field$/) do |field|
  on(SignInPage).log_in(field)
end

When (/^I wait for (\d+) seconds$/) do |seconds|
  on(SignInPage).wait(seconds)
  #Log.instance.debug "Waited #{seconds} seconds"
end

Then (/^I (.+?) superstars to access my account$/) do |action|
  case action
    when 'approve'
      on(SignInPage).approve_access
    when 'deny'
      on(SignInPage).deny_access
  end
end

Then(/^I should be logged in$/) do
	pending # Write code here that turns the phrase above into concrete actions
end