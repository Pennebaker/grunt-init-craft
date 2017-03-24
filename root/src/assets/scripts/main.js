let toggleClass = (el, className) => {
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
}

let addClass = (className, el) => {
  if (el.classList)
    el.classList.add(className)
  else
    el.className += ' ' + className
}

let removeClass = (className, el) => {
  if (el.classList)
    el.classList.remove(className)
  else
    el.className = el.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
}

let hasClass = (className, el) => {
  if (el.classList)
    return el.classList.contains(className)
  else
    return new RegExp('(^| )' + className + '( |$)', 'gi').test(el.className)
}

let throttle = (delay, callback) => {
    var previousCall = new Date().getTime()
    return function() {
        var time = new Date().getTime()
        if ((time - previousCall) >= delay) {
            previousCall = time
            callback.apply(null, arguments)
        }
    }
}

let debounce = (delay, callback) => {
    var timeout = null
    return function() {
        if (timeout) {
            clearTimeout(timeout);
        }
        var args = arguments
        timeout = setTimeout(() => {
            callback.apply(null, args)
            timeout = null
        }, delay)
    }
}

let ready = fn => {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}

ready( () => {
  window.addEventListener('scroll', throttle(200, e => {
  }))
  window.addEventListener('scroll', debounce(200, e => {
  }))
})
