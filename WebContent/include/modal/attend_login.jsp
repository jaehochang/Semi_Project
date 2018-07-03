<%@ page pageEncoding="utf8"%>

<!-- 모달 팝업 -->
<form method=post action="attend.meet?meeting_seq=${result.meeting_seq}">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidden="true">×</span><span class="sr-only">Close</span>
               </button>
               <h4 class="modal-title" id="myModalLabel">가입하기</h4>
            </div>
            <div class="modal-body">
               <h2>
                  <B>참가신청 완료하기</B>
               </h2>
               <bR> 다른 사람과 함께 오시나요?
               <div class="dropdown">
                  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                     0 <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu"
                     aria-labelledby="dropdownMenu1">
                     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1</a></li>
                     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2</a></li>
                     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3</a></li>
                     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4</a></li>
                     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">5</a></li>
                  </ul>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
               <button type="submit" class="btn btn-primary">참석하기</button>
            </div>
         </div>
      </div>
   </div>
</form>