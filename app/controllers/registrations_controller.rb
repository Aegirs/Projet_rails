class RegistrationsController < Devise::RegistrationsController
	def new
		@user=User.new
	end
	
	def create
		@user=User.new(params[:user].permit(:pseudo,:email,:password,:user,:nom,:prenom,:avatar))
		@user.sexe = params[:sexe]
		@user.ddn = params[:date]
		if @user.save
			redirect_to root_path
		else
			render 'new'
		end
	end
	
	def edit
		@user=current_user
	end
	
	def update 
		@user=current_user
		
		if @user.update(params[:user].permit(:pseudo,:email,:password,:user,:nom,:prenom,:avatar))
			redirect_to "/users/edit"
		else
			render 'edit'
		end
	end
	
end
