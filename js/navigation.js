(function(window,undefined){
  var navItems = document.querySelectorAll('nav a'),
      originalTitle = document.title,
      History = window.History,

  eachItem = function(items, callback) {
    Array.prototype.forEach.call(items, function(item, i){
      callback(item);
    });
  },

  addClass = function(el, className) {
    if (el.classList !== undefined)
      el.classList.add(className);
    else
      el.className += ' ' + className;
  },

  removeClass = function(el, className) {
    if (el !== undefined && el.classList !== undefined) {
      el.classList.remove(className);
    } else if (el !== undefined) {
      el.className = el.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
    }
  },

  displayContent = function(req) {
    var titleContainer = document.getElementById('title'),
        bodyContainer  = document.getElementById('body'),
        data = JSON.parse(req.response);

    titleContainer.innerHTML = data.title;
    bodyContainer.innerHTML  = data.body;
  },

  unescapeHTML = function(str) {
    return str.replace(/&#(\d+);/g, function (m, n) {
      return String.fromCharCode(n);
    });
  },

  updateHistory = function(url, title) {
    title = unescapeHTML(title + ' &#8211; ' + originalTitle);
    History.pushState(null, title, url);
  },

  displayPage = function(url, title) {
    if(isAtHome(url)) url += 'index';
    sendRequest(url + '.json', displayContent);
    setActiveItem(url);
  },

  formatURL = function(url) {
    if(url === '/') return url;
    if(url.match(/\/$/) !== null)
      return url.slice(0, -1);
    return url;
  },

  isAtHome = function(url) {
    var urlParts = url.split('/');
    return urlParts[urlParts.length - 1] === ""  && location.pathname == '/';
  },

  setActiveItem = function(url) {
    var activeItem = document.querySelectorAll('nav .active')[0];
    url = formatURL(url);

    removeClass(activeItem, 'active');

    eachItem(navItems, function(item) {
      var href = item.href;
      if (href === url || isAtHome(href))
        addClass(item, 'active');
    });
  },

  navClick = function(e) {
    e.preventDefault();
    var url = e.target.href,
        title = e.target.getAttribute('title');
    updateHistory(url, title);
  };

  eachItem(navItems, function(item) {
    item.addEventListener('click', navClick);
  });

  History.Adapter.bind(window, 'statechange', function () {
    var state = History.getState();
    displayPage(state.url, state.title);
  });

  setActiveItem(location.href);
})(window);
