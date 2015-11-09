
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
      when 'M'
        on(SuperStarsInitialPage).clickLetterMenu(button)
    end
  end

  Then (/^I fill the "(.*?)" field with (.+?) data$/) do |field, type_data|
    on(GoogleSignInPage).log_in(field, type_data)
  end

  When (/^I wait for (\d+) seconds$/) do |seconds|
    on(GoogleSignInPage).wait(seconds)
  end

  Then (/^I (.+?) acdcd to access my account$/) do |action|
    case action
      when 'approve'
        on(GoogleSignInPage).approve_access
      when 'deny'
        on(GoogleSignInPage).deny_access
    end
  end

  Then(/^I should be on (.+?)$/) do |page|
    case page
      when 'ACDCHomePage'
        on(SuperStarsHomePage)
      when 'ACDCInitialPage'
        on(SuperStarsInitialPage)
    end
  end

  Then(/^I should see an error message for invalid (.+?)$/) do |field|
    on(GoogleSignInPage).error_msg_displayed(field)
  end

  # Using dynamic steps
  When (/^I sign-in into the website$/) do

    steps %Q{
           When I click on "Sign in" button
           Then I fill the "Email" field with valid data
           When I click on "Next" button
           Then I fill the "Passwd" field with valid data
           When I click on "Log in" button
           Then I should be on ACDCInitialPage
          }

  end

