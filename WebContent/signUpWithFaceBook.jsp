<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//www.gstatic.com/firebasejs/live/3.0/firebase.js"></script>
<script src="../firebase/init.js"></script>
<script src="js/index.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.2.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyDj3KyNTil0M6pJNVqVwf88zC1-SnOmyL8",
    authDomain: "meetnow-6fd56.firebaseapp.com",
    databaseURL: "https://meetnow-6fd56.firebaseio.com",
    projectId: "meetnow-6fd56",
    storageBucket: "meetnow-6fd56.appspot.com",
    messagingSenderId: "808309268030"
  };
  firebase.initializeApp(config);
</script>



<style>
#authorized>div:nth-child(1) {
	font-size: 50px;
}

#authorized img#photo {
	height: 50px;
	border-radius: 25px;
	vertical-align: middle;
}
</style>



<script>

$(document).ready(function() {


	
	$("#authorized").hide();
    $("#error").hide();
     
    firebase.auth().getRedirectResult().then(signInSucceed).catch(signInError);
 
});
 
function signIn() {
    var provider = new firebase.auth.FacebookAuthProvider();
     
    firebase.auth().signInWithPopup(provider)
            .then(signInSucceed)
            .catch(signInError);
}
  
function signInSucceed(result) {
    if (result.credential) {
        facebookAccountToken = result.credential.accessToken;
        user = result.user;
 
        $("#photo").attr("src", user.photoURL);
        $("#displayName").html(user.displayName);
        $("#email").html(user.email);
        $("#refreshToken").html(user.refreshToken);
        $("#uid").html(user.uid);
        $("#authorized").show();
        $("#signIn").hide();

//         값 받기
 		$("#fb_photoURL").val(user.photoURL);
 		$("#fb_email").val(user.email);
        $('#fb_name').val(user.displayName);
        $("#fb_uid").val(user.uid);	
        $("#facebookAccntForm").submit(); //  받은 값 controller로 전송
//         값 받기 끝
    }

}
 
function signInError(error) {
    var errorCode = error.code;
    var errorMessage = error.message;
    var email = error.email;
    var credential = error.credential;
 
    var errmsg = errorCode + " " + errorMessage;
 
    if(typeof(email) != 'undefined') {
        errmsg += "<br />";
        errmsg += "Cannot sign in with your facebook account: " + email;
    }
 
    if(typeof(credential) != 'undefined') {
        errmsg += "<br />";
        errmsg += credential;
    }
 
    lastWork = "signIn";
    $("#error #errmsg").html(errmsg);
    $("#error").show();
    $("#signIn").hide();
    return;
}
 
function signInWithRedirect() {
    var provider = new firebase.auth.FacebookAuthProvider();
     
    firebase.auth().signInWithRedirect(provider);
}
 
function back() {
    $("#" + lastWork).show();
    $("#error").hide();
}

</script>

<form id=facebookAccntForm action="signUpWithFaceBook.co" method="post">
	<input type=hidden id=fb_photoURL name=fb_photoURL value=""> <input
		type=hidden id=fb_email name=fb_email value=""> <input
		type=hidden id=fb_name name=fb_name value=""> <input
		type=hidden id=fb_uid name=fb_uid value="">
</form>