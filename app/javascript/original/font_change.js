document.addEventListener('turbo:load', function() {
  var fs = document.getElementsByClassName('fo4')
  const tlen = 2000;

  for(var s = 0; s < fs.length; s++) {
    const tl = fs[s];
    const etl = tl.textContent.trim();

    if (etl.length > tlen) {
      fs[s].style.fontSize = "clamp(0.28rem, 1vw, 0.8rem)";
    }
  }
});
