function getAllSiblings(el) {
    var sibs = new Array();
	//Get next siblings
	var nextSibling = el.nextElementSibling;
	while(nextSibling != null) {
		sibs.push(nextSibling);
		nextSibling = nextSibling.nextElementSibling;
	}
	
	//Get previous siblings
	var sibling = el.previousElementSibling;
	while(sibling != null) {
		sibs.push(sibling);
		sibling = sibling.previousElementSibling;
	}
	return sibs;
}

function getParent(el) {
  do {
    el = el.parentElement;	
    if (el.tagName.toLowerCase() == 'li') {
      return el;
    }
  } while (el.parentElement)
	return null;
}

function hideChildren(elem) {
    for(var i = 0; i < elem.length; i++) {
		var rows = elem[i].getElementsByTagName('ul');
		for(var j = 0; j < rows.length; j++) {
			var row = rows[j];
			row.className = "hidden";
		}	
	}
}

function hideSiblings(elem) {
    for(var i = 0; i < elem.length; i++) {
		elem[i].className = "hidden";
	}
}