<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script>


$(document).ready(function() {
	
//글 작성 완료 눌렀을 때 
	$("#realschoolsearch").click(function() {
	var schoolname = $("#schoolname").val();
		if(schoolname == ""){
			alert("학교이름을 입력해주세요!!!!");
			return;
		} else{
			alert(schoolname);
		}
	});
});
</script> -->
  <div class="modal fade" id="schoolModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">학교이름 검색</h4>
          <input type="button" class="button close" data-dismiss="modal" value="&times;" style="width:10;height:10;padding-top: 0;">
        </div>

        <!-- Modal body -->
        <div class="modal-body">
	        <div class = "row" style="margin:auto 0;"> 
		        <div class = "col-10" style="margin-left: 0;margin-right: 0;padding:0;">
		        <input type = "text" id = "schoolname">
		        </div>
				<div class = "col-2" style="margin-left: 0;margin-right: 0;padding:0;">
				<input type = "button" id = "realschoolsearch" value = "검색">
				</div>        
	        </div>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="button" class="button primary" data-dismiss="modal" value = "닫기">
        </div>

      </div>
    </div>
  </div> 