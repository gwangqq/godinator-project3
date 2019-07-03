package com.kitri.godinator.user.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/zipcode")
public class ZipcodeSearchController {
	
	@RequestMapping(value="/zipSearch", method=RequestMethod.POST)
	public void zipSearch(HttpServletRequest request, HttpServletResponse response) {
		  String currentPage = request.getParameter("currentPage");    //요청 변수 설정 (현재 페이지. currentPage : n > 0)
			String countPerPage = request.getParameter("countPerPage");  //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
			String resultType = request.getParameter("resultType");      //요청 변수 설정 (검색결과형식 설정, json)
			String confmKey = request.getParameter("confmKey");          //요청 변수 설정 (승인키)
			String keyword = request.getParameter("keyword");            //요청 변수 설정 (키워드)
			// OPEN API 호출 URL 정보 설정
			String apiUrl;
			try {
				apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+""
						+ "&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey+"&resultType="+resultType;
				URL url = new URL(apiUrl);
				BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
				StringBuffer sb = new StringBuffer();
				String tempStr = null;
				
				while(true){
					tempStr = br.readLine();
					if(tempStr == null) break;
					sb.append(tempStr);								// 응답결과 JSON 저장
				}
				br.close();
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/xml");
				response.getWriter().write(sb.toString());			// 응답결과 반환
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	}

