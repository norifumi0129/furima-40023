// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price"); 
// 販売手数料を表示する要素  
const addTaxDom = document.getElementById("add-tax-price");
// 販売利益を表示する要素
const addProfit = document.getElementById("profit")
// 入力するたびにイベント発火
priceInput.addEventListener("input", () => {
// 入力した金額の値を取得
  const inputValue = priceInput.value;
// 入力した金額から販売手数料を計算
const tax = Math.floor(inputValue * 0.1);
// 販売手数料を表示
addTaxDom.innerHTML = tax;
// 入力した金額から利益を計算
const profit = inputValue - tax;
// 販売利益を表示
addProfit.innerHTML = profit;
})