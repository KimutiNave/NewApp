document.addEventListener("turbo:load", initializeDropdown);
document.addEventListener("turbo:frame-load", initializeDropdown);
document.addEventListener("turbo:render", initializeDropdown);

function initializeDropdown() {
  var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new bootstrap.Dropdown(dropdownToggleEl);
  });
}
