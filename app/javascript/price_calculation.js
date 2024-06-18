document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const price = parseInt(inputValue, 10);

    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      const fee = Math.floor(price * 0.1);  // 販売手数料10%
      const profitAmount = price - fee;
      taxPrice.innerHTML = fee.toLocaleString();
      profit.innerHTML = profitAmount.toLocaleString();
    } else {
      taxPrice.innerHTML = '0';
      profit.innerHTML = '0';
    }
  });
});
