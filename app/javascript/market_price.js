window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const addPriceTax = document.getElementById("add-tax-price");
  const profitValue = document.getElementById("profit");

  priceInput.addEventListener("input", (e) => {
    const inputValue = priceInput.value;
      addPriceTax.innerHTML = (Math.floor(inputValue*0.1));
        const taxValue = inputValue * 0.1
        profitValue.innerHTML = (Math.floor(inputValue - taxValue));
  });
});

