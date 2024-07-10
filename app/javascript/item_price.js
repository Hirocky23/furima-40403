const calculatePrice = () => {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (priceInput) {
    const updatePrice = () => {
      const inputValue = priceInput.value;
      const price = parseInt(inputValue, 10);
      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const fee = Math.floor(price * 0.1);  // 販売手数料10%
        const profitAmount = Math.floor(price - fee);  // 販売利益
        taxPrice.innerHTML = fee.toLocaleString();
        profit.innerHTML = profitAmount.toLocaleString();
      } else {
        taxPrice.innerHTML = '0';
        profit.innerHTML = '0';
      }
    };

    priceInput.addEventListener("input", updatePrice);
    // 初期表示時にも計算を実行
    updatePrice();
  }
};

window.addEventListener("turbo:load", calculatePrice);
window.addEventListener("turbo:render", calculatePrice);