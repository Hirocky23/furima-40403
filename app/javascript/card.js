const pay = () => {
  const publicKey = gon.public_key; // gonを使用して公開鍵を取得
  const payjp = Payjp(publicKey)
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーの処理
        console.error(response.error)
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        document.getElementById("charge-form").submit();
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
    });
  });
};

window.addEventListener("turbo:load", pay);

