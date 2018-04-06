import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalBtn = document.getElementById('sweet-alert-demo')

  if(swalBtn) {

    swalBtn.addEventListener('click', () => {
      swal({
        title: "Congratulations",
        text: "Payment approved! product shipped",
        icon: "success"
      }).then(redirectToHome)
    });


  }
}

const redirectToHome = () => {
  window.location.href = '/'
}

export { bindSweetAlertButtonDemo };
