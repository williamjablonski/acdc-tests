

Given (/^that I navigate to the website$/) do
	visit('http://staging­superstars.avenuecode.com')
end

And (/^I click on "(.*?)" button$/) do |button|
	case button
		when 'Sign in'
			on(SuperStars::HomePage) do
				if sign_in_element.visible?
					sign_in_element.click
				end
			end
		when 'Add account'
			on(SuperStars::SignInPage) do
				if add_account_button_element.visible?
					add_account_button_element.click
				end
			end
		when 'Next'
			on(SuperStars::SignInPage) do
				if next_button_element.visible?
					next_button_element.click
				end
			end
		when 'Log in' 
			on(SuperStars::SignInPage) do
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
			on(SuperStars::SignInPage) do
        selected_field = account_user_element
			end
		when 'Passwd'
			on(SuperStars::SignInPage) do
        selected_field = account_password_element
      end
      selected_field.value = value if(selected_field.visible?)
      Log.instance.debug "Field '#{field}' filled with value: #{value}"
	end

  And (/^I wait for \d? seconds$/) do |seconds|
    sleep (seconds)
    Log.instance.debug "Waited #{seconds} seconds"
  end


end