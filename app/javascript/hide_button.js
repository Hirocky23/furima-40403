document.addEventListener('DOMContentLoaded', function() {
  console.log('DOM fully loaded and parsed'); // デバッグ用ログ

  // 出品ページのURLパターンに一致するか確認
  if (window.location.href.includes('/items/new') || window.location.href.includes('/items/edit')) {
      console.log('URL matched'); // デバッグ用ログ
      var exhibit_btn = document.querySelector('.purchase-btn'); // ボタンのクラス名に合わせて変更
      if (exhibit_btn) {
        console.log('Button found'); // デバッグ用ログ
        exhibit_btn.style.display = 'none';
      } else {
        console.log('Button not found'); // デバッグ用ログ
      }
  } else {
    console.log('URL not matched'); // デバッグ用ログ
  }
});
