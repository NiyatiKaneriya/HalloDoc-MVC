// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


window.onload = () => {
    const myModal = new bootstrap.Modal('#myModal');
    myModal.show();
}

$("#files").change(function () {
    console.log("function");
    filename = this.files[0].name;
    $("#choosenfile").text(filename);
});



const input = document.querySelector("#phone");
const input_bp = document.querySelector("#phone-bp");
const input_frd = document.querySelector("#phone-frd");
const input_concierge = document.querySelector("#phone-concierge");

if (input != null) {

    window.intlTelInput(input, {
        utilsScript: "https://cdn.jsdelivr.net/npm/intl-tel-input@19.2.16/build/js/utils.js",
    });
}
if (input_frd != null) {

    window.intlTelInput(input_frd, {
        utilsScript: "https://cdn.jsdelivr.net/npm/intl-tel-input@19.2.16/build/js/utils.js",
    });
}
if (input_concierge != null) {

    window.intlTelInput(input_concierge, {
        utilsScript: "https://cdn.jsdelivr.net/npm/intl-tel-input@19.2.16/build/js/utils.js",
    });
}
if (input_bp != null) {

    window.intlTelInput(input_bp, {
        utilsScript: "https://cdn.jsdelivr.net/npm/intl-tel-input@19.2.16/build/js/utils.js",
    });
}

const sendagreement = document.getElementById('sendagreement');
if (sendagreement) {
    
    sendagreement.addEventListener('show.bs.modal', event => {
        // Button that triggered the modal
        const button = event.relatedTarget;
        // Extract info from data-bs-* attributes
        const patient = button.getAttribute('data-bs-patientname');
        const requestid = button.getAttribute('data-bs-requestid');
        // If necessary, you could initiate an Ajax request here
        // and then do the updating in a callback.
        // Update the modal's content.
        const name = sendagreement.querySelector('.modal-body #names');
        document.getElementById('sendrequestid').value = requestid;
        document.getElementById('names').value = patient;
        //modalTitle.textContent = `New message to ${recipient}`
        //name.textContent = patient;
        console.log(document.getElementById('sendrequestid').value + ' ' + document.getElementById('names').value);
    })
}