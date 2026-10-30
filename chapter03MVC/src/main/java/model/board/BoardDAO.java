package model.board;

import java.sql.*;
import java.util.ArrayList;

import DBPKG.*;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// board 데이터 시작행~끝행의 개수를 리턴하는 메소드 
	public ArrayList<BoardDTO> getAllboard(int startRow, int pageSize) {
		ArrayList<BoardDTO> a = new ArrayList<BoardDTO>();
		try {
			con = Util.getConnection();
			// 쿼리문
			String sql = "select * from board order by ref desc limit ?,?";
			// 쿼리실행
			pstmt = con.prepareStatement(sql);
			// ? 에 대입하기
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			// 쿼리실행
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setReg_date(rs.getString(6));
				bdto.setRef(rs.getInt(7));
				bdto.setRe_step(rs.getInt(8));
				bdto.setReadcount(rs.getInt(9));
				bdto.setContent(rs.getString(10));
				bdto.setId(rs.getString(11));
				
				// 데이터 추가 (ArrayList<BoardDTO> 에 담기)
				a.add(bdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return a;
	}
	
	// board의 전체 개수를 리턴하는 메소드 작성
	// 메소드 이름 : getAllCount()
	public int getAllCount() {
		int count = 0;
		try {
			con = Util.getConnection();
			// 쿼리문
			String sql = "select count(*) from board";
			// 쿼리실행
			pstmt = con.prepareStatement(sql);
			// 쿼리실행
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return count;
	}
	

	// 하나의 게시글을 삽입하는 메소드 작성
	// 메소드 이름 : insertBoard()
	public void insertBoard(BoardDTO bdto) {
		// ref, re_step : 초기값 지정
		int ref=0;
		int re_step=0;
		try {
			con = Util.getConnection();
			// ref의 최대값을 검색해서 +1을 하는 select문 필요
			String sql = "select max(ref) from board";
			// 실행객체 생성
			pstmt = con.prepareStatement(sql);
			// 실행
			rs=pstmt.executeQuery();
			if(rs.next()) {
				// 찾은게 7이면 +1 을 해서 ref 는 8이 된다.
				ref=rs.getInt(1)+1;
			}
			
			// 인서트 하는 쿼리문 시작
			String sql02 = "insert into board values(null,?,?,?,?,current_date(),?,?,0,?,?)";
			// 실행객체 생성
			pstmt = con.prepareStatement(sql02);
			// ?에 대입
			pstmt.setString(1, bdto.getWriter());
			pstmt.setString(2, bdto.getEmail());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setString(7, bdto.getContent());
			pstmt.setString(8, bdto.getId());
			
			// 실행쿼리
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
	}
	
	// 해당 게시글 불러오는 메소드(select 쿼리 이용)
	// 게시글이 클릭될때마다, 조회수가 증가되어야 함(update쿼리)
	public BoardDTO getOneBoard(int num) {
		BoardDTO bdto = new BoardDTO();
		try {
			// DB연결
			con = Util.getConnection();
			// 조회수 증가하는 쿼리문 작성 업데이트
			String upsql = "update board set readcount=readcount+1 where num=?";
			// 실행할 쿼리 객체 선언
			pstmt = con.prepareStatement(upsql);
			// ? 대응
			pstmt.setInt(1, num);
			// 쿼리 실행
			pstmt.executeUpdate();
			
			// 하나의 게시글 검색하는 쿼리문 작성
			// select sql문 작성
			String sql = "select * from board where num=?";
			// 실행할 쿼리 객체 선언
			pstmt = con.prepareStatement(sql);
			// ? 대입 => ?란 DB에 들어가는 값을 말한다.
			pstmt.setInt(1, num);
			// 쿼리 실행
			rs = pstmt.executeQuery();
			// 현재 커서는 앞에 존재하므로, next()로 다음 데이터를 찾아간다.
			if(rs.next()) {
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setReg_date(rs.getString(6));
				bdto.setRef(rs.getInt(7));
				bdto.setRe_step(rs.getInt(8));
				bdto.setReadcount(rs.getInt(9));
				bdto.setContent(rs.getString(10));
				bdto.setId(rs.getString(11));
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(bdto.getId());
		}finally {
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return bdto;
	}
	
}
