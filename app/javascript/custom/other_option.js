document.addEventListener('turbo:load', function() {
  var fileTypeElement = document.getElementById('file_type_id');
  if (fileTypeElement) {
    fileTypeElement.addEventListener('change', function() {
      var value = this.value;
      var anotherPostOtherContent = document.getElementById('another_post_other_content');
      
      if (anotherPostOtherContent) {
        if(value === '26') {
          anotherPostOtherContent.classList.remove('hidden');
        } else {
          anotherPostOtherContent.classList.add('hidden');
        }
      }
    });
  }
});

console.log("ABC")
