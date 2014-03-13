class ColocationsController < ApplicationController
  def index	
	@colocation=Colocation.all
    @hash = Gmaps4rails.build_markers(@colocation) do |colocation, marker|
		marker.lat colocation.latitude
		marker.lng colocation.longitude
		marker.infowindow colocation.description
		marker.json({titre: colocation.titre})
<<<<<<< HEAD
		nb_colocs_supp = colocation.nbmaxcoloc.to_i - colocation.occupants.to_i
		if (colocation.occupants.to_f/colocation.nbmaxcoloc.to_f >= 0.5)
		marker.picture({
		 "url" => "/assets/markerIcons/largeTDYellowIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		elsif (colocation.occupants.to_f/colocation.nbmaxcoloc.to_f < 0.5 && colocation.occupants.to_f/colocation.nbmaxcoloc.to_f > 0)
		marker.picture({
		 "url" => "/assets/markerIcons/largeTDGreenIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		else
		marker.picture({
		 "url" => "/assets/markerIcons/largeTDRedIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		end
=======
		
		marker.picture({
		 "url" => "/assets/markerIcons/largeTDGreenIcons/blank.png", 
		 "width" => 36,
		 "height" => 36
		})
>>>>>>> 9e1b7cc9170d79e311352bdb51af80c736d9faf2
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
<<<<<<< HEAD
 def edit
  	@colocation=Colocation.find(params[:id])
  end
  def update
    @colocation=Colocation.find(params[:id])
    if @colocation.update(params[:colocation].permit(:titre,:adress,:superficie,:chambre,:nbmaxcoloc,:loyer,:occupants,:description))
      redirect_to "/colocations"
    else
      render 'edit'
    end
  end 
=======
>>>>>>> 9e1b7cc9170d79e311352bdb51af80c736d9faf2
end
