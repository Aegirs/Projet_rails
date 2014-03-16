class ComptesController < ApplicationController
  def index
	@users=current_user
  end

  def show
    @colocation=Colocation.find(params[:id])  
  end
end
