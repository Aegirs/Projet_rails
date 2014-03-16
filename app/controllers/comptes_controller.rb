class ComptesController < ApplicationController
  def index
	
  end

  def show
    @colocation=Colocation.find(params[:id])  
  end
end
