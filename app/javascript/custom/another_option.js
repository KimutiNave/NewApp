document.getElementById('status_error_name').addEventListener('change', function() {
  var value = this.value;
  var error_post_other_content = document.getElementById('error_post_other_content');

  if(value === "その他") {
    error_post_other_content.classList.remove('hidden');
  } else {
    error_post_other_content.classList.add('hidden');
  }
});