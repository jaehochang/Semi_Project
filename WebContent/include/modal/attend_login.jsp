<%@ page pageEncoding="utf8"%>

<!-- 모달 팝업 -->
<script>
$(function() {
    $("#people_option").on("change", function() {
    }).trigger("change");
});
 
$('#formid').submit(function() {
    $('#myModal').modal('hide');
    $('#myModal2').modal('hide');
    return false;
});
</script>
<form method=post action="attend.meet?meeting_seq=${result.meeting_seq}" id="formid">
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header" >
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel" style="color:#6e7776;">참가신청 완료하기</h4>
               </div>
               <div class="modal-body" style="background-color:#dcebed; color:#6e7776; text-align : center;">
                  <bR><p style="text-align : center; size:100px;"> 다른 사람과 함께 오시나요?  
                 <select id="people_option" name="people" required style="color:#909b9a;">
                   <option>0</option>
                   <option>1</option>
                   <option>2</option>
                   <option>3</option>
                   <option>4</option>
                   <option>5</option>
                 </select> </p>
               </div>
               <div class="modal-footer">
                   <a data-toggle="modal" href="#myModal2" class="btn btn-primary" style="background-color:#cce5e8; border:0; outline:0;">참석하기</a>
               </div>
            </div>
         </div>
      </div>
      
      
      <!-- second modal -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" >
                     <span aria-hidden="true" >×</span><span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel"><Br></h4>
               </div>
               <div class="modal-body" style="background-color:#99d6db; color:white; text-align : center;"><span class="glyphicon glyphicon-ok-sign" style="font-size: 50px;"></span><h2>참석이 최종 확인되었습니다</h2>
               </div>
               <div class="modal-footer">
                  <button type="submit" class="btn btn-primary" style="background-color:#99d6db; border:0; outline:0;">참석 확인</button>
               </div>
            </div>
         </div>
      </div>
</form>