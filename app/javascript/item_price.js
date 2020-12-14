function feeProfit(){
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', function(){
    const inputValue = priceInput.value

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);

  });

};

window.addEventListener('load', feeProfit)

// const url = location.pathname
// if (url ==("/items/new"){

// }