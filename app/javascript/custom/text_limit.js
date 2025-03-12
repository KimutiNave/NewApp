document.addEventListener('turbo:load', function() {
  const els = document.getElementsByClassName('card-text');
  const len = 1000;

  for(let i = 0; i < els.length; i++) {
    const el = els[i];
    const str = el.textContent.trim();

    if (str.length > len) {
        el.textContent = str.substring(0, len) + '…';
    }
  }
});
