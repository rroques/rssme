window.RSSME.feeds.index = ->

  feedNames = $('#feedNames').find('.feedName')
  $('.feedName').click ->
    feedNames.removeClass('selected')
    $(this).addClass('selected')
    
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

