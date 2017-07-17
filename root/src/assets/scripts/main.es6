loadjs([
  '/assets/scripts/functions.js',
  '/assets/scripts/app.js',
],
{
  async: false,
  success: () => {
    ready( () => {
    })
    loadjs([
      '/assets/scripts/lazysizes.js',
      '/assets/scripts/lazysizes-plugins/ls.bgset.js',
    ],
    {
      async: false,
      success: () => {
        document.addEventListener('lazybeforeunveil', e => {
          let bg = e.target.getAttribute('data-bg')
          if (bg) {
            e.target.style.backgroundImage = 'url(' + bg + ')'
          }
          if (e.target.getAttribute('map-api-key')) {
            loadjs.ready('googlemaps',
            {
              success: () => {
              }
            })
          }
        })
      }
    })
  }
})
