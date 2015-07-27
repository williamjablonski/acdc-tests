

Given (/^that I navigate to (.+?)$/) do |page|
	visit(page)
end

And (/^I click on "(.*?)" button$/) do |button|
	case button
		when 'Sign in'
			on(SuperStarsHomePage) do
				if sign_in_element.visible?
					sign_in_element.click
				end
			end
		when 'Add account'
			on(SignInPage) do
				if add_account_button_element.visible?
					add_account_button_element.click
				end
			end
		when 'Next'
			on(SignInPage) do
				if next_button_element.visible?
					next_button_element.click
				end
			end
		when 'Log in' 
			on(SignInPage) do
				if sign_in_button_element.visible?
					sign_in_button_element.click
				end
			end
	end
	Log.instance.debug "Clicked on #{button} button"
end

And (/^I enter "(.*?)" into input field having id "(.*?)" there$/) do |value, field|
  selected_field = nil
  case field
		when 'Email'
			on(SignInPage) do
        selected_field = account_user_element
			end
		when 'Passwd'
			on(SignInPage) do
        selected_field = account_password_element
      end
      selected_field.value = value if(selected_field.visible?)
      Log.instance.debug "Field '#{field}' filled with value: #{value}"
	end
end

When (/^I wait for (\d+) seconds$/) do |seconds|
    @browser.driver.manage.timeout.implicit_wait = seconds
    Log.instance.debug "Waited #{seconds} seconds"
end


Then(/^I should be logged in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end