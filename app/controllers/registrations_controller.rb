class RegistrationsController < Devise::RegistrationsController
	def new
		@user=User.new
	end
	def create
		@user=User.new(params[:user].permit(:pseudo,:email,:password,:user,:nom,:prenom))
		@user.sexe = params[:sexe]
		@user.ddn = params[:date]
		if @user.save
			redirect_to root_path
		else
			render 'new'
		end
	end
end
