<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Meet Now AdminLogin</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>

<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Login</div>
			<div class="card-body">

				<form action="login.ao" method="post" id="signform">
					<div class="form-group">
						<label for="exampleInputEmail1">Id</label> <input
							class="form-control" id="id" type="text" name="id"
							aria-describedby="emailHelp" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							class="form-control" id="pw" type="password" name="pw"
							placeholder="Password">
					</div>
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox"> Remember
								Password
							</label>
						</div>
					</div>
					<button type="button" id="signin" class="btn btn-primary btn-block">Sign
						In</button>
					<button type="button" id="signup"
						class="btn btn-lg btn-primary btn-block">Sign Up</button>
				</form>

				<div class="text-center">
					<a class="d-block small mt-3" href="register.html">Register an
						Account</a> <a class="d-block small" href="forgot-password.html">Forgot
						Password?</a>
				</div>
			</div>
		</div>
	</div>



	<script>
		window.onload = function() {
			document.getElementById("signup").onclick = function() {
				location.href = "joinForm.html";
			}

			document.getElementById("signin").onclick = function() {
				var id = document.getElementById("id").value;
				var pw = document.getElementById("pw").value;

				if (id == "" || pw == "") {
					alert("please check id & password ");
				} else {
					document.getElementById("signform").submit();
				}
			}
		}
	</script>

</body>

</html>
