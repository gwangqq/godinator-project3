<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f22525e443605fce310be835dea5bdc2&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
  
  <div class="modal fade" id="mapModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <input type="button" class="button close" data-dismiss="modal" value="&times;" style="width:10;height:10;padding-top: 0;">
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<div class = "row">
         	<div class = "col-12" id = "map">
         	
         	</div>
         	<div class = "col-12"></div>
       		</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="button" class="button" data-dismiss="modal" value = "Close">
        </div>
        
      </div>
    </div>
  </div>