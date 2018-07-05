<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<script>
   //Initialize Firebase
   
   
  var config = {
    apiKey: "AIzaSyC_Y0vMwBBQ399jscmeh0GTEJgIxe65Xhs",
    authDomain: "cobalt-column-208709.firebaseapp.com",
    databaseURL: "https:cobalt-column-208709.firebaseio.com",
    projectId: "cobalt-column-208709",
    storageBucket: "cobalt-column-208709.appspot.com",
    messagingSenderId: "201245295217"
  };
  firebase.initializeApp(config);

  function google_login_in(){
//구글 인증 기능 추가
  var provider = new firebase.auth.GoogleAuthProvider();

  // 인증하기
  firebase.auth().signInWithPopup(provider).then(function(result) {
  	// This gives you a Google Access Token. You can use it to access the Google API.
  	var token = result.credential.accessToken;
  	// The signed-in user info.
  	var user = result.user;
  	
  	console.log("user :" + user)		// 인증 후 어떤 데이터를 받아오는지 확인해보기 위함.
  
  	console.log("user display name : " + user.displayName);
	console.log("user.email :" +user.email);
	console.log("user.uid :" +user.uid);
	console.log("user.photoURL : " +user.photoURL);
  	
	var ggId = user.uid; 
	var ggName =user.displayName; 
	var ggImgUrl =user.photoURL; 
	var ggEmail = user.email;

	document.getElementById("ggId").value = ggId;
	document.getElementById("ggName").value = ggName;
	document.getElementById("ggImgUrl").value = ggImgUrl;
	document.getElementById("ggEmail").value = ggEmail;
	
	document.getElementById("ggRegForm").submit();
	
	
  }).catch(function(error) {
  	// Handle Errors here.
  	var errorCode = error.code;
  	var errorMessage = error.message;
  	// The email of the user's account used.
  	var email = error.email;
  	// The firebase.auth.AuthCredential type that was used.
  	var credential = error.credential;
  	// ...
  });
  }
  
  </script>

<form id=ggRegForm action="ggAccntProc.co" method=post>
<input id=ggId type=hidden name=ggId>
<input id=ggName type=hidden name=ggName>
<input id=ggEmail type=hidden name=ggEmail>
<input id=ggImgUrl type=hidden name=ggImgUrl>
</form>