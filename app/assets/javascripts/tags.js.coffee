$(document).ready ->
	
	$('.browse-tags').change ->
		$('form#browse').submit()
	
	dragAndDrop = () ->
		$(".draggable").draggable({
			helper: 'clone'
		});

		$( ".droppable" ).droppable({
			drop: (event, ui) ->
				tagId = ui.draggable.attr("id")
				entryId = $(this).attr("id")
				$.ajax({
				  url: "retag?tag=" + tagId + "&entry=" + entryId
				})
		});
	
	dragAndDrop()