Rssme = window.Rssme
attr = DS.attr

Rssme.Item = DS.Model.extend {
  title: attr('string')
}


Rssme.Item.FIXTURES = [
  {
    id: 4,
    title: 'remi',
    selected: false
  },
  {
    id: 5,
    title: 'roques',
    selected: false
  },
  {
    id: 6,
    title: 'remi2',
    selected: false
  },
  {
    id: 7,
    title: 'roques2',
    selected: false
  }
]
