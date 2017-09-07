let passiveSupported = false;

try {
  let options = Object.defineProperty({}, 'passive', {
    get: () => {
      passiveSupported = true
    }
  })
  window.addEventListener('test', null, options);
} catch(err) {}

let padLeft = (str , n, pad) => {
  return Array(n - str.length + 1).join(pad || '0') + str
}

let padRight = (str , n, pad) => {
  return str + Array(n - str.length + 1).join(pad || '0')
}

// Toggle Class `name` on `element(s)`.
let toggleClass = (className, el) => {
  if (typeof el === 'object' && el.tagName) {
    if (el.classList) {
      el.classList.toggle(className)
    } else {
      let classes = el.className.split(' ')
      let existingIndex = classes.indexOf(className)

      if (existingIndex >= 0)
        classes.splice(existingIndex, 1)
      else
        classes.push(className)

      el.className = classes.join(' ')
    }
  } else if (typeof el === 'object') {
    Object.keys(el).forEach(i => {
      toggleClass(className, el[i])
    })
  }
}

// Add Class `name` to `element(s)`.
let addClass = (className, el) => {
  if (typeof el === 'object' && el.tagName) {
    if (el.classList)
      el.classList.add(className)
    else
      el.className += ' ' + className
  } else if (typeof el === 'object') {
    Object.keys(el).forEach(i => {
      addClass(className, el[i])
    })
  }
}

// Remove Class `name` from `element(s)`.
let removeClass = (className, el) => {
  if (typeof el === 'object' && el.tagName) {
    if (el.classList)
      el.classList.remove(className)
    else
      el.className = el.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ')
  } else if (typeof el === 'object') {
    Object.keys(el).forEach(i => {
      removeClass(className, el[i])
    })
  }
}

// Has Class `name` on `element`?
let hasClass = (className, el) => {
  if (el.classList)
    return el.classList.contains(className)
  else
    return new RegExp('(^| )' + className + '( |$)', 'gi').test(el.className)
}

let matchHeight = selector => {
  let heights = {}
  let elements = [...document.querySelectorAll(selector)]
  elements.forEach(el => {
    let top = el.getBoundingClientRect().top
    el.style.height = ''
    if (heights[top] === undefined || el.offsetHeight > heights[top]) {
      heights[top] = el.offsetHeight
    }
  })
  elements.forEach(el => {
    let top = el.getBoundingClientRect().top
    el.style.height = heights[top] + 'px'
  })
}

let masonry = (wrapper, item) => {
  var cardsEls = [...document.querySelectorAll(wrapper)]
  cardsEls.forEach(cardsEl => {
    let cards = cardsEl.querySelectorAll(item)
    let parentRect = cardsEl.getBoundingClientRect()
    let cardsX = {}
    Object.keys(cards).forEach(c => {
      let card = cards[c]
      card.style.marginTop = ''
      let left = card.getBoundingClientRect().left
      if (!(left in cardsX)) cardsX[left] = []
      cardsX[left].push(card)
    })
    Object.keys(cardsX).forEach(x => {
      let currentHeight = 0
      Object.keys(cardsX[x]).forEach(n => {
        let card = cardsX[x][n]
  	  let computedStyle = window.getComputedStyle(card)
        let rect = card.getBoundingClientRect()
        let marginFix = (rect.top - parentRect.top) - currentHeight
  	  if (marginFix > 0) card.style.marginTop = -marginFix + 'px'
        currentHeight += rect.height + parseInt(computedStyle.marginBottom)
      })
    })
  })
}

// Throttle a function to only run every `XX` milliseconds.
let throttle = (delay, callback) => {
  let previousCall = new Date().getTime()
  return function() {
    let time = new Date().getTime()
    if ((time - previousCall) >= delay) {
      let context = this
      previousCall = time
      callback.apply(context, arguments)
    }
  }
}

// Bounce a function until calls have stopped for `XX` milliseconds
// Good for window resize only call function once the user had stopped resizing the window.
let debounce = (delay, callback) => {
  let timeout = null
  return function() {
    if (timeout) {
      clearTimeout(timeout);
    }
    let context = this
    let args = arguments
    timeout = setTimeout(() => {
      callback.apply(context, args)
      timeout = null
    }, delay)
  }
}

// Ajax get request on a url.
let get = (url, onload, onerror = () => {}) => {
  var request = new XMLHttpRequest()
  request.open('GET', url, true)
  request.onload = onload
  request.onerror = onerror
  request.send()
}

// Does this `el` match this `query selector`
let matches = (el, selector) => {
  return (el.matches || el.matchesSelector || el.msMatchesSelector || el.mozMatchesSelector || el.webkitMatchesSelector || el.oMatchesSelector).call(el, selector)
}

// Get closest parent element matching `query` starting at `element`
let closest = (query, el) => {
  if (el && el.parentNode != document) {
    if (matches(query, el.parentNode)) {
      return el.parentNode
    } else {
      return closest(query, el.parentNode)
    }
  }
}

// Document ready function.
let ready = fn => {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

let getActiveIndex = els => {
  let activeIndex = -1
  Object.keys(els).forEach(i => {
    if (els[i].classList.contains('active')) {
      activeIndex = i
    }
  })
  return parseInt(activeIndex)
}

/*
 * TODO: Add nesting.
 */
let query = (selector, context) => {
    context = context || document
    // Redirect simple selectors to the more performant function
    if (/^(#?[\w-]+|\.[\w-.]+)$/.test(selector)) {
        switch (selector.charAt(0)) {
            case '#':
                // Handle ID-based selectors
                return [...context.getElementById(selector.substr(1))]
            case '.':
                // Handle class-based selectors
                // Query by multiple classes by converting the selector
                // string into single spaced class names
                var classes = selector.substr(1).replace(/\./g, ' ')
                return [...context.getElementsByClassName(classes)]
            default:
                // Handle tag-based selectors
                return [...context.getElementsByTagName(selector)]
        }
    }
    // Default to `querySelectorAll`
    return [...context.querySelectorAll(selector)]
}

let getImageBrightness = (imageSrc, callback) => {
    var img = document.createElement("img")
    img.src = imageSrc
    img.style.display = "none"
    document.body.appendChild(img)

    var colorSum = 0

    img.onload = function() {
        // create canvas
        var canvas = document.createElement("canvas")
        canvas.width = this.width
        canvas.height = this.height

        var ctx = canvas.getContext("2d")
        ctx.drawImage(this,0,0)

        var imageData = ctx.getImageData(0,0,canvas.width,canvas.height)
        var data = imageData.data
        var r,g,b,avg

          for(var x = 0; x < data.length; x+=4) {
            r = data[x]
            g = data[x+1]
            b = data[x+2]

            avg = Math.floor((r+g+b)/3)
            colorSum += avg
        }

        var brightness = Math.floor(colorSum / (this.width*this.height))
        callback(brightness)
    }
}
