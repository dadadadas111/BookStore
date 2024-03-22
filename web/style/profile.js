/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener('DOMContentLoaded', function () {
    // Get references to the input fields
    var fullnameInput = document.querySelector('input[name="fullname"]');
    var phoneInput = document.querySelector('input[name="phonenumber"]');
    var genderSelect = document.querySelector('select[name="gender"]');
    var saveInput = document.querySelector('input[name="submit"]');
    var imageInput = document.querySelector('input[name="upload"]');

    // Disable the username input by default
    saveInput.disabled = true;
    saveInput.style.cursor = 'not-allowed';

    // Function to enable the username input when any other input changes
    function enableUsernameInput() {
        saveInput.disabled = false;
        saveInput.style.cursor = 'default';
    }


    document.getElementById('files').onchange = function () {
        var src = URL.createObjectURL(this.files[0])
        document.getElementById('image').src = src
        console.log(document.getElementById('path'))
        console.log(src)
        var file = new File([src], "test.jpg");
        console.log('file is ', file)
        document.getElementById("check").value = "ok";
        console.log('check', document.getElementById("check").value )
    }
    
    console.log(document.getElementById('files').value)


    // Listen for changes in other inputs
    fullnameInput.addEventListener('input', enableUsernameInput);
    phoneInput.addEventListener('input', enableUsernameInput);
    genderSelect.addEventListener('change', enableUsernameInput);
    imageInput.addEventListener('input', enableUsernameInput);

});




