class GoogleSignInPage
	include PageObject

	button      :add_account_button, 	      :id => 'account-chooser-add-account'
	text_field  :account_user, 		          :id => 'Email'
	text_field  :account_password,  	      :id => 'Passwd'
	button      :next_button, 			        :id => 'next'
	button      :sign_in_button, 		        :id => 'signIn'
  a           :approve_superstars_access, :class => 'third_party_name_wide'
  button      :approve_button,            :id => 'submit_approve_access'
  button      :cancel_button,             :id => 'submit_deny_access'
  span        :error_msg_passwd,          :id => 'errormsg_0_Passwd'
  span        :error_msg_email,           :id => 'errormsg_0_Email'


  def log_in(field, type_data)

    if (add_account_button_element.exists?)
      add_account_button
    end

    user = YAML::load_file('config/data/data.yml')
    sleep(3)
    case field
      when 'Email'
        #wait_until(10, "ERROR: Email field did not load"){account_user_element.visible?}
        if type_data.to_s.eql?('valid')
          self.account_user = user['valid_user']['user']
        elsif type_data.to_s.eql?('not licensed')
          self.account_user = user['not_licensed']['user']
        else
          self.account_user = user['invalid_user']['user']
        end
      when 'Passwd'
        #wait_until(10, "ERROR: Password field did not load"){account_password_element.visible?}
        if type_data.to_s.eql?('valid')
          self.account_password = user['valid_user']['passwd']
        elsif type_data.to_s.eql?('not licensed')
          self.account_password = user['not_licensed']['passwd']
        else
          self.account_password = user['invalid_user']['passwd']
        end
    end
  end


  def click_on(button)
    case button
      when 'Next'
        wait_until(10, "ERROR: Next button did not load"){next_button_element.visible?}
        next_button

      when 'Log in'
        wait_until(10, "ERROR: Sign In button did not load"){sign_in_button_element.visible?}
        sign_in_button
    end
  end

  def error_msg_displayed(field)
    case field
      when 'password'
        wait_until(10, "ERROR: 'Invalid Password' message was not displayed"){error_msg_passwd_element.visible?}
      when 'email'
        wait_until(10, "ERROR: 'Invalid Email' message was not displayed"){error_msg_email_element.visible?}
    end
  end


  def wait (seconds)
    @browser.driver.manage.timeout.implicit_wait = seconds
  end

  def approve_access
    if approve_button_element.visible?
      wait_until(20, 'ERROR: Approve button is disable'){approve_button_element.enabled?}
      approve_button
    end

  end

  def deny_access
    if cancel_button_element.visible?
      wait_until(20, 'ERROR: Cancel button is disable'){cancel_button_element.enabled?}
      cancel_button
    end
  end

end