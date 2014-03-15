class ColocationsController < ApplicationController
  before_filter :authenticate_user!, except: [:index,:show]
  
  def index	
	@colocation=Colocation.all
    @hash = Gmaps4rails.build_markers(@colocation) do |colocation, marker|
		marker.lat colocation.latitude
		marker.lng colocation.longitude
		marker.infowindow colocation.description
		marker.json({titre: colocation.titre})
		nb_colocs_supp = colocation.nbmaxcoloc.to_i - colocation.occupants.to_i
		@ratio = colocation.occupants.to_f/colocation.nbmaxcoloc.to_f
		if ( @ratio >= 0.5 && @ratio < 1)
		marker.picture({
		 "url" => "/assets/markerIcons/largeTDYellowIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		elsif ( @ratio < 0.5 && @ratio >= 0)
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
	end
  end
  
  def new
	@colocation=Colocation.new
  end
  
  def create
	@colocation=Colocation.new(params[:colocation].permit(:titre,:adress,:superficie,:chambre,:nbmaxcoloc,:loyer,:occupants,:description))
	@colocation.owner = current_user.pseudo
	if @colocation.save
		redirect_to root_path
	else
		render 'new'
	end
  end
  
  def show
    @colocation=Colocation.find(params[:id])
    @nb_colocs_supp = @colocation.nbmaxcoloc.to_i - @colocation.occupants.to_i
    @hash = Gmaps4rails.build_markers(@colocation) do |colocation, marker|
		marker.lat colocation.latitude
		marker.lng colocation.longitude
		marker.infowindow colocation.description
		marker.json({titre: colocation.titre})
		nb_colocs_supp = colocation.nbmaxcoloc.to_i - colocation.occupants.to_i
		@ratio = colocation.occupants.to_f/colocation.nbmaxcoloc.to_f
		if ( @ratio >= 0.5 && @ratio < 1)
		marker.picture({
		 "url" => "/assets/markerIcons/largeTDYellowIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		elsif ( @ratio < 0.5 && @ratio >= 0)
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
	end
  end
 def edit
  	@colocation=Colocation.find(params[:id])
  	if current_user.pseudo != @colocation.owner
  	  redirect_to "/colocations/#{params[:id]}"
  	end
  end
  def update
    @colocation=Colocation.find(params[:id])
    if @colocation.update(params[:colocation].permit(:titre,:adress,:superficie,:chambre,:nbmaxcoloc,:loyer,:occupants,:description))
      redirect_to "/colocations"
    else
      render 'edit'
    end
  end 
  def destroy
    @colocation = Colocation.find(params[:id]).destroy
    redirect_to "/colocations"
  end
end
