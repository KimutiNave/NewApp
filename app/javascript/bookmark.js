document.addEventListener("DOMContentLoaded", () => {
  document.addEventListener("ajax:success", (event) => {
    const [data, status, xhr] = event.detail;
    const postId = data.post_id;
    const button = document.querySelector(`#js-bookmark-button-for-post-${postId}`);
    if (button) {
      button.outerHTML = data.html;
    }
  });
});
