window.RSSME.feeds.index = ->

  feedNames = $('#feedNames').find('.feedName')
  $('.feedName').click ->
    feedNames.removeClass('selected')
    $(this).addClass('selected')
    
  feedNames.find('.linkToFeed:first').click()
    