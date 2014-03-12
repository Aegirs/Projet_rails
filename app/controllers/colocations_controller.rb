class ColocationsController < ApplicationController
  def index	
	@colocation=Colocation.all
    @hash = Gmaps4rails.build_markers(@colocation) do |colocation, marker|
		marker.lat colocation.latitude
		marker.lng colocation.longitude
		marker.infowindow colocation.description
		marker.json({titre: colocation.titre})
		
	end
  end
  
  def new
	@colocation=Colocation.new
  end
  
  def create
	@colocation=Colocation.new(params[:colocation].permit(:titre,:adress,:superficie,:chambre,:nbmaxcoloc,:loyer,:occupants,:description))
	
	if @colocation.save
		redirect_to root_path
	else
		render 'new'
	end
  end
  
  def show
    @colocation=Colocation.find(params[:id])
    @nb_colocs_supp = @colocation.nbmaxcoloc.to_i - @colocation.occupants.to_i
  end
end
