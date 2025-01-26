document.addEventListener('turbo:load', function() {
  var statusErrorElement = document.getElementById('another_post_form_status_error_name');
  if (statusErrorElement) {
    statusErrorElement.addEventListener('change', function() {
      var value = this.value;
      var errorPostOtherContent = document.getElementById('error_post_other_content');
      
      if (errorPostOtherContent) {
        if(value === "その他") {
          errorPostOtherContent.classList.remove('hidden');
        } else {
          errorPostOtherContent.classList.add('hidden');
        }
      }
    });
  }
});
