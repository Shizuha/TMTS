package Main.Cnotice.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import Main.Cnotice.model.dao.CnoticeDao;
import Main.Cnotice.model.vo.Cnotice;

public class CnoticeService {
	private CnoticeDao CADao = new CnoticeDao();

	public Cnotice deleteNotice() {
		Connection conn = getConnection();
		CADao.deleteNotice();
		return null;
	}

	public Cnotice insertNotice() {
		Connection conn = getConnection();
		CADao.insertNotice();
		return null;
	}

	public ArrayList<Cnotice> selectList() {
		Connection conn = getConnection();
		CADao.selectList();
		return null;
	}

	public Cnotice updatetNotice() {
		Connection conn = getConnection();
		CADao.updateNotice();
		return null;
	}
}
