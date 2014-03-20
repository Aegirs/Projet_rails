/**$(document).on("ready",function () {		
		$(".photo-delete").on("click",function (e) {
			e.preventDefault();
			console.log($(this).data("id"));
			$(this).attr("data-del","true");
		});
		
		$(".edit_colocation").on("submit",function() {
				$(".photo-delete[data-del]").data("id");
				$('.colocation_deleted_photos').val(photoIds.join(','));
		});


});

$(this).data("id")**/
