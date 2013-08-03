window.RSSME.feeds.index = ->

  feedNames = $('#feedNames').find('.feedName')
  $('.feedName').click ->
    feedNames.removeClass('selected')
    $(this).addClass('selected');
    
  feeds = feedNames.find('.linkToFeed:first').click()

  $('#addFeed').tooltip()

  
