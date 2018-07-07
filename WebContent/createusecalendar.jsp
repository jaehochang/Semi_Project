<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css"/>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css"/>
<link rel="stylesheet" href="css/bootstrap-material-datetimepicker.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
<script src="https://code.jquery.com/jquery-1.12.3.min.js" integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script type="text/javascript" src="js/bootstrap-material-datetimepicker.js"></script>

<script>
      (function(i, s, o, g, r, a, m) {
         i['GoogleAnalyticsObject'] = r;
         i[r] = i[r] || function() {
            (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
         })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
         ga('create', 'UA-60343429-1', 'auto');
         ga('send', 'pageview');
         
         /* 여기는 무슨 설명인지 안쓰여 있길래 설명할수가 없는점 양해부탁드립니다  */
</script>

</head>
<body>

<form id="insert" method="get" action="timesector.do">
      <div class="container well">
         <div class="row">
            <div class="col-md-6">
               <h2>Events</h2>
            </div>
         </div>
         <div class="row">
            <div class="col-md-6">
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-control-wrapper">
                        <input type="text" id="date-start" class="form-control floating-label" placeholder="Start Date"
                        name="start">
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <div class="form-control-wrapper">
                        <input type="text" id="date-end" class="form-control floating-label" placeholder="End Date"
                        name="end">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <button id="input" type="button">inputtest</button>
   </form>
   <script type="text/javascript">
      $(document).ready(function()
      {

         $('#date-end').bootstrapMaterialDatePicker
         ({
            weekStart: 0, format: 'YYYY/MM/DD/HH/mm',
            //format :  타입 
            minDate : new Date()
         }).on('change',function(e,date){
            $('#date-start').bootstrapMaterialDatePicker('setMaxDate', date);
         });
         $('#date-start').bootstrapMaterialDatePicker
         ({
            weekStart: 0, format: 'YYYY/MM/DD/HH/mm',
            minDate : new Date()
         //mindate : 최소 시간 시작지점 설정 
         }).on('change', function(e, date) //change 바뀔때마다  인지함 
         {
            $('#date-end').bootstrapMaterialDatePicker('setMinDate', date);
         });

         $('#min-date').bootstrapMaterialDatePicker({ format : 'YYYY/MM/DD/HH/mm', minDate : new Date() });

         $.material.init()
         
         $("#input").click(function() {
             $('#insert').submit();
         });
      });
      </script>


</body>
</html>