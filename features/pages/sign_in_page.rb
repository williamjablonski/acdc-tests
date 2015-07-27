class SignInPage
	include PageObject

	button  :add_account_button, 	:id => 'account-chooser-add-account'
	text_field :account_user, 		:id => 'Email'
	text_field :account_password, 	:id => 'Passwd'
	button :next_button, 			:id => 'next'
	button :sign_in_button, 		:id => 'signIn'

end