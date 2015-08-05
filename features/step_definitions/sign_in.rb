
Given (/^I navigate to (.+?)$/) do |page|
	visit(page)
end

And (/^I click on "(.*?)" button$/) do |button|
	case button
		when 'Sign in'
			on(SuperStarsHomePage).sign_in

    when 'Next'
      on(GoogleSignInPage).next_button

    when 'Log in'
      on(GoogleSignInPage).sign_in_button
  end
end

Then (/^I fill the "(.*?)" field with (.+?) data$/) do |field, type_data|
  on(GoogleSignInPage).log_in(field, type_data)
end

When (/^I wait for (\d+) seconds$/) do |seconds|
  on(GoogleSignInPage).wait(seconds)
  #Log.instance.debug "Waited #{seconds} seconds"
end

Then (/^I (.+?) superstars to access my account$/) do |action|
  case action
    when 'approve'
      on(GoogleSignInPage).approve_access
    when 'deny'
      on(GoogleSignInPage).deny_access
  end
end


Then(/^I should be on (.+?)$/) do |page|
  case page
    when 'SuperStarsHomePage'
      on(SuperStarsHomePage)
    when 'SuperStarsInitialPage'
      on(SuperStarsInitialPage)
  end
end

Then(/^I should see an error message for invalid (.+?)$/) do |field|
  on(GoogleSignInPage).error_msg_displayed(field)
end