$(document).ready ->

  $(".droppable").live "mouseover", () ->
    $(this).droppable({
      addClasses: false,
      drop: (event, ui) ->
        tagId = ui.draggable.attr("id")
        entryId = $(this).attr("id")
        $.ajax({
          type: "POST",
          url: "/taggings",
          data: { tag: tagId, entry: entryId }
        })
    });