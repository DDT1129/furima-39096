window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const addPriceTax = document.getElementById("add-tax-price");
  const profitValue = document.getElementById("profit");

  priceInput.addEventListener("input", (e) => {
    const inputValue = priceInput.value;
    console.log(inputValue);
      addPriceTax.innerHTML = (Math.floor(inputValue*0.1));
      console.log(addPriceTax);
        const taxValue = inputValue * 0.1
        profitValue.innerHTML = (Math.floor(inputValue - taxValue));
        console.log(profitValue);
  });
});

