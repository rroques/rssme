window.RSSME.feeds.index = ->

  feedNames = $('#feedNames').find('.feedName')
  $('.feedName').click ->
    feedNames.removeClass('selected')
    $(this).addClass('selected');
    
  feedNames.find('.linkToFeed').get(0).click()

  $('#markAllRead').click ->
    feed_id = $('#feedNames').find('.feedName.selected input.feedID').val()
    $.ajax({
      type: 'POST',
      url: "feeds/#{feed_id}/markAllRead",
      async: true,
      success: (data) ->
        eval(data)
    })

  $('#editFeed').click (e) ->
    url = $(this).attr('href')
    dialog_form = $('<div id="dialog-form">Loading form...</div>').dialog {
      autoOpen: false,
      width: 520,
      modal: true,
      open: -> $(this).load(url + ' #content') ,
      close: -> $('#dialog-form').remove()
    }
    dialog_form.dialog 'open'
    e.preventDefault()

