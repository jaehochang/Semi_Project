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
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">참가신청 완료하기</h4>
               </div>
               <div class="modal-body">
                  <bR> 다른 사람과 함께 오시나요?  
                 <select id="people_option" name="people" required>
                   <option>0</option>
                   <option>1</option>
                   <option>2</option>
                   <option>3</option>
                   <option>4</option>
                   <option>5</option>
                 </select>
               </div>
               <div class="modal-footer">
<!--                   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button> -->
<!--                   <button type="button" class="btn btn-primary">참석하기</button> -->
                   <a data-toggle="modal" href="#myModal2" class="btn btn-primary">참석하기</a>
               </div>
            </div>
         </div>
      </div>
      <!-- second modal -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">가입하기</h4>
               </div>
               <div class="modal-body" style="background-color : pink;"><h2>참석이 최종 확인되었습니다</h2>
               </div>
               <div class="modal-footer">
                  <button type="submit" class="btn btn-primary" >참석 확인</button>
               </div>
            </div>
         </div>
      </div>
</form>