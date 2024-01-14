document.addEventListener('turbo:load', setupPriceCalculation);
document.addEventListener('turbo:frame-load', setupPriceCalculation);
document.addEventListener('turbo:render', setupPriceCalculation);

function setupPriceCalculation() {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue - tax);
    addTaxDom.innerHTML = tax;
    profitPrice.innerHTML = profit;
  });

  const addTaxDom = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");
}
