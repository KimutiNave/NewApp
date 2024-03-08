document.addEventListener('turbo:load', function() {
  var statusErrorElement = document.getElementById('another_post_status_error_name');
  if (statusErrorElement) {
    statusErrorElement.addEventListener('change', function() {
      var value = this.value;
      var errorPostOtherContent = document.getElementById('error_post_other_content');
      
      if (errorPostOtherContent) {
        if(value === "other") {
          errorPostOtherContent.classList.remove('hidden');
        } else {
          errorPostOtherContent.classList.add('hidden');
        }
      }
    });
  }
});

console.log("ABC")
