class ComptesController < ApplicationController
  def index
	@colocation=Colocation.where( owner: current_user.pseudo )
  end

  def show
    @colocation=Colocation.find(params[:id])  
  end
end
