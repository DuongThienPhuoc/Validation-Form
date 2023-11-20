const validateRegister = () => {
    const fistNameElement = document.getElementById("first-name");
    const lastNameElement = document.getElementById("last-name");
    const emailElement = document.getElementById("email");
    const passwordElement = document.getElementById("password");
    const confirmPasswordElement = document.getElementById("re-password");

    let status = false;
    let message = "Please fill all mandatory fields";
    setBorderColor(fistNameElement);
    setBorderColor(lastNameElement);
    setBorderColor(emailElement);
    setBorderColor(passwordElement);
    setBorderColor(confirmPasswordElement);

    const email = emailElement.value;
    if (email !== "" && !validateEmail(email)) {
        message = "Email is incorrect format!"
        emailElement.style.color = "red"
    } else if (passwordElement.value !== confirmPasswordElement.value) {
        message = "Confirm password is not match with password";
        confirmPasswordElement.style.color = "red"
    }

    // Count number of input tag
    let numberOfInput = document.getElementsByTagName("input").length;
    let countNumberValidInput = 0;
    for (let i = 0; i < numberOfInput; i++) {
        if (document.getElementsByTagName("input")[i].style.borderColor === "green") {
            countNumberValidInput++;
        }
    }
    // If all input tag are valid set status = true
    if (countNumberValidInput === numberOfInput) {
        message = "";
        status = true;
    }
    document.getElementById("error").innerText = message;
    return status;
}
const validateEmail = (email) => {
    let regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regex.test(email)
}
const setBorderColor = (element) => {
    if (element.value === '') {
        element.style.borderColor = 'red';
    } else {
        element.style.borderColor = 'green';
    }
}
console.log('Hi')