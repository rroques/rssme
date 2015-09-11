Rssme = window.Rssme
attr = DS.attr

Rssme.Feed = DS.Model.extend {
  name: attr('string'),
  items: DS.hasMany('Rssme.Item')
}

Rssme.Feed.FIXTURES = [
 {
   id: 1,
   name: 'Learn Ember.js',
   items: [ 4, 5]
 },
 {
   id: 2,
   name: '...',
   items: [6]
 },
 {
   id: 3,
   name: 'Profit!',
   items: [7]
 }
]

