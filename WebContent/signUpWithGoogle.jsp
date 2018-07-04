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

console.log(ggId+ ggName+ggImgUrl+ggEmail);  	
	
	$.ajax({
		url : "ggAccntProc.co",
		method : "post",
		data : {
			"ggId" : ggId,
			"ggName" : ggName,
			"ggImgUrl" : ggImgUrl,
			"ggEmail" : ggEmail
		},
		success : function(DupleResult) {
// 		alert("DupleResult : " + DupleResult);

if(DupleResult=="true"){
// 	var autoLogin = comfirm("존재하지 않는 아이디 입니다. 자동으로 회원가입 하시겠습니까?");
// 	if(autoLogin == true){
		location.href="main.jsp";
// 	}else{
		
	}
else{
	alert("이미 존재하는 아이디 입니다. 자동으로 로그인 됩니다.");
	location.href="main.jsp";
	
}
		
		}});
	

	
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



