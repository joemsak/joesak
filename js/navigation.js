var eachItem = function(items, callback) {
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

navClick = function(e) {
  e.preventDefault();
  var active_item = document.querySelectorAll('nav a.active')[0];
  removeClass(active_item, 'active');
  addClass(e.target, 'active');
  getRemoteContent(e.target.getAttribute('href'));
};

var nav_items = document.querySelectorAll('nav a');

eachItem(nav_items, function(item) {
  item.addEventListener('click', navClick);
  if (item.href === location.href.slice(0, -1) ||
       (item.href == '/welcome' && location.pathname == '/'))
    addClass(item, 'active');
});
