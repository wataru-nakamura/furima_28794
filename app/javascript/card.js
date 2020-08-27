const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyerorder[number]"),
      cvc: formData.get("buyerorder[cvc]"),
      exp_month: formData.get("buyerorder[exp_month]"),
      exp_year: `20${formData.get("buyerorder[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("buyerorder_number").removeAttribute("name");
        document.getElementById("buyerorder_cvc").removeAttribute("name");
        document.getElementById("buyerorder_exp_month").removeAttribute("name");
        document.getElementById("buyerorder_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        alert("送信内容に不備があります")
      }
    });
  });
};

window.addEventListener("load", pay);