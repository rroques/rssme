window.RSSME.feeds.index = ->
  $('.feedName').click ->
    $('#feedNames').find('.feedName').removeClass('selected')
    $(this).addClass('selected')
    
