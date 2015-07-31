class SignInPage
	include PageObject

	button      :add_account_button, 	      :id => 'account-chooser-add-account'
	text_field  :account_user, 		          :id => 'Email'
	text_field  :account_password,  	      :id => 'Passwd'
	button      :next_button, 			        :id => 'next'
	button      :sign_in_button, 		        :id => 'signIn'
  a           :approve_superstars_access, :class => 'third_party_name_wide'
  button      :approve_button,            :id => 'submit_approve_access'
  button      :cancel_button,             :id => 'submit_deny_access'


  def log_in(field, type_data)
    user = YAML::load_file('config/data/data.yml')

    case field
      when 'Email'
        if type_data.to_s.eql?('valid')
          self.account_user = user['valid_user']['user']
        else
          self.account_user = user['invalid_user']['user']
        end
      when 'Passwd'
        if type_data.to_s.eql?('valid')
          self.account_password = user['valid_user']['passwd'].to_s
        else
          self.account_password = user['invalid_user']['passwd']
        end
    end
  end


  def wait (seconds)
    @browser.driver.manage.timeout.implicit_wait = seconds
  end

  def approve_access
    if approve_superstars_access?
      approve_button
    end

  end

  def deny_access
    if approve_superstars_access?
      deny_access
    end
  end

end