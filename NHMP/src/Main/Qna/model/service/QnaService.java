package Main.Qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import Main.Qna.model.dao.QnaDao;
import Main.Qna.model.vo.Qna;

public class QnaService {
	private QnaDao QDao = new QnaDao();
	
	public Qna updateQna() {
		Connection conn = getConnection();
		QDao.updateQna();
		return null;
	}

	public ArrayList<Qna> selectList() {
		QDao.selectList();
		return null;
	}

	public Qna insertQna() {
		QDao.insertQna();
		return null;
	}

	public Qna detailQna() {
		QDao.detailQna();
		return null;
	}

	public Qna deleteQna() {
		QDao.deleteQna();
		return null;
	}

}
