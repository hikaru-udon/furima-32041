window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    //console.log(inputValue);
  
  

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    //console.log(addTax);

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
    //console.log(profit);

  })

});