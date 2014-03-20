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
		 "url" => "assets/markerIcons/largeTDYellowIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		elsif ( @ratio < 0.5 && @ratio >= 0)
		marker.picture({
		 "url" => "assets/markerIcons/largeTDGreenIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		else
		marker.picture({
		 "url" => "assets/markerIcons/largeTDRedIcons/marker#{nb_colocs_supp}.png", 
		 "width" => 30,
		 "height" => 30
		})
		end
	end
  end
  
  def new
    @colocations=Colocation.where( owner: current_user.pseudo )
	@colocation=Colocation.new
	10.times {@colocation.photos.build}
	
  end
  
  def create
	@colocation=Colocation.new(params.required(:colocation).permit(:titre,:adress,:superficie,:chambre,:nbmaxcoloc,:loyer,:occupants,:description,photos_attributes: [:image]))
	@colocation.owner = current_user.pseudo
	
	if @colocation.save
		redirect_to root_path
	else
		render 'new'
	end
  end
  
  def show
    @colocation=Colocation.find(params[:id])
    @photo=@colocation.photos
    
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
  	@photos=@colocation.photos
  	@nombre = @photos.count
  	(10 - @nombre).times {@colocation.photos.build}
  	if current_user.pseudo != @colocation.owner
  	  redirect_to "/colocations/#{params[:id]}"
  	end
  end
  
  def update
    @colocation=Colocation.find(params[:id]) 
    if @colocation.update(params[:colocation].permit(:titre,:adress,:superficie,:chambre,:nbmaxcoloc,:loyer,:occupants,:description,photos_attributes: [:image,:id]))
      
      params[:colocation][:photos_attributes].each do |photo_attrs|
	  if ( photo_attrs[1]['must_be_deleted'] == "1" )
	     Photo.find(photo_attrs[1]['id']).destroy
	    end
	  end
      
      redirect_to "/colocations/#{params[:id]}"
    else
      render 'edit'
    end
  end 

  def destroy
    @colocation = Colocation.find(params[:id]).destroy
    @colocation.photos.each do |photo|
      photo.destroy
    end
    redirect_to colocations_path
  end
  
end
