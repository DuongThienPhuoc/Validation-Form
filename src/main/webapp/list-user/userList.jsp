<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <script>
        const validateRegister = () => {
            const fistNameElement = document.getElementById("first-name");
            const lastNameElement = document.getElementById("last-name");
            const emailElement = document.getElementById("email");
            const userName = document.getElementById("user-name");
            const passwordElement = document.getElementById("password");
            const confirmPasswordElement = document.getElementById("re-password");

            let status = false;
            let message = "Please fill all mandatory fields";
            setBorderColor(fistNameElement);
            setBorderColor(lastNameElement);
            setBorderColor(emailElement);
            setBorderColor(userName);
            setBorderColor(passwordElement);
            setBorderColor(confirmPasswordElement);

            const email = emailElement.value;
            if (email !== "" && !validateEmail(email)) {
                message = "Email is incorrect format!"
                emailElement.style.borderColor = "red"
            } else if (passwordElement.value !== confirmPasswordElement.value) {
                message = "Confirm password is not match with password";
                confirmPasswordElement.style.borderColor = "red"
            }

            // Count number of input tag
            let numberOfInput = (document.getElementsByTagName("input").length) - 1;
            let countNumberValidInput = 0;
            console.log(numberOfInput);
            for (let i = 0; i < numberOfInput; i++) {
                if (document.getElementsByTagName("input")[i].style.borderColor === 'green') {
                    countNumberValidInput++;
                }
            }
            console.log(countNumberValidInput);
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
    </script>

    <title>Document</title>
</head>
<body>
<div class="container">
    <div class="user-register">
        <div class="row">
            <div class="col">
                <h1 class="text-center"><strong>USER DETAIL</strong></h1>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <span id="error" style="color: red"></span>
                <form action="register" method="post" onsubmit="return validateRegister()">
                    <div class="my-2">
                        <label for="first-name">Fist Name<span style="color: red">*</span>:</label>
                        <input type="text" class="form-control" id="first-name" placeholder="Enter first name"
                               name="first_name">
                    </div>
                    <div class="my-2">
                        <label for="last-name">Last Name<span style="color: red">*</span>:</label>
                        <input type="text" class="form-control" id="last-name" placeholder="Enter last name"
                               name="last_name">
                    </div>
                    <div class="my-2">
                        <label for="email">Email<span style="color: red">*</span>:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                    <div class="my-2">
                        <label for="user-name">User Name<span style="color: red">*</span>:</label>
                        <input type="text" class="form-control" id="user-name" placeholder="Enter user name"
                               name="user_name">
                    </div>
                    <div class="my-2">
                        <label for="password">Password<span style="color: red">*</span>:</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter password"
                               name="password">
                    </div>
                    <div class="my-2">
                        <label for="re-password">Confirm password<span style="color: red">*</span>:</label>
                        <input type="password" class="form-control" id="re-password" placeholder="Enter password again">
                    </div>
                    <div>
                        <input type="submit" value="Register" class="btn btn-primary" onclick="validateRegister()"/>
                    </div>
                    <span style="color: red">
                        <c:out value="${confirm}"/>
                        </span>
                </form>
            </div>
        </div>
    </div>
    <hr>
    <div class="user-list-table">
        <div>
            <h4>User List</h4>
        </div>
        <table class="table table-bordered">
            <thead class="table table-dark">
            <tr>
                <th>Id</th>
                <th>FistName</th>
                <th>LastName</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody class="table-body">
            <c:forEach var="i" items="${list}" varStatus="loop">
                <tr>
                    <th>${loop.index}</th>
                    <th>${i.firstName}</th>
                    <th>${i.lastName}</th>
                    <th>${i.email}</th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>