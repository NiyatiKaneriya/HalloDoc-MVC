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