const price = () => {

  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  const addTaxPrice = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = Number(priceInput.value);
    if (!isNaN(inputValue)) {
      addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);
      profitPrice.innerHTML = Math.floor(inputValue - (inputValue * 0.1));
    }
    else {
      addTaxPrice.innerHTML = "";
      profitPrice.innerHTML = "";
    }
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);