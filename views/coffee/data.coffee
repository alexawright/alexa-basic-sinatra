# we are just going to enter the data in directly as javascript
# w/ a more complex app, we would probably load this w/ ajax

window.data = {}

data.raw = [
  {
    info:
      title: 'Graphic + Illustration'
      url: 'graphics'
    
    items: [
      {
        title: 'Mister UX'
        subtitle: 'Mr. UX Site Graphics'
        description: 'misterux.com'
        url: 'misterux'
        thumbnail: 'tnail-tools.jpg'
        images: [
          'tools.png'
          'puzzle.png'
          'monkey.png'
          'prism.png'
          'monolith-monkey.png'
        ]
      }

      {
        title: 'T by Alexander Wang Grid Print'
        subtitle: 'Rubber Screenprinted Grid Design'
        description: 'Primary print for Resort 2014 Collection.'
        url: 'wanggrid'
        thumbnail: 'tnail-wang.jpg'
        images: [
          'wang_01.jpg'
          'wang_03.jpg'
          'wang_02.jpg'
          'wang_d01.png'
          'wang_d03.png'
          'wang_d04.png'
        ]
      }

      {
        title: 'Zana Bayne Size Chart'
        subtitle: 'Size Chart Figures'
        description: ''
        url: 'zbsizeschart'
        thumbnail: 'tnail-zbsizechart.jpg'
        images: [
          'sizing-figures.png'
          'zanasite.png'
        ]
      }

      {
        title: 'Zana Bayne Leather'
        subtitle: 'Packaging Tape'
        description: 'Right photo from Miss Zana Bayne\'s instagram.'
        url: 'zana'
        thumbnail: 'tnail-zanatape.jpg'
        images: [
          'zbtape.png'
          'zana-tape-1.png'
          'zana-tape-2.jpeg'
        ]
      }

    ]
  }

  {
    info:
      title: 'Fashion'
      url: 'fashion'
    
    items: [
      {
        title: 'Screenprinted Pillows'
        subtitle: 'Organic Thread Print'
        description: 'stuff'
        url: 'stuff'
        thumbnail: 'tnail-tools.jpg'
        images: [
          'tools.png'
          'puzzle.png'
          'monkey.png'
          'prism.png'
          'monolith-monkey.png'
        ]
      }
    ]
  }

  {
    info:
      title: 'Play'
      url: 'play'
    
    items: [
      {
        title: 'Play'
        subtitle: 'Organic Thread Print'
        description: 'stuff'
        url: 'stuff'
        thumbnail: 'tnail-tools.jpg'
        images: [
          'tools.png'
          'puzzle.png'
          'monkey.png'
          'prism.png'
          'monolith-monkey.png'
        ]
      }
    ]
  }

  {
    info:
      title: 'Web Design'
      url: 'web'
    
    items: [
      {
        title: 'Web Design'
        subtitle: 'Organic Thread Print'
        description: 'stuff'
        url: 'stuff'
        thumbnail: 'tnail-tools.jpg'
        images: [
          'tools.png'
          'puzzle.png'
          'monkey.png'
          'prism.png'
          'monolith-monkey.png'
        ]
      }
    ]
  }
]

data.collections = for c in data.raw
  collection = new Backbone.Collection(c.items)
  collection.attributes = c.info
  collection 