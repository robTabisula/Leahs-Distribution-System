function addStock(){

  var tableRef = document.getElementById("tbl");
  var newRow   = tableRef.insertRow(-1);

  var newCell  = newRow.insertCell(0);
  var newElem = document.createElement( 'Select' );
  newElem.setAttribute("name", "Product");
  newElem.setAttribute("type", "text");
  newCell.appendChild(newElem);

  newCell = newRow.insertCell(1);
  newElem = document.createElement( 'input' );
  newElem.setAttribute("name", "keywords");
  newElem.setAttribute("type", "number");
  newCell.appendChild(newElem);
}

 