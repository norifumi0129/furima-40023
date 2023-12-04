// グローバル変数としてPayjpのインスタンスを保持
let payjpInstance;

// turbolinks:load イベントが発生したときに実行されるコード
$(document).on("turbolinks:load", function(){
  const publicKey = gon.public_key;

  // 既存のPayjpインスタンスが存在しない場合にのみ新しいインスタンスを作成
  if (!payjpInstance) {
    payjpInstance = Payjp(publicKey); // PAY.JPテスト公開鍵
  }

  const elements = payjpInstance.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  
  const form = document.getElementById('charge-form');
  
  form.addEventListener("submit", (e) => {
    payjpInstance.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーがある場合の処理
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });

    e.preventDefault();
  });
});