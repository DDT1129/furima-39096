const pay = () => {

  const payjp = Payjp('pk_test_0a189883856d7a354b7391ae')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');
  
  numberElement.mount('#card-number');
  expiryElement.mount('#card-expiry');
  cvcElement.mount('#card-cvc');  
  
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
      }
    });
  });

  

};
window.addEventListener('load', pay ) 
