let email = document.getElementById("email");
let username = document.getElementById("username");
let password = document.getElementById("password");
let confirmPass = document.getElementById("confirmPass");
let agree = document.getElementById("agree");

function validateEmail(email)
{
    if(email[0] == '@' || email[0] == '.' || email[0] == '_')
    {
        document.getElementById("email-error").innerHTML = "Invalid email format";
        return false;
    }
    else if (email[email.indexOf("@") - 1] == '.' || 
    email[email.indexOf("@") + 1] == '.')
    {
        document.getElementById("email-error").innerHTML = "Invalid Email format";
        return false;
    } 
    else if (email.includes("@") == false)
    {
        document.getElementById("email-error").innerHTML = "Invalid Email format";
        return false;
    }
    else if (email.endsWith(".com") == false)
    {
        document.getElementById("email-error").innerHTML  = "Email must ends with .com";
        return false;
    }
    document.getElementById("email-error").innerHTML = "";
    return true;
}

function validateUsername(username)
{
    if(username.length > 20)
    {
        document.getElementById("username-error").innerHTML = "Username must be less than 20 characters";
        return false;
    }
    if(username.length < 1)
    {
        document.getElementById("username-error").innerHTML = "Enter username";
        return false;
    }
    document.getElementById("username-error").innerHTML = "";
    return true;
}

function validatePassword(password, confirmPass)
{
    if(password.length < 8)
    {
        document.getElementById("password-error").innerHTML = "Password must be more than 8 characters";
        return false;
    }
    else if(password.search(/[a-z]/) < 0)
    {
        document.getElementById("password-error").innerHTML = "Password must contain at least 1 lower case character";
        return false;
    }
    else if(password.search(/[A-Z]/) < 0)
    {
        document.getElementById("password-error").innerHTML = "Password must contain at least 1 upper case character";
        return false;
    }
    else if(password.search(/[0-9]/) < 0)
    {
        document.getElementById("password-error").innerHTML = "Password must contain at least a number";
        return false;
    }

    document.getElementById("password-error").innerHTML = "";

    if(password != confirmPass)
    {
        document.getElementById("confirmPass-error").innerHTML = "Password does not match";
        return false;
    }
    document.getElementById("confirmPass-error").innerHTML = "";
    return true;
}

function validateAgree(agree)
{
    if(!agree.checked)
    {
        document.getElementById("agree-error").innerHTML = "You have to agree to our terms and condition";
        return false;
    }

    document.getElementById("agree-error").innerHTML = "";
    return true;

}

function submitForm()
{
    if(validateEmail(email.value) &&
    validateUsername(username.value) &&
    validatePassword(password.value, confirmPass.value) &&
    validateAgree(agree))
    {
        window.alert("Your Kenshin Impact Has Successfully Made");
    }
    else window.alert("Data Invalid");
}