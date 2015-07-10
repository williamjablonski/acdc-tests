module SuperStars
	class SignInPage
		include PageObject

		link :add_account_button, 	:id => 'account-chooser-add-account'
		input :account_user, 		:id => 'Email'
		input :account_password, 	:id => 'Passwd'
		input :next_button, 		:id => 'next'
		input :sign_in_button, 		:id => 'signIn'


	end
end