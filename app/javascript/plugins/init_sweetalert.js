import Swal from "sweetalert2";

const initSweetalert = () => {
  const catchPokemonButton = document.querySelector('#catch-pokemon');
  if (catchPokemonButton) {
    catchPokemonButton.addEventListener("click", () => {
      Swal.fire({
        template: "#catched-pokemon-form"
      })
      .then((result) => {
         if (result.isConfirmed) {
          const submitBtn = document.querySelector("#submit-new-catched-btn");
          submitBtn.click();
        }
      });
    });
  }
};

export { initSweetalert };
