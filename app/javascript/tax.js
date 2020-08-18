window.addEventListener("load", function(){

  const itemPrice = document.getElementById("item-price")

  itemPrice.addEventListener("input", function(){
    const inputData = document.getElementById("item-price").value;
    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    fee.innerHTML = Math.floor(inputData * 0.1);
    profit.innerHTML = Math.floor(inputData * 0.9);
  });
})