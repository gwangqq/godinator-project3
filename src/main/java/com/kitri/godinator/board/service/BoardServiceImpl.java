package com.kitri.godinator.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.godinator.board.controller.NumberCheck;
import com.kitri.godinator.board.dao.BoardCommonDao;
import com.kitri.godinator.board.dao.BoardDao;
import com.kitri.godinator.model.BoardConstance;
import com.kitri.godinator.model.BbsDto;
import com.kitri.godinator.model.CategoryDto;
import com.kitri.godinator.model.LoveDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession sqlSession;

	// main 페이지 커뮤니티 menu

	@Override
	public List<CategoryDto> menuList() {
		return sqlSession.getMapper(BoardDao.class).getBoardMenuList();
	}

	// 고등학교 찾기 메소드
	@Override
	public String findHSchool(String schoolName) {
		List<String> list = sqlSession.getMapper(BoardDao.class).findHSchool(schoolName);
		JSONArray array = new JSONArray(list);
		JSONObject json = new JSONObject();
		json.put("hSchoolList", array);
		return json.toString();
	}

	// 대학찾기 메소드
	@Override
	public String findUSchool(String schoolName) {
		List<String> list = sqlSession.getMapper(BoardDao.class).findUSchool(schoolName);
		JSONArray array = new JSONArray(list);
		JSONObject json = new JSONObject();
		json.put("uSchoolList", array);
		return json.toString();
	}

//	기본 글 쓰기 메소드
	@Override
	public int writeArticle(BbsDto bbsDto) {
		int cnt = sqlSession.getMapper(BoardDao.class).writeArticle(bbsDto);
		return cnt != 0 ? bbsDto.getBoardNo() : 0;
	}

//page처리 + 게시판 list 보기
	@Override
	public List<BbsDto> listArticle(Map<String, String> parameter) {
		int pg = NumberCheck.NotNumberToOne(parameter.get("pg"));
		int end = pg * BoardConstance.ARTICLE_SIZE;
		int start = end - BoardConstance.ARTICLE_SIZE;

		parameter.put("start", start + "");
		parameter.put("end", end + "");

		return sqlSession.getMapper(BoardDao.class).listArticle(parameter);
	}

//	list에서 작성 된 글 보기
	@Override
	@Transactional
	public BbsDto viewArticle(int boardNo) {
		// 조회수 증가
		sqlSession.getMapper(BoardCommonDao.class).updateViewCount(boardNo);
		// 글쓴 내용 가져오기
		BbsDto bbsDto = sqlSession.getMapper(BoardDao.class).viewArticle(boardNo);
//		System.out.println("service view : " + BbsDto);
		bbsDto.setBoardContent(bbsDto.getBoardContent().replace("\n", "<br>"));
		return bbsDto;
	}

// 수정에서 사용할 게시물 가져오기
	@Override
	public BbsDto getArticle(int boardNo) {
		return sqlSession.getMapper(BoardDao.class).viewArticle(boardNo);
	}

	// 게시물 수정 버튼 누르기
	@Override
	public int modifyArticle(BbsDto bbsDto) {
		int cnt = sqlSession.getMapper(BoardDao.class).modifyArticle(bbsDto);
		return cnt != 0 ? bbsDto.getBoardNo() : 0;
	}

//	이전글 보기
	@Override
	@Transactional
	public BbsDto prevArticle(Map<String, String> parameter) {
		int cnt = sqlSession.getMapper(BoardDao.class).prevArticle(parameter);
		sqlSession.getMapper(BoardCommonDao.class).updateViewCount(cnt);
		BbsDto bbsDto = sqlSession.getMapper(BoardDao.class).viewArticle(cnt);
		bbsDto.setBoardContent(bbsDto.getBoardContent().replace("\n", "<br>"));
		parameter.put("boardNo", Integer.toString(cnt));
		
		return bbsDto;
	}

//이전글 있는지 확인
	@Override
	public int checkPrev(Map<String, String> parameter) {
		return sqlSession.getMapper(BoardDao.class).prevArticle(parameter);
	}

//다음글 보기	
	@Override
	@Transactional
	public BbsDto nextArticle(Map<String, String> parameter) {
		int cnt = sqlSession.getMapper(BoardDao.class).nextArticle(parameter);
		sqlSession.getMapper(BoardCommonDao.class).updateViewCount(cnt);
		BbsDto bbsDto = sqlSession.getMapper(BoardDao.class).viewArticle(cnt);
		bbsDto.setBoardContent(bbsDto.getBoardContent().replace("\n", "<br>"));
		parameter.put("boardNo", Integer.toString(cnt));
		
		return bbsDto;
	}
	
//다음글 있는지 확인 
	@Override
	public int checkNext(Map<String, String> parameter) {
		return sqlSession.getMapper(BoardDao.class).nextArticle(parameter);
	}

	@Override
	public void deleteArticle(int boardNo) {
		sqlSession.getMapper(BoardDao.class).deleteArticle(boardNo);
	}

	@Override
	@Transactional
	public String likeCount(LoveDto loveDto) {
		String check = "";
		
		
		
		
		//좋아요 확인 (0: 좋아요 안했음 -> insert / 1: 좋아요 했음 ->update)
		int likeResult = sqlSession.getMapper(BoardDao.class).isLike(loveDto);
		System.out.println("좋아요 눌렀나 확인: " + likeResult);
		
		if(likeResult == 0) {
			//좋아요 확인 후 insert(좋아요 누를 때)
			int firstClick = sqlSession.getMapper(BoardDao.class).insertLike(loveDto);
			System.out.println("좋아요 눌렀음 : "+  firstClick);
			return check = "like";
			
		} else if (likeResult ==1) {
			//좋아요 확인 후 update(누른 좋아요 취소할 때)
			int cancelLike = sqlSession.getMapper(BoardDao.class).deleteLike(loveDto);
			System.out.println("좋아요 취소했다 : " + cancelLike);
			return check = "likeCancel";
			
		}
		
		
		return check;
	}

	


}
