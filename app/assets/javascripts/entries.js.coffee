$(document).ready ->

  $('.browse-tags').each ->
    $(this).prop("checked", false)

  $('a#new-tag').click ->
    if $('div#new-tag').is(":hidden")
      if $('div#new-entry').is(":hidden")
        $('div#new-tag').slideDown()
      else
        $('div#new-entry').slideUp()
        $('div#new-tag').slideDown()
    else
      $('div#new-tag').slideUp()
    return false

  $('a#new-entry').click ->
    if $('div#new-entry').is(":hidden")
      if $('div#new-tag').is(":hidden")
        $('div#new-entry').slideDown()
      else
        $('div#new-tag').slideUp()
        $('div#new-entry').slideDown()
    else
      $('div#new-entry').slideUp()
    return false

  $('input#search').keyup ->
    if $(this).val().length > 0
      $('a#clear').show()
    else
      $('a#clear').hide()
    $.ajax({
      url: "search?input=" + $(this).val()
    })

  $('a#clear').click ->
    $('input#search').val("")
    $('a#clear').hide()
    $('form#browse').submit()
    return false
