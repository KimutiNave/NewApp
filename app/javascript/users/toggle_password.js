document.addEventListener('turbo:load', function() {
  const passwordCheckbox = document.querySelector('.toggle_password_checkbox');
  const password = document.querySelector('.user_password');
  const confirmCheckbox = document.querySelector('.toggle_password_confirmation');
  const passconfirm = document.querySelector('.user_password_confirmation');
  const currentpassCheckbox = document.querySelector('.toggle_password_current');
  const currentpass = document.querySelector('.user_current_password');

  // パスワードフィールドの表示・非表示
  if (passwordCheckbox && password) {
    passwordCheckbox.addEventListener('change', () => {
      password.type = passwordCheckbox.checked ? 'text' : 'password';
      passwordCheckbox.nextSibling.textContent = passwordCheckbox.checked ? '非表示' : '表示';
    });
  }

  // パスワード確認フィールドの表示・非表示
  if (confirmCheckbox && passconfirm) {
    confirmCheckbox.addEventListener('change', () => {
      passconfirm.type = confirmCheckbox.checked ? 'text' : 'password';
      confirmCheckbox.nextSibling.textContent = confirmCheckbox.checked ? '非表示' : '表示';
    });
  }

  // 現在のパスワード確認表示・非表示
  if (currentpassCheckbox && currentpass){
    currentpassCheckbox.addEventListener('change', () =>{
      currentpass.type = currentpassCheckbox.checked ? 'text' : 'password';
      currentpassCheckbox.nextSibling.textContent = currentpassCheckbox.checked ?  '非表示' : '表示';
    });
  }
});
