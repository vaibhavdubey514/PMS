<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
<style>
    body {
        margin: 0;
        padding: 0;
        min-height: 100vh;
        background: linear-gradient(120deg, #f8fafc 0%, #e2eafc 100%);
        font-family: 'Segoe UI', Arial, sans-serif;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .center-container {
        width: 100vw;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(36, 107, 253, 0.04);
    }
    .registration-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.14);
        padding: 2.5rem 2rem 2rem 2rem;
        width: 100%;
        max-width: 480px;
        margin: 2rem 0;
    }
    .registration-card h1 {
        /* font-weight: 700; */
        color: #2c3e50;
        /* letter-spacing: 1px; */
        /* margin-bottom: 1.5rem; */
        text-align: center;
    }
    label.form-label {
        font-weight: 500;
        color: #444;
        display: block;
        margin-bottom: 0.3rem;
    }
    .form-control, .form-select, textarea {
        width: 100%;
        border-radius: 8px;
        padding: 0.8rem 1rem;
        margin-bottom: 0.2rem;
        border: 1px solid #d6d6d6;
        background: #f8fafc;
        font-size: 1rem;
        transition: border-color 0.2s;
        box-sizing: border-box;
    }
    .form-control:focus, .form-select:focus, textarea:focus {
        border-color: #246bfd;
        outline: none;
        background: #fff;
    }
    .input-group {
        display: flex;
        gap: 0.5rem;
        align-items: center;
    }
    .form-select {
        width: 40%;
        min-width: 110px;
        border-radius: 8px;
        background: #f8fafc;
        border: 1px solid #d6d6d6;
        font-size: 1rem;
    }
    .alert {
        padding: 0.9rem 1.2rem;
        border-radius: 8px;
        margin-bottom: 1.3rem;
        font-size: 1rem;
        font-weight: 500;
    }
    .alert-success {
        background: #e6f9e6;
        color: #217a36;
        border: 1px solid #b6e6b6;
    }
    .alert-danger {
        background: #ffeaea;
        color: #c0392b;
        border: 1px solid #f5c4c4;
    }
    .invalid-feedback {
        font-size: 0.93em;
        color: #c0392b;
        margin-bottom: 0.7rem;
        display: none;
    }
    .is-invalid + .invalid-feedback {
        display: block;
    }
    .btn-row {
        display: flex;
        justify-content: center;
        gap: 1rem;
        margin-top: 1.1rem;
    }
    .btn {
        min-width: 120px;
        font-weight: 600;
        border-radius: 6px;
        letter-spacing: 0.5px;
        padding: 0.7rem 1.2rem;
        font-size: 1rem;
        border: none;
        cursor: pointer;
        transition: background 0.2s, color 0.2s;
    }
    .btn-primary {
        background: #246bfd;
        color: #fff;
    }
    .btn-primary:hover {
        background: #1743a3;
    }
    .btn-reset {
        background: #f8fafc;
        color: #246bfd;
        border: 1px solid #246bfd;
    }
    .btn-reset:hover {
        background: #e2eafc;
        color: #1743a3;
    }
    .form-check {
        display: flex;
        align-items: center;
        margin-bottom: 1rem;
    }
    .form-check-input {
        margin-right: 0.6em;
        width: 1.2em;
        height: 1.2em;
        accent-color: #246bfd;
    }
    .already-account {
        margin-top: 1.6rem;
        font-size: 1em;
        color: #6c757d;
        text-align: center;
    }
    .already-account a {
        color: #246bfd;
        text-decoration: underline;
        font-weight: 500;
    }
    /* Responsive */
    @media (max-width: 600px) {
        .registration-card {
            padding: 1.2rem 0.5rem 1.5rem 0.5rem;
            max-width: 98vw;
        }
        .btn {
            min-width: 90px;
            font-size: 0.96rem;
        }
    }
</style>
</head>
<body>
    <div class="center-container">
        <div class="registration-card">
            <h1>Registration</h1>
            <%
            if ("success".equals(request.getAttribute("status"))) {
            %>
            <div class="alert alert-success">
                Registration successfull. Proceed to <a
                    href="<%=request.getContextPath()%>/login">Log In</a>
            </div>
            <%
            } else if ("error".equals(request.getAttribute("status"))) {
            %>
            <div class="alert alert-danger"><%=request.getAttribute("errorMessage")%></div>
            <%
            }
            %>
            <form action="<%=request.getContextPath()%>/customer-register"
                method="post" onsubmit="return validateRegistration()">
                <div>
                    <label class="form-label" for="name">Name</label>
                    <input class="form-control" type="text" name="name" id="name"
                        placeholder="Enter Name" required />
                    <small class="invalid-feedback">Name can only have alphabets and spaces</small>
                </div>
                <div>
                    <label class="form-label" for="email">Email</label>
                    <input class="form-control" type="email" name="email" id="email"
                        placeholder="Enter Email" required />
                </div>
                <div>
    <label class="form-label" for="mobileNumber">Mobile Number</label>
    <div class="input-group">
        <select class="form-select" name="countryCode" id="countryCode" required>
            <option value="+91">+91 (India)</option>
            <option value="+1">+1 (USA)</option>
        </select>
        <input class="form-control" type="text"
            oninput="this.value=this.value.replace(/[^0-9]/g, '').slice(0,10)" 
            pattern="\d{10}" 
            name="mobileNumber" id="mobileNumber"
            placeholder="Enter mobile number" required />
    </div>
    <small class="invalid-feedback">Mobile Number should be 10 digits</small>
</div>

                <div>
                    <label class="form-label" for="address">Address</label>
                    <textarea maxlength="150" class="form-control" name="address"
                        id="address" placeholder="Enter address" required></textarea>
                    <small class="invalid-feedback">Address must have only alphabets, numbers and spaces</small>
                </div>
                <div>
                    <label class="form-label" for="userId">User ID</label>
                    <input class="form-control" minlength="5" maxlength="15" type="text"
                        name="userId" id="userId" placeholder="Enter User Id" required />
                    <small class="invalid-feedback">User Id must be between 5 and 15 characters</small>
                </div>
                <div>
                    <label class="form-label" for="password">Password</label>
                    <input class="form-control" type="password" name="password" id="password"
                        placeholder="Enter Password" required />
                    <small class="invalid-feedback">Password must be maximum 8 characters long having minimum one uppercase, lowercase and special character</small>
                </div>
                <div>
                    <label class="form-label" for="confirmPassword">Confirm Password</label>
                    <input class="form-control" type="password"
                        name="confirmPassword" id="confirmPassword"
                        placeholder="Confirm Password" required />
                    <small class="invalid-feedback">Password and Confirm Password fields must match</small>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="emailNotifications"
                        name="emailNotifications" />
                    <label class="form-label" for="emailNotifications" style="margin-bottom:0;">Receive email notifications related to delivery</label>
                </div>
                <div class="btn-row">
                    <button class="btn btn-primary" type="submit">Register</button>
                    <button class="btn btn-reset" type="reset" onclick="resetForm()">Reset</button>
                </div>
                <div class="already-account">
                    Already have an account? <a href="<%=request.getContextPath()%>/login">Log In</a>
                </div>
            </form>
        </div>
    </div>
    <script>
        // Your existing JavaScript remains unchanged
        function validateRegistration() {
            const name = document.getElementById("name");
            const phonenumber = document.getElementById("mobileNumber");
            const address = document.getElementById("address");
            const userid = document.getElementById("userId");
            const password = document.getElementById("password");
            const confirmPassword = document.getElementById("confirmPassword");
            const nameRegex = /^[A-Za-z\s]+$/;
            
            name.classList.remove("is-invalid");
            phonenumber.classList.remove("is-invalid");
            address.classList.remove("is-invalid");
            userid.classList.remove("is-invalid");
            password.classList.remove("is-invalid");
            confirmPassword.classList.remove("is-invalid");
            
            let flag = true;
            
            if(name.value.length > 50) {
                name.classList.add("is-invalid");
                flag = false;
            }
            
            if(!nameRegex.test(name.value)) {
                name.classList.add("is-invalid");
                flag = false;
            }
            
            const phoneRegex = /^\d{10}$/;
            if(!phoneRegex.test(phonenumber.value)) {
                phonenumber.classList.add("is-invalid");
                flag =  false;
            }
            
            const noSpecialCharRegex = /^[A-Za-z0-9 ]+$/;
            if(!noSpecialCharRegex.test(address.value)) {
                address.classList.add("is-invalid");
                flag = false;
            }
            
            if(userid.value.length < 5 || userid.value.length > 20) {
                userid.classList.add("is-invalid");
                flag = false;
            }
            
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{1,8}$/;
            if(!passwordRegex.test(password.value)) {
                password.classList.add("is-invalid");
                flag = false;
            }
            
            if(password.value != confirmPassword.value) {
                confirmPassword.classList.add("is-invalid");
                flag = false;
            }
            return flag;
        }
        
        function resetForm() {
            const name = document.getElementById("name");
            const phonenumber = document.getElementById("mobileNumber");
            const userid = document.getElementById("userId");
            const password = document.getElementById("password");
            const confirmPassword = document.getElementById("confirmPassword");
            const nameRegex = /^[A-Za-z\s]+$/;
            
            name.classList.remove("is-invalid");
            phonenumber.classList.remove("is-invalid");
            address.classList.remove("is-invalid");
            userid.classList.remove("is-invalid");
            password.classList.remove("is-invalid");
            confirmPassword.classList.remove("is-invalid");
        }
    </script>
</body>
</html>
