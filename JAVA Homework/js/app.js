// from data.js
var tableData = data;
var tbody = d3.select("tbody");

// table references
function buildTable(data) {
 // Clear existing data
 tbody.html("");

 // Loop through objects. Append rows and cells for each value
 data.forEach((dataRow) => {
   // Append row to table
   var row = tbody.append("tr");

   // Loop through field in the dataRow and add each value as a table cell (td)
   Object.values(dataRow).forEach((val) => {
     var cell = row.append("td");
     cell.text(val);
   });
 });
}
// Tracking filters
var filters = {};
function updateFilters() {

 // Save the element, value, and id of the filter that was changed
 var changedElement = d3.select(this).select("input");
 var elementValue = changedElement.property("value");
 var filterId = changedElement.attr("id");

 // If a filter value was entered then add that filterId and value
 // to the filters list. Otherwise, clear that filter from the filters object
 if (elementValue) {
   filters[filterId] = elementValue;
 }
 else {
   delete filters[filterId];
 }
 // Call function to apply all filters and rebuild the table
 filterTable();
}
function filterTable() {

 // Set the filteredData to the tableData
 let filteredData = tableData;

 // Loop through all of the filters and keep any data that
 // matches the filter values
 Object.entries(filters).forEach(([key, value]) => {
   filteredData = filteredData.filter(row => row[key] === value);
 });

 // Rebuild the table using the filtered Data
 buildTable(filteredData);
}

// Attach an event to listen for changes to each filter
d3.selectAll(".filters").on("change", updateFilters);

// Build the table when the page loads
buildTable(tableData);