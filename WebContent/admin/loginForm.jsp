<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Meet Now AdminLogin</title>
</head>

<body class="bg-dark">
	<div class="container" style="width: 400px; margin-top: 150px;">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header" align=center>
				<strong style="font-size: 25px;">Login</strong>
			</div>
			<div class="card-body">

				<form action="login.ao" method="post" id="signform">
					<div class="form-group">
						<label for="exampleInputEmail1">Email</label> <input
							class="form-control" id="id" type="text" name="id"
							aria-describedby="emailHelp" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							class="form-control" id="pw" type="password" name="pw"
							placeholder="Password">
					</div>
					<button type="button" id="signin" class="btn btn-primary btn-block">Sign
						In</button>
				</form>

			</div>
		</div>
	</div>
	<script>
		window.onload = function() {
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
