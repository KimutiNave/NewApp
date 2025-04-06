document.addEventListener('turbo:load', function() {
  const els = document.getElementsByClassName('card-text');
  const len = 1000;

  for(let i = 0; i < els.length; i++) {
    const el = els[i];
    const str = el.innerHTML.trim(); // innerHTMLを使用

    if (str.length > len) {
      const truncatedStr = str.substring(0, len) + '…';
      const sanitizedStr = DOMPurify.sanitize(truncatedStr); // サニタイズ
      el.innerHTML = sanitizedStr; // innerHTMLに設定
      const br = document.createElement('br'); // 改行用の要素を作成
      el.appendChild(br); // 要素に追加
    }
  }
});
