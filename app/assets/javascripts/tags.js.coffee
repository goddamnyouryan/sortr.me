$(document).ready ->

  if $('.alert').length > 0
    $('.alert').delay(5000).slideUp()
    
  $('.browse-tags').change ->
    $('form#browse').submit()

  $(".draggable").live "mouseover", () ->
    $(this).draggable({
      helper: 'clone'
    });

  $('#trash').droppable({
    addClasses: false,
    over: (event, ui) ->
      $(this).css("background-color", "#D3BEBE")
    out: (event, ui) ->
      $(this).css("background-color", "#E99573")
    drop: (event, ui) ->
      type = ui.draggable.attr("data-type")
      if type == "tagging"
        taggingId = ui.draggable.attr("data-tagging-id")
        $.ajax({
          type: "DELETE",
          url: "/taggings/" + taggingId
        })
      else if type == "tag"
        confirmation = confirm("Are you sure you want to delete this tag? Doing so will also delete all of the tag on entries.")
        if confirmation == true
          tagID = ui.draggable.attr("data-tag-id")
          $.ajax({
            type: "DELETE",
            url: "/tags/" + tagID,
            async: false,
            success: () ->
              window.location = "/"
          })
      $(this).css("background-color", "#E99573")
  })

  $('ul#entries li ul li a.tag').live "click", () ->
    id = $(this).attr('id')
    id = ("'" + id + "'")
    if $('.browse-tags[value=' + id + ']').prop('checked')
      $('.browse-tags[value=' + id + ']').prop("checked", false)
    else
      $('.browse-tags[value=' + id + ']').prop("checked", true)
    $('form#browse').submit()
    return false