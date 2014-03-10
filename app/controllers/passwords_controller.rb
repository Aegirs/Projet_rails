class PasswordsController < Devise::PasswordsController

def new
	@user = current_user
end
def create
	@user = current_user
	mail(:to => @user.email, :subject => "Welcome to moku!")
end

end
