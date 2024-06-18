document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10);
      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const fee = Math.floor(price * 0.1);  // 販売手数料10%
        const profitAmount = price - fee;
        taxPrice.innerText = fee.toLocaleString();
        profit.innerText = profitAmount.toLocaleString();
      } else {
        taxPrice.innerText = '0';
        profit.innerText = '0';
      }
    });
  }
});
