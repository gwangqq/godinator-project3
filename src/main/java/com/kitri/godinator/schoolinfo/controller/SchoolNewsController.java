package com.kitri.godinator.schoolinfo.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.model.SchoolNewsDto;
import com.kitri.godinator.schoolinfo.service.SchoolInfoCommonService;
import com.kitri.godinator.schoolinfo.service.SchoolNewsService;

@Controller
@RequestMapping("/schoolnews")
public class SchoolNewsController {

	@Autowired
	private SchoolInfoCommonService schoolInfoCommonService;
	
	@Autowired
	private SchoolNewsService schoolNewsService;
	
	@RequestMapping(value = "/viewnews", method = RequestMethod.GET)
	public String viewNewsPage() {
		System.out.println("viewnews");
		return "schoolinfo/schoolnews";
	}

	@RequestMapping(value = "/selectschool", method = RequestMethod.GET)
	@ResponseBody
	public String searchSchoolName(@RequestParam Map<String, String> parameter) {
		System.out.println(parameter.get("schoolCate") + " " + parameter.get("keyword"));
		JsonObject schoolNames = new JsonObject();
		JsonArray jsonArray = new JsonArray();
		String schoolCate = parameter.get("schoolCate");
		if(schoolCate != null && "hscool".equals(schoolCate)) {
			List<HSchoolDto> list = schoolInfoCommonService.selectHSchoolName(parameter);
				for(Object h : list) {
					if(h != null) {
						JsonObject school = new JsonObject();
						String schoolName = ((HSchoolDto)h).getSchoolName();
						String schoolCode = ((HSchoolDto)h).getSchoolCode();
						school.addProperty("schoolName", schoolName);
						school.addProperty("schoolCode", schoolCode);
						jsonArray.add(school);
					}
				}	
			schoolNames.add("schoolNames", jsonArray);
		} else if(schoolCate != null && "uscool".equals(schoolCate)) {
			List<USchoolDto> list = schoolInfoCommonService.selectUSchoolName(parameter);
				for(Object h : list) {
					if(h != null) {
						JsonObject school = new JsonObject();
						String schoolName = ((USchoolDto)h).getName();
						String schoolCode = ((USchoolDto)h).getCode();
						school.addProperty("schoolName", schoolName);
						school.addProperty("schoolCode", schoolCode);
						jsonArray.add(school);
					}
				}
			schoolNames.add("schoolNames", jsonArray);
		}
//		jsonArray.add(string);
		System.out.println("schoolNames.toString() : "+schoolNames.toString());
		if(jsonArray.size() != 0)
			return schoolNames.toString();
		else 
			return "false";
	}
	
	@RequestMapping(value = "/searchnews", method = RequestMethod.POST)
	@ResponseBody
	public String searchNews(@RequestBody Map<String, String> parameter) {
		System.out.println("searchnews keyWord : " + parameter.get("keyWord"));
		String keyWord = parameter.get("keyWord");
		String encodeKeyWord = "";
		List<SchoolNewsDto> list = new ArrayList<SchoolNewsDto>();
		try {
			encodeKeyWord = URLEncoder.encode(keyWord, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String nextGoogleURL = parameter.get("nextGoogle");
		String nextNaverURL = parameter.get("nextNaver");
		
		String nextGoogle = googleNews(encodeKeyWord, list, nextGoogleURL);
		String nextNaver = naverNews(encodeKeyWord, list, nextNaverURL);
		
		Collections.sort(list);
		
		for(SchoolNewsDto s : list) {
			System.out.println(s.getDate());
		}
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		JsonArray jsonArray = new JsonArray();
		for (SchoolNewsDto s : list) {
			jsonArray.add(gson.toJsonTree(s));
		}
		jsonObject.add("schoolnews", jsonArray);
		jsonObject.addProperty("nextGoolgle", nextGoogle);
		jsonObject.addProperty("nextNaver", nextNaver);
		System.out.println(jsonObject.toString());
		return jsonObject.toString();
	}

	public String googleNews(String encodeKeyWord, List<SchoolNewsDto> list, String nextUrl) {
		System.out.println("google search");
		String prefix = "https://www.google.com/search?q=";
		String suffix = "&tbm=nws&tbas=0&source=lnt&sa=X&ved=0ahUKEwjS9d3zko7jAhXHUrwKHcX2AgYQpwUIHg&biw=1920&bih=937&dpr=1";
		String requestUrl = "";
		if(nextUrl == null || nextUrl.isEmpty()) {
			requestUrl = prefix + encodeKeyWord + suffix;
		} else {
			requestUrl = nextUrl;
		}
		try {

			Document doc = Jsoup.connect(requestUrl).get();
			Elements elements = doc.getElementsByClass("g");

			for (Element e : elements) {
				System.out.println("------------------------------google------------------------" + e.hashCode());
				SchoolNewsDto newsDto = new SchoolNewsDto();
				Element a = e.getElementsByTag("a").first();
				Elements divSpan = e.getElementsByClass("slp");
				Elements divSt = e.getElementsByClass("st");
				Elements span = divSpan.get(0).getElementsByTag("span");
				// url
				String url = a.attr("href");
				newsDto.setUrl(url);
				System.out.println("url : " + url);
				// imgUrl
				if (a.getElementsByTag("img").size() != 0) {
					String imgUrl = a.getElementsByTag("img").first().attr("src");
					newsDto.setImgUrl(imgUrl);
					System.out.println("imgUrl : " + imgUrl);
				}

				// subject
				String subject = a.text();
				newsDto.setSubject(subject);
				System.out.println("subject : " + subject);
				// press
				String press = span.get(0).text();
				newsDto.setPress(press);
				System.out.println("press : " + press);
				// date
				String date = span.get(2).text();
				newsDto.setDate(date);
				System.out.println("date : " + date);
				// detail
				String detail = divSt.get(0).text();
				newsDto.setDetail(detail);
				System.out.println("detail : " + detail + "\n");
				list.add(newsDto);
//				System.out.println(newsDto);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	public String naverNews(String encodeKeyWord, List<SchoolNewsDto> list, String nextUrl) {
		System.out.println("naver search");
		String prefix = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=";
		String suffix = "";
		String requestUrl = "";
		if(nextUrl == null || nextUrl.isEmpty()) {
			requestUrl = prefix + encodeKeyWord + suffix;
		} else {
			requestUrl = nextUrl;
		}
		try {
			Document doc = Jsoup.connect(requestUrl).get();
			Element element = doc.getElementsByClass("mynews").first();
			Element paging = element.getElementsByClass("paging").first();
			Element ul = element.getElementsByClass("type01").first();
			Elements li = ul.select("ul.type01>li");
			System.out.println("newsElements.size(): "+li.size());
			for (Element e : li) {
				System.out.println("-------------------------------naver------------------------" + e.hashCode());
				SchoolNewsDto newsDto = new SchoolNewsDto();
				System.out.println("e :" + e);
				Element a = e.getElementsByClass("_sp_each_title").first();
				// url
				String url = a.attr("href");
				newsDto.setUrl(url);
				System.out.println("url : " + url);
				// imgUrl
				if (e.getElementsByTag("img").size() != 0) {
					String imgUrl = e.getElementsByTag("img").first().attr("src");
					newsDto.setImgUrl(imgUrl);
					System.out.println("imgUrl : " + imgUrl);
				}

				// subject
				String subject = a.text();
				newsDto.setSubject(subject);
				System.out.println("subject : " + subject);
				// press
				String press = e.getElementsByClass("_sp_each_source").text();
				newsDto.setPress(press);
				System.out.println("press : " + press);
				// date
				String date = e.getElementsByClass("txt_inline").first().ownText();
				newsDto.setDate(date);
				System.out.println("date : " + date);
				// detail
				String detail = e.getElementsByTag("dd").last().text();
				newsDto.setDetail(detail);
				System.out.println("detail : " + detail + "\n");
				// nextUrl
				nextUrl = paging.getElementsByTag("strong").first().nextElementSibling().attr("href");
				list.add(newsDto);
//				System.out.println(newsDto);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return nextUrl;
	}
}