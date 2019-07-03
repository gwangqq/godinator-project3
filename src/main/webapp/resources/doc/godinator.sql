ALTER TABLE reply
	DROP
		CONSTRAINT FK_board_TO_reply
		CASCADE;

ALTER TABLE reply
	DROP
		CONSTRAINT FK_member_TO_reply
		CASCADE;

ALTER TABLE board
	DROP
		CONSTRAINT FK_category_TO_board
		CASCADE;

ALTER TABLE board
	DROP
		CONSTRAINT FK_member_TO_board
		CASCADE;

ALTER TABLE mentor
	DROP
		CONSTRAINT FK_member_TO_mentor
		CASCADE;

ALTER TABLE love
	DROP
		CONSTRAINT FK_board_TO_love
		CASCADE;

ALTER TABLE love
	DROP
		CONSTRAINT FK_reply_TO_love
		CASCADE;

ALTER TABLE love
	DROP
		CONSTRAINT FK_member_TO_love
		CASCADE;

ALTER TABLE user_prefer
	DROP
		CONSTRAINT FK_member_TO_user_prefer
		CASCADE;

ALTER TABLE eval_school
	DROP
		CONSTRAINT FK_member_TO_eval_school
		CASCADE;

ALTER TABLE eval_ud_log
	DROP
		CONSTRAINT FK_member_TO_eval_ud_log
		CASCADE;

ALTER TABLE eval_ud_log
	DROP
		CONSTRAINT FK_eval_school_TO_eval_ud_log
		CASCADE;

ALTER TABLE edit
	DROP
		CONSTRAINT FK_board_TO_edit
		CASCADE;

ALTER TABLE edit
	DROP
		CONSTRAINT FK_member_TO_edit
		CASCADE;

ALTER TABLE report
	DROP
		CONSTRAINT FK_board_TO_report
		CASCADE;

ALTER TABLE report
	DROP
		CONSTRAINT FK_reply_TO_report
		CASCADE;

ALTER TABLE report
	DROP
		CONSTRAINT FK_report_cate_TO_report
		CASCADE;

ALTER TABLE bbs
	DROP
		CONSTRAINT FK_board_TO_bbs
		CASCADE;

ALTER TABLE search_log
	DROP
		CONSTRAINT FK_member_TO_search_log
		CASCADE;

ALTER TABLE msg
	DROP
		CONSTRAINT FK_member_TO_msg2
		CASCADE;

ALTER TABLE msg
	DROP
		CONSTRAINT FK_member_TO_msg
		CASCADE;

ALTER TABLE category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE u_school
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE reply
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE report_cate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE visit
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE love
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE user_prefer
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE h_school
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE eval_school
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE edit
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE report
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE bbs
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE search_log
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE msg
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_category;

DROP INDEX PK_u_school;

DROP INDEX PK_reply;

DROP INDEX PK_report_cate;

DROP INDEX PK_member;

DROP INDEX PK_board;

DROP INDEX PK_visit;

DROP INDEX PK_love;

DROP INDEX PK_user_prefer;

DROP INDEX PK_h_school;

DROP INDEX PK_eval_school;

DROP INDEX PK_edit;

DROP INDEX PK_report;

DROP INDEX PK_bbs;

DROP INDEX PK_search_log;

DROP INDEX PK_msg;

DROP SEQUENCE ad_seq;

DROP SEQUENCE board_seq;

DROP SEQUENCE bbs_seq;

DROP SEQUENCE comment_seq;

DROP SEQUENCE like_seq;

DROP SEQUENCE report_seq;

DROP SEQUENCE edit_seq;

DROP SEQUENCE msg_seq;

CREATE SEQUENCE ad_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE board_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE bbs_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE comment_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE like_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE report_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE edit_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE SEQUENCE msg_seq
START WITH 1 INCREMENT BY 1 NOCACHE;

/* 카테고리 */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* 대학교 */
DROP TABLE u_school 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* 신고유형 */
DROP TABLE report_cate 
	CASCADE CONSTRAINTS;

/* 회원 */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 게시판 */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* 방문기록 */
DROP TABLE visit 
	CASCADE CONSTRAINTS;

/* 멘토 */
DROP TABLE mentor 
	CASCADE CONSTRAINTS;

/* 좋아요 */
DROP TABLE love 
	CASCADE CONSTRAINTS;

/* 회원선호도 */
DROP TABLE user_prefer 
	CASCADE CONSTRAINTS;

/* 고등학교 */
DROP TABLE h_school 
	CASCADE CONSTRAINTS;

/* 장단점 */
DROP TABLE eval_school 
	CASCADE CONSTRAINTS;

/* 공감로그 */
DROP TABLE eval_ud_log 
	CASCADE CONSTRAINTS;

/* 첨삭 */
DROP TABLE edit 
	CASCADE CONSTRAINTS;

/* 신고 */
DROP TABLE report 
	CASCADE CONSTRAINTS;

/* 자료게시판 */
DROP TABLE bbs 
	CASCADE CONSTRAINTS;

/* 검색기록 */
DROP TABLE search_log 
	CASCADE CONSTRAINTS;

/* 쪽지 */
DROP TABLE msg 
	CASCADE CONSTRAINTS;

/* 카테고리 */
CREATE TABLE category (
	category_no number NOT NULL, /* 카테고리번호 */
	catogroy_name varchar2(16) NOT NULL /* 카테고리이름 */
);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			category_no
		);

/* 대학교 */
CREATE TABLE u_school (
	code varchar2(20) NOT NULL, /* 학교코드 */
	name VARCHAR(50) NOT NULL, /* 학교명 */
	type varchar2(100), /* 학교종류 */
	estType  varchar2(50), /* 설립구분 */
	zipcode varchar2(5), /* 우편번호 */
	region varchar2(100), /* 지역 */
	address varchar2(200), /* 주소 */
	link varchar2(100), /* 홈페이지주소 */
	latitude varchar2(50), /* 위도 */
	longitude varchar2(50), /* 경도 */
	tel varchar2(20), /* 전화번호 */
	fax varchar2(20), /* 팩스번호 */
	eval1_avg number, /* 평가항목1 평균 */
	eval2_avg number, /* 평가항목2 평균 */
	eval3_avg number, /* 평가항목3 평균 */
	eval4_avg number, /* 평가항목4 평균 */
	eval5_avg number, /* 평가항목5 평균 */
	eval_cnt number /* 평가인원수 */
);

ALTER TABLE u_school
	ADD
		CONSTRAINT PK_u_school
		PRIMARY KEY (
			code
		);

/* 댓글 */
CREATE TABLE reply (
	comment_no number NOT NULL, /* 댓글번호 */
	board_no number, /* 글번호 */
	c_user_id varchar2(10), /* 작성자아이디 */
	c_postdate DATE NOT NULL, /* 작성시간 */
	comment_content CLOB NOT NULL, /* 내용 */
	state CHAR(1) /* 상태 */
);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			comment_no
		);

/* 신고유형 */
CREATE TABLE report_cate (
	code number NOT NULL, /* 신고코드 */
	subject varchar2(32) /* 신고유형 */
);

ALTER TABLE report_cate
	ADD
		CONSTRAINT PK_report_cate
		PRIMARY KEY (
			code
		);

/* 회원 */
CREATE TABLE member (
	user_id varchar2(10) NOT NULL, /* 회원아이디 */
	user_name varchar2(8) NOT NULL, /* 이름 */
	pass varchar2(10) NOT NULL, /* 비밀번호 */
	email varchar2(50), /* 이메일 */
	email_domain varchar2(50), /* 이메일도메인 */
	phone1 varchar2(3), /* 전화번호1 */
	phone2 varchar2(4), /* 전화번호2 */
	phone3 varchar2(4), /* 전화번호3 */
	zipcode varchar2(5), /* 우편번호 */
	address varchar2(100), /* 기본주소 */
	address_detail varchar2(100), /* 상세주소 */
	h_school_code varchar2(20), /* 고등학교코드 */
	h_school_cate varchar2(50), /* 고등학교 구분 */
	u_school_code varchar2(20), /* 대학교코드 */
	u_school_cate varchar2(50), /* 대학교 구분 */
	user_cate CHAR(1) NOT NULL, /* 회원구분 */
	join_date DATE, /* 가입일 */
	withdraw  CHAR(1) DEFAULT 'n', /* 탈퇴여부 */
	latitude varchar2(50), /* 위도 */
	longitude varchar2(50) /* 경도 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			user_id
		);

/* 게시판 */
CREATE TABLE board (
	board_no number NOT NULL, /* 글번호 */
	b_user_id varchar2(10) NOT NULL, /* 아이디 */
	board_category number, /* 카테고리번호 */
	user_name varchar2(8), /* 이름 */
	board_subject varchar2(50) NOT NULL, /* 제목 */
	board_content clob NOT NULL, /* 내용 */
	b_school_name varchar2(20) NOT NULL, /* 학교이름 */
	b_school_code VARCHAR(20) NOT NULL, /* 학교 코드  */
	b_school_cate1 CHAR(1), /* 학교 구분1 */
	b_school_cate2 VARCHAR(50), /* 학교 구분2 */
	region varchar2(20), /* 지역 */
	b_view_count number DEFAULT 0, /* 조회수 */
	del_stus CHAR(1) DEFAULT 0, /* 삭제여부 */
	state CHAR(1), /* 상태 */
	b_postdate DATE /* 작성시간 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			board_no
		);

/* 방문기록 */
CREATE TABLE visit (
	visti_date varchar(10) NOT NULL, /* 방문일자 */
	visti_cnt number DEFAULT 1 /* 방문자수 */
);

ALTER TABLE visit
	ADD
		CONSTRAINT PK_visit
		PRIMARY KEY (
			visti_date
		);

/* 멘토 */
CREATE TABLE mentor (
	user_id varchar2(10) NOT NULL, /* 회원아이디 */
	mentor CHAR(1) DEFAULT 'n', /* 멘토 */
	aprvl_date DATE, /* 승인일자 */
	cate CHAR(1) /* 구분 */
);

/* 좋아요 */
CREATE TABLE love (
	like_no number NOT NULL, /* 일련번호 */
	board_no number, /* 글번호 */
	user_id varchar2(10) NOT NULL, /* 회원아이디 */
	comment_no number, /* 댓글번호 */
	like_unlike CHAR(1) /* 좋아요싫어요 */
);

ALTER TABLE love
	ADD
		CONSTRAINT PK_love
		PRIMARY KEY (
			like_no
		);

/* 회원선호도 */
CREATE TABLE user_prefer (
	user_id varchar2(10) NOT NULL, /* 회원아이디 */
	h_eval1 number, /* 고등항목1 */
	h_eval2 number, /* 고등항목2 */
	h_eval3 number, /* 고등항목3 */
	h_eval4 NUMBER, /* 고등항목4 */
	h_eval5 number, /* 고등항목5 */
	u_eval1 number, /* 대학항목1 */
	u_eval2 number, /* 대학항목2 */
	u_eval3 number, /* 대학항목3 */
	u_eval4 number, /* 대학항목4 */
	u_eval5 number /* 대학항목5 */
);

ALTER TABLE user_prefer
	ADD
		CONSTRAINT PK_user_prefer
		PRIMARY KEY (
			user_id
		);

/* 고등학교 */
CREATE TABLE h_school (
	school_code varchar2(20) NOT NULL, /* 학교코드 */
	school_name VARCHAR(100), /* 학교명 */
	school_cate1 varchar2(100), /* 학교유형1 */
	school_cate2 varchar2(100), /* 학교유형2 */
	estbl_date DATE, /* 설립일 */
	zipcode varchar2(5), /* 우편번호 */
	address varchar2(100), /* 도로명주소 */
	address_detail varchar2(100), /* 상세주소 */
	latitude varchar2(50), /* 위도 */
	longitude varchar2(50), /* 경도 */
	phone varchar2(20), /* 전화번호 */
	fax varchar2(100), /* 팩스번호 */
	home_page varchar2(100), /* 홈페이지주소 */
	mw_cate varchar2(20), /* 남녀공학구분 */
	edu_office varchar2(50), /* 교육청 */
	estType  varchar2(50), /* 설립구분 */
	eval1_avg number, /* 평가항목1 평균 */
	eval2_avg number, /* 평가항목2 평균 */
	eval3_avg number, /* 평가항목3 평균 */
	eval4_avg number, /* 평가항목4 평균 */
	eval5_avg number, /* 평가항목5 평균 */
	eval_cnt number /* 평가인원수 */
);

ALTER TABLE h_school
	ADD
		CONSTRAINT PK_h_school
		PRIMARY KEY (
			school_code
		);

/* 장단점 */
CREATE TABLE eval_school (
	ad_no number NOT NULL, /* 일련번호 */
	ad_div CHAR(1), /* 장단점 */
	user_id varchar2(10), /* 회원아이디 */
	school_cate CHAR(1), /* 학교구분 */
	school_code varchar2(20), /* 학교코드 */
	advan clob, /* 장점 */
	disad clob, /* 단점 */
	upvote number, /* 공감 */
	downvote number, /* 비공감 */
	state CHAR(1) /* 상태 */
);

ALTER TABLE eval_school
	ADD
		CONSTRAINT PK_eval_school
		PRIMARY KEY (
			ad_no
		);

/* 공감로그 */
CREATE TABLE eval_ud_log (
	user_id varchar2(10), /* 회원아이디 */
	ad_no number, /* 장단점일련번호 */
	updown CHAR(1) /* 공감/비공감 */
);

/* 첨삭 */
CREATE TABLE edit (
	edit_no number NOT NULL, /* 일련번호 */
	board_no number, /* 글번호 */
	ref number, /* 그룹번호 */
	pseq number, /* 원글번호 */
	state CHAR(1), /* 완료여부 */
	mentee_id varchar2(10), /* 멘티 아이디 */
	mentor_id varchar2(10) /* 멘토 아이디 */
);

ALTER TABLE edit
	ADD
		CONSTRAINT PK_edit
		PRIMARY KEY (
			edit_no
		);

/* 신고 */
CREATE TABLE report (
	report_seq number NOT NULL, /* 일련번호 */
	code number, /* 신고코드 */
	rel_seq number, /* 해당일련번호 */
	report_time DATE /* 신고일 */
);

ALTER TABLE report
	ADD
		CONSTRAINT PK_report
		PRIMARY KEY (
			report_seq
		);

/* 자료게시판 */
CREATE TABLE bbs (
	bbs_no number NOT NULL, /* 일련번호 */
	board_no number, /* 글번호 */
	save_folder varchar2(8), /* 저장폴더 */
	orginal_name varchar2(100), /* 원본파일이름 */
	saved_name varchar2(100), /* 저장파일이름 */
	file_size number, /* 파일크기 */
	latitude number, /* 위도 */
	longitude number /* 경도 */
);

ALTER TABLE bbs
	ADD
		CONSTRAINT PK_bbs
		PRIMARY KEY (
			bbs_no
		);

/* 검색기록 */
CREATE TABLE search_log (
	school_code varchar2(20) NOT NULL, /* 학교코드 */
	user_id varchar2(10) NOT NULL, /* 회원아이디 */
	school_cate varchar2(50), /* 학교유형 */
	search_cnt number, /* 검색수 */
	search_date DATE /* 마지막검색시간 */
);

ALTER TABLE search_log
	ADD
		CONSTRAINT PK_search_log
		PRIMARY KEY (
			school_code,
			user_id
		);

/* 쪽지 */
CREATE TABLE msg (
	msg_no number NOT NULL, /* 일련번호 */
	send_id varchar2(10), /* 보낸사람 */
	recv_id varchar2(10), /* 받은사람 */
	send_date DATE, /* 송신일 */
	recv_date DATE, /* 수신일 */
	msg_title varchar2(200), /* 제목 */
	msg_content clob, /* 내용 */
	send_stus CHAR(1) DEFAULT 0, /* 송신자 보관 */
	recv_stus CHAR(1) DEFAULT 0 /* 수신자 보관 */
);

ALTER TABLE msg
	ADD
		CONSTRAINT PK_msg
		PRIMARY KEY (
			msg_no
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_member_TO_reply
		FOREIGN KEY (
			c_user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_category_TO_board
		FOREIGN KEY (
			board_category
		)
		REFERENCES category (
			category_no
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			b_user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE mentor
	ADD
		CONSTRAINT FK_member_TO_mentor
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE love
	ADD
		CONSTRAINT FK_board_TO_love
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);

ALTER TABLE love
	ADD
		CONSTRAINT FK_reply_TO_love
		FOREIGN KEY (
			comment_no
		)
		REFERENCES reply (
			comment_no
		);

ALTER TABLE love
	ADD
		CONSTRAINT FK_member_TO_love
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE user_prefer
	ADD
		CONSTRAINT FK_member_TO_user_prefer
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE eval_school
	ADD
		CONSTRAINT FK_member_TO_eval_school
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE eval_ud_log
	ADD
		CONSTRAINT FK_member_TO_eval_ud_log
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE eval_ud_log
	ADD
		CONSTRAINT FK_eval_school_TO_eval_ud_log
		FOREIGN KEY (
			ad_no
		)
		REFERENCES eval_school (
			ad_no
		);

ALTER TABLE edit
	ADD
		CONSTRAINT FK_board_TO_edit
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);

ALTER TABLE edit
	ADD
		CONSTRAINT FK_member_TO_edit
		FOREIGN KEY (
			mentee_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE report
	ADD
		CONSTRAINT FK_board_TO_report
		FOREIGN KEY (
			rel_seq
		)
		REFERENCES board (
			board_no
		);

ALTER TABLE report
	ADD
		CONSTRAINT FK_reply_TO_report
		FOREIGN KEY (
			rel_seq
		)
		REFERENCES reply (
			comment_no
		);

ALTER TABLE report
	ADD
		CONSTRAINT FK_report_cate_TO_report
		FOREIGN KEY (
			code
		)
		REFERENCES report_cate (
			code
		);

ALTER TABLE bbs
	ADD
		CONSTRAINT FK_board_TO_bbs
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);

ALTER TABLE search_log
	ADD
		CONSTRAINT FK_member_TO_search_log
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE msg
	ADD
		CONSTRAINT FK_member_TO_msg2
		FOREIGN KEY (
			send_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE msg
	ADD
		CONSTRAINT FK_member_TO_msg
		FOREIGN KEY (
			recv_id
		)
		REFERENCES member (
			user_id
		);