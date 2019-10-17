package ERP.counselingLog.model.vo;

public class CounselingLog implements java.io.Serializable{
	private static final long serialVersionUID = 6003L;
	private int clNo;
	private java.sql.Date clDate;
	private String clName;
	private String clType;
	private String clComment;
	private String clPatName;
	private String clEmpName;
	private String clOriginalFileName;
	private String clRenameFileName;
	
	public CounselingLog () {}

	public CounselingLog(int clNo, java.sql.Date clDate, String clName, String clType, String clComment, String clPatName,
									String clEmpName) {
		super();
		this.clNo = clNo;
		this.clDate = clDate;
		this.clName = clName;
		this.clType = clType;
		this.clComment = clComment;
		this.clPatName = clPatName;
		this.clEmpName = clEmpName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getClNo() {
		return clNo;
	}

	public java.sql.Date getClDate() {
		return clDate;
	}

	public String getClName() {
		return clName;
	}

	public String getClType() {
		return clType;
	}

	public String getClComment() {
		return clComment;
	}

	public String getClPatName() {
		return clPatName;
	}

	public String getClEmpName() {
		return clEmpName;
	}
	
	public String getClOriginalFileName() {
		return clOriginalFileName;
	}
	
	public String getClRenameFileName() {
		return clRenameFileName;
	}

	public void setClNo(int clNo) {
		this.clNo = clNo;
	}

	public void setClDate(java.sql.Date clDate) {
		this.clDate = clDate;
	}

	public void setClName(String clName) {
		this.clName = clName;
	}

	public void setClType(String clType) {
		this.clType = clType;
	}

	public void setClComment(String clComment) {
		this.clComment = clComment;
	}

	public void setClPatName(String clPatName) {
		this.clPatName = clPatName;
	}

	public void setClEmpName(String clEmpName) {
		this.clEmpName = clEmpName;
	}
	
	public void setClOriginalFileName(String clOriginalFileName) {
		this.clOriginalFileName = clOriginalFileName;
	}
	
	public void setClRenameFileName(String clRenameFileName) {
		this.clRenameFileName = clRenameFileName;
	}

	@Override
	public String toString() {
		return "CounselingLog [clNo=" + clNo + ", clDate=" + clDate + ", clName=" + clName + ", clType=" + clType
				+ ", clComment=" + clComment + ", clPatName=" + clPatName + ", clEmpName=" + clEmpName 
				+ ", clOriginalFileName" + clOriginalFileName + ", clRenameFileName" + clRenameFileName + "]";
	}
	
}
