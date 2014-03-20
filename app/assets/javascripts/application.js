// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require underscore
//= require gmaps/google
//= require_tree .

$(document).on("ready",function(){
	var id=0,id2=11, i=0,nb_click=0;
	$(".jumbotron").css("padding-bottom","0px");
	$(".jumbotron").css("padding-top","0px");
	for(i=1;i <10;i++) {
		$('#colocation_photos_attributes_'+(i)+'_image').css("display","none");
		$('#colocation_photos_attributes_'+(i+10)+'_image').css("display","none");
	}
	$("div[name^='suppression']").css("display","none");
    $('#ajoutcoloc').click(function(e){
      e.preventDefault();
      if ($('#ajoutcoloc2').is(':hidden')){
        $('#ajoutcoloc2').slideDown('500');
        
      }
      else{
        $('#ajoutcoloc2').slideUp('300');
      }
    });
    
    $('#ajout').click(function(e){
      e.preventDefault();
      
      if ( id < 9 ) {
		  id=id+1;
		  id2=id2+1;
	  }
	  $('#colocation_photos_attributes_'+id+'_image').slideDown('500');
	  $('#colocation_photos_attributes_'+id+'_image').css("display","block");
	  
	  if ( id == 9 ) {
		$('#ajout').hide();
		$('#fin').css("display","block");
	  }
    });
    
     $('#ajout_edit').on("click",function(e){
		e.preventDefault();
		console.log($("img").length);
		var id3 = $("img").length + id2 + nb_click;
		console.log(id3); 
		$('#colocation_photos_attributes_'+id3+'_image').slideDown('500');
		$('#colocation_photos_attributes_'+id3+'_image').css("display","block");
		nb_click=nb_click+1;		
	 });
	
   $("div").mouseleave(function(e) {
	    e.preventDefault();
		$("div[name=suppression]").slideUp('500');
   });
   $("img").mouseenter(function(e) {
		var numero = this.id;
	    e.preventDefault();
	    console.log(numero);
		$('div').each(function() {
			if ( (this).id == numero ) {
				$(this).slideDown('300');
			}
		});		
   });
});
