document.getElementById('file_name').addEventListener('change', function() {
  var value = this.value;
  var post_other_content = document.getElementById('post_other_content');

  if(value === '26') {
    post_other_content.classList.remove('hidden');
  } else {
    post_other_content.classList.add('hidden');
  }
});

console.log("ABC")
