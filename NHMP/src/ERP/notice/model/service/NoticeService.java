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


}
