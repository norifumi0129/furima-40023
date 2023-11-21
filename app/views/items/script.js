document.addEventListener('DOMContentLoaded', function() {
  // 商品価格のinput要素を取得
  var itemPriceInput = document.getElementById('itemPrice');

  // 商品手数料を表示する要素を取得
  var addTaxPriceElement = document.getElementById('addTaxPrice');

  // 販売利益を表示する要素を取得
  var profitElement = document.getElementById('profit');

  // 商品手数料率（10%）を設定
  var commissionRate = 0.1;

  // 商品価格のinput要素に入力があるたびに計算を実行
  itemPriceInput.addEventListener('input', function() {
    // 入力された商品価格を取得
    var itemPrice = parseFloat(itemPriceInput.value);

    // 入力が数字であることを確認
    if (!isNaN(itemPrice)) {
      // 商品手数料を計算
      var addTaxPrice = itemPrice * commissionRate;

      // 販売利益を計算
      var profit = itemPrice - addTaxPrice;

      // 商品手数料と販売利益を表示
      addTaxPriceElement.textContent = '¥' + addTaxPrice.toFixed(2);
      profitElement.textContent = '¥' + profit.toFixed(2);
    } else {
      // 入力が数字でない場合はメッセージを表示（任意）
      addTaxPriceElement.textContent = '有効な数字を入力してください';
      profitElement.textContent = '';
    }
  });
});