window.RSSME = {}
RSSME = window.RSSME
RSSME.feeds = {}
RSSME.google_reader_imports = {}

UTIL = {
  exec: ( controller, action ) -> 
    ns = RSSME
    action = unless action then "init" else action
 
    if ns[controller]? and ns[controller][action]?
      ns[controller][action]()
 
  init: ->
    body = document.body
    controller = body.getAttribute( "data-controller" )
    action = body.getAttribute( "data-action" )
 
    UTIL.exec( "common" )
    UTIL.exec( controller )
    UTIL.exec( controller, action )
}
 
$( document ).ready UTIL.init 

