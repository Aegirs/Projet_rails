class ComptesController < ApplicationController
  def index
	@users=current_user
	@colocations=Colocation.where(owner: current_user.pseudo)
  end

  def show
    @colocation=Colocation.find(params[:id]) 
	end
end
