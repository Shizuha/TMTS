package Main.Comment.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import Main.Comment.model.dao.CommentDao;
import Main.Comment.model.vo.Comment;

public class CommentService {
	private CommentDao CDao = new CommentDao();

	public Comment deleteComment() {
		Connection conn = getConnection();
		CDao.deleteCommnet();
		return null;
	}

	public Comment insertComment() {
		CDao.insertComment();
		return null;
	}

	public Comment updateComment() {
		CDao.updateComment();
		return null;
	}
}
