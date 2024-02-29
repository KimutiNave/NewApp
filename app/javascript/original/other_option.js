document.addEventListener('turbo:load', function() {
  var fileTypeElement = document.getElementById('post_file_type_id');
  if (fileTypeElement) {
    fileTypeElement.addEventListener('change', function() {
      var value = this.value;
      var postOtherContent = document.getElementById('post_other_content');
      
      if (postOtherContent) {
        if(value === '26') {
          postOtherContent.classList.remove('hidden');
        } else {
          postOtherContent.classList.add('hidden');
        }
      }
    });
  }
});

console.log("ABC")
