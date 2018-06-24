if (!Array.prototype.includes) {
  Object.defineProperty(Array.prototype, 'includes', {
    value: function(searchElement, fromIndex) {
      if (this == null) {
        throw new TypeError('"this" is null or not defined');
      }
      var o = Object(this);
      var len = o.length >>> 0;
      if (len === 0) {
        return false;
      }
      var n = fromIndex | 0;
      var k = Math.max(n >= 0 ? n : len - Math.abs(n), 0);
      while (k < len) {
        if (o[k] === searchElement) {
          return true;
        }
        k++;
      }
      return false;
    }
  });
}

function cfcbShowAll(tagname) {
  var users = $('input[name="' + tagname + '"]');
  for (var i = 0, len = users.length-1; i < len; i++) {
    users[i].parentElement.style.display = "block";
  }
}
  
function cfcbShowChecked(tagname) {
  var users = $('input[name="' + tagname + '"]');
  for (var i = 0, len = users.length-1; i < len; i++) {
    if(users[i].checked) {
      users[i].parentElement.style.display = "block";
    }
    else{
      users[i].parentElement.style.display = "none";
    }
  }
}
  
function cfcbCheckAll(tagname) {
  var users = $('input[name="' + tagname + '"]');
  for (var i = 0, len = users.length-1; i < len; i++) {
    users[i].checked = true;
  }
  cfcbShowAll(tagname);
}
  
function cfcbUncheckAll(tagname) {
  var users = $('input[name="' + tagname + '"]');
  for (var i = 0, len = users.length-1; i < len; i++) {
    users[i].checked = false;
  }
}

function cfcbFilter(tagname) {
  var users = $('input[name="' + tagname + '"]');
  var filter = $('input[name="filter_' + tagname + '"]');
  for (var i = 0, len = users.length-1; i < len; i++) {
    regexp = new RegExp(filter[0].value, 'i');
    if(users[i].parentNode.textContent.match(regexp)) {
      users[i].parentElement.style.display = "block";
    } else {
      users[i].parentElement.style.display = "none";
    }
  }
}

function cfcbGroupAll(tagname, check) {
  var users = $('input[name="' + tagname + '"]');
  var groupuserids = $('[name="group_' + tagname + '"]').val().split(','); 
  for (var i = 0, len = users.length-1; i < len; i++) {
    if(groupuserids.includes(users[i].value) ) {
      users[i].checked = check;
    }
  }
  cfcbShowAll(tagname);
}

function cfcbCheckGroupAll(tagname) {
  cfcbGroupAll(tagname, true)
}
  
function cfcbUncheckGroupAll(tagname) {
  cfcbGroupAll(tagname, false)
}

function cfcbGroupChanged(tagname) {
  var users = $('input[name="' + tagname + '"]');
  var groupselect = $('[name="group_' + tagname + '"]');
  if (groupselect.length > 0) {
    var groupuserids = groupselect.val().split(','); 
    for (var i = 0, len = users.length-1; i < len; i++) {
      if(groupuserids.includes(users[i].value) ) {
        users[i].parentElement.style.color = "blue";
      } else {
        users[i].parentElement.style.color = "";
      }
    }
  }
}
  