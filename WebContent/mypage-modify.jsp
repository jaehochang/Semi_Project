<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 계정 | MeetNow</title>
</head>
<body style="width:100%;height:600px;background-color:grey;">

<div class="animated fadeIn" style="margin:0 auto; width:50%; border:1px grey solid; box-shadow:3px 3px 3px grey; background-color:white;">
<label>지역 : </label><input value="${requestScope.userLocation}" name=""><button>편집</button>
<label>흥미  </label><input value="${requestScope.userInterests}" name=""><button>편집</button>
<input value="${requestScope.userGender}" name=""><button>편집</button>
<input value="${requestScope.userAge}" name=""><button>편집</button>
</div>
</body>
</html>