<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<!-- modal 되는 link
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
-->
<style>
#memberlist {
   cursor: pointer;
}

#searchText {
   width: 130px;
   box-sizing: border-box;
   border: 2px solid #ccc;
   border-radius: 4px;
   font-size: 16px;
   background-color: white;
   background-image: url('');
   background-position: 10px 10px;
   background-repeat: no-repeat;
   padding: 12px 20px 12px 40px;
   -webkit-transition: width 0.4s ease-in-out;
   transition: width 0.4s ease-in-out;
}

#searchText {
   width: 100%;
}

#memberlist tr:hover {
	background-color: purple;
}

</style>

<script type="text/javascript">
//참고 : http://demo.webslesson.info/bootstrap-crud-php/ 

$(document).ready(function(){
   $("#memberlist tr").click(function() {
      //alert("학교정보 Click");
      //$.noConflict(); // 에러 없애기....없어지니..?
    
      window.open("/template/schoolmodify.jsp", "_blank", "width=600, height=700, left=500, top=20");
      return false;
   });
   
   $("#allowBtn").click(function() {
      alert("멘토로 승인하시겠습니까?");
      //window.close("/template/schoolmodify.jsp", "_blank", "width=600, height=700, left=500, top=20");
   });
   
   /* 전체 선택 및 해제 이벤트 */
	$(".allch").click(function(){
		var checked = $(this).is(":checked");
		if(checked){
			$(".ch").attr("checked", true);
		}else{
			$(".ch").attr("checked", false);			
		}
	});
});

</script>
<form class="form-inline" action="" style="padding-top: 50px; margin-bottom: 0px;">
<div class="col-9 col-12-small">
               <div class="col-2 col-4-small" style="float: right;">
                  <ul class="actions">
                     <li><a href="#" class="button primary icon"><i class="fas fa-search"></i></a></li>
                  </ul>
               <div class="col-0 col-8-small" style="float: right;">
               </div>
               </div>
               
               <div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float: right;">
                  <input type="email" name="demo-email" id="demo-email" value="" placeholder="ID나 이름을 입력하세요" />
               </div>
               <div class="col-7 col-7-small" style="float: right;">
                   <select name="school-cate2" id="school-cate2">
                     <option value="0">이름</option>
                     <option value="1">ID</option>
                  </select>
               </div>
            </div>
   </form>
<!-- 여기 내 내용 width; 872.443 height; 110.653-->
<section>
   <div class="table-responsive-lg">

      <table class="table" id="memberlistTop">
         <thead>
            <tr>
               <th><input type="checkbox" class="allCheck"><label for="msg1" style="padding-left: 0.1em;"></label></th>
               <th>ID</th>
               <th>이름</th>
               <th>학교명</th>
               <th>이메일</th>
               <th>회원구분</th>
               <th>가입여부</th>
               <th>비고</th>
            </tr>
         </thead>

         <!-- 잠시 임시! -->
         <tbody id="memberlist">
            <tr>
               <td><input type="checkbox" class="check"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>mnmm97</td>
               <td>조윤영</td>
               <td>Harvard University</td>
               <td>claire97j@naver.com</td>
               <td>멘토<img src="/images/crowns.png" width="30" height="30"></td>
               <td>2019/06/25</td>
               <td>
               </td>

            </tr>
            <tr>
               <td><input type="checkbox" class="check"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>makmirae</td>
               <td>박미래</td>
               <td>Oxford University</td>
               <td>mirae@gmail.com</td>
               <td>학생</td>
               <td>2019/03/03</td>
               <td>
                  <input type="button" value="멘토승인" id="allowBtn">
               </td>
            </tr>
         </tbody>

      </table>
   </div>
</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>