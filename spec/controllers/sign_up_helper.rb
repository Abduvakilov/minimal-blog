module SignUpHelper
	def sign_up
    @email    = "abcd@example.com"
    @password = "password"
    first_name = (0...6).map { (65 + rand(26)).chr }.join # for random String
    last_name  = (0...6).map { (65 + rand(26)).chr }.join
		visit 'users/sign_up'
		fill_in 'user_first_name', with: first_name
		fill_in 'user_last_name',  with: last_name
		fill_in 'user_email',      with: @email
		fill_in 'user_password',   with: @password
		fill_in 'user_password_confirmation', with: @password
		click_button 'Sign up'
	end

end
