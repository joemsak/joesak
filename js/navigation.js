var nav_items = document.querySelectorAll('nav a'),

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

getRemoteContent = function(href) {
  var xhr = new XMLHttpRequest();
  xhr.open("get", href, true);
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4)
      displayContent(xhr.response);
  };
  xhr.send();
},

displayContent = function(html) {
  var container = document.getElementById('content'),
      parser = new DOMParser(),
      doc = parser.parseFromString(html, 'text/html'),
      content = doc.getElementById('content').innerHTML;
  container.innerHTML = content;
},

updateHistory = function(url) {
  history.pushState(null, null, url);
},

displayPage = function(url) {
  url = url || location.href;
  getRemoteContent(url);
  updateHistory(url);
  setActiveItem();
},

setActiveItem = function() {
  var active_item = document.querySelectorAll('nav a.active')[0],
      url = location.href;

  if(url.match(/\/$/) !== null) {
    url = url.slice(0, -1);
  }

  removeClass(active_item, 'active');

  eachItem(nav_items, function(item) {
    var href = item.href;
    if (href === url || (href == '/welcome' && location.pathname == '/')) {
      addClass(item, 'active');
    }
  });
},

navClick = function(e) {
  e.preventDefault();
  var url = e.target.getAttribute('href');
  displayPage(url);
};

eachItem(nav_items, function(item) {
  item.addEventListener('click', navClick);
});

window.addEventListener("popstate", function(e) {
  displayPage();
});

setActiveItem();
