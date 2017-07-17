let padLeft = (str , n, pad) => {
  return Array(n - str.length + 1).join(pad || '0') + str
}

let padRight = (str , n, pad) => {
  return str + Array(n - str.length + 1).join(pad || '0')
}

let toggleClass = (el, className) => {
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

let hasClass = (className, el) => {
  if (el.classList)
    return el.classList.contains(className)
  else
    return new RegExp('(^| )' + className + '( |$)', 'gi').test(el.className)
}

let matchHeight = selector => {
  let heights = {}
  let elements = document.querySelectorAll(selector)
  Object.keys(elements).forEach( k => {
    let el = elements[k]
    let top = el.getBoundingClientRect().top
    el.style.height = ''
    if (heights[top] === undefined || el.offsetHeight > heights[top]) {
      heights[top] = el.offsetHeight
    }
  })
  Object.keys(elements).forEach( k => {
    let el = elements[k]
    let top = el.getBoundingClientRect().top
    el.style.height = heights[top] + 'px'
  })
}

let masonry = (wrapper, item) => {
  var cardsEls = document.querySelectorAll(wrapper)
  Object.keys(cardsEls).forEach(i => {
    let cardsEl = cardsEls[i]
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

let get = (url, onload, onerror = () => {}) => {
  var request = new XMLHttpRequest()
  request.open('GET', url, true)
  request.onload = onload
  request.onerror = onerror
  request.send()
}

let matches = (el, selector) => {
  return (el.matches || el.matchesSelector || el.msMatchesSelector || el.mozMatchesSelector || el.webkitMatchesSelector || el.oMatchesSelector).call(el, selector)
}

let closest = (query, el) => {
  if (el) {
    if (matches(el.parentNode, query)) {
      return el.parentNode
    } else {
      return closest(query, el.parentNode)
    }
  }
}

let ready = fn => {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}
