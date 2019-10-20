package ERP.notice.model.service;

import ERP.notice.model.dao.NoticeDao;
import ERP.notice.model.vo.Notice;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.*;


public class NoticeService {
	private NoticeDao ndao = new NoticeDao();  //DI(의존성 주입)
	
	public NoticeService() {}
	
	public ArrayList<Notice> selectAll(){
		Connection conn = getConnection();
		ArrayList<Notice> list = ndao.selectAll(conn);
		close(conn);
		return list;
	}

	public Notice selectOne(int noticeNo) {
		Connection conn = getConnection();
		Notice notice = ndao.selectOne(conn, noticeNo);
		close(conn);
		return notice;
	}

	
	//조회수 증가 위한 메소드
	public int updateReadCount(int noticeNo) {
		
				Connection conn = getConnection();
				int result = ndao.updateReadCount(conn, noticeNo);
				if (result > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
				close(conn);
				return result;
	}
	
	//조회수 패이징
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = ndao.getListCount(conn);
		close(conn);
		return listCount;
	}
	
	//10개의 행만 조회처리 하는 서비스
	public ArrayList<Notice> selectList(int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Notice> list = ndao.selectList(conn, startRow, endRow);
		close(conn);
		return list;
	}
	
	
	
	
}









