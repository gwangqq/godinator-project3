<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   
   #myModal {
      display: none;
   }
   
   #schoollist tr:hover {
	background-color: purple;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#search").click(function() {
		alert('검색눌렀니?');
	});
});

</script>


<!-- 여기 내 내용 width; 872.443 height; 110.653-->
<!-- 
   <section>
   나중에 전체학교 수 등 정보 뿌리기
   </section>
-->

<form class="form-inline" action="" style="padding-top: 50px; margin-bottom: 0px;">
	<div class="col-9 col-12-small">
		<div class="col-2 col-4-small" style="float: right;">
			<ul class="actions">
				<li><a href="#" class="button primary icon"><i class="fas fa-search" id="search"></i></a></li>
            </ul>
        	<div class="col-0 col-8-small" style="float: right;"></div>
   		 </div>
               
	    <div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float: right;">
	    	<input type="email" name="demo-email" id="demo-email" value="" placeholder="학교명을 입력하세요" />
	    </div>
	    
	    <div class="col-7 col-7-small" style="float: right;">
			<select name="school-cate2" id="school-cate2">
				<option value="0">학교명</option>
				<option value="1">지역</option>
	        </select>
	     </div>
    </div>
</form>

<section style="padding-top: 0px;">
   <div class="table-responsive-lg">
      <table class="table" id="schoollistTop">
         <thead>
            <tr>
               <td><input type="checkbox"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>구분</td>
               <th>학교유형</th>
               <th>학교유형2</th>
               <th>학교명</th>
               <th>학교주소</th>
               <th>현재 멘토수</th>
               <th>비고</th>
            </tr>
         </thead>

         <!-- 잠시 임시! -->
         <tbody id="schoollist">
            <tr>
               <td><input type="checkbox"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>1</td>
               <td>대학교</td>
               <td>일반대학</td>
               <td>University of Harvard</td>
               <td>Holyoke Center, 1350 Massachusetts Avenue, Boston</td>
               <td>35</td>
               <td><button type="button" class="btn btn-primary" id="deleteBtn">삭제</button></td>
            </tr>
            <tr>
               <td><input type="checkbox"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>2</td>
               <td>고등학교</td>
               <td>과학고</td>
               <td>서울과학고등학교</td>
               <td>서울특별시 종로구 명륜1가 혜화로 63</td>
               <td>1</td>
               <td><button type="button" class="btn btn-primary" id="deleteBtn">삭제</button></td>
            </tr>
         </tbody>

      </table>
   </div>
</section>

  <!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>