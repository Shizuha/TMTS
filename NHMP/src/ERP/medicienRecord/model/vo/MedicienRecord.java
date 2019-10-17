package ERP.medicienRecord.model.vo;

public class MedicienRecord implements java.io.Serializable{
	private static final long serialVersionUID = 6002L;
	
	 private int mrNo;
	 private java.sql.Date mrDate;
	 private String mrState;
	 private String mrName;
	 private String mrTime;
	 private String mrMany;
	 private String mrComment;
	 private String mrPatName;
	 private String mrEmpName;
	
	public MedicienRecord () {}
	
	public MedicienRecord(int mrNo, java.sql.Date mrDate, String mrState, String mrName, String mrTime, String mrMany,
										String mrComment, String mrPatName, String mrEmpName) {
		super();
		this.mrNo = mrNo;
		this.mrDate = mrDate;
		this.mrState = mrState;
		this.mrName = mrName;
		this.mrTime = mrTime;
		this.mrMany = mrMany;
		this.mrComment = mrComment;
		this.mrPatName = mrPatName;
		this.mrEmpName = mrEmpName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getMrNo() {
		return mrNo;
	}

	public java.sql.Date getMrDate() {
		return mrDate;
	}

	public String getMrState() {
		return mrState;
	}

	public String getMrName() {
		return mrName;
	}

	public String getMrTime() {
		return mrTime;
	}

	public String getMrMany() {
		return mrMany;
	}

	public String getMrComment() {
		return mrComment;
	}

	public String getMrPatName() {
		return mrPatName;
	}

	public String getMrEmpName() {
		return mrEmpName;
	}

	public void setMrNo(int mrNo) {
		this.mrNo = mrNo;
	}

	public void setMrDate(java.sql.Date mrDate) {
		this.mrDate = mrDate;
	}

	public void setMrState(String mrState) {
		this.mrState = mrState;
	}

	public void setMrName(String mrName) {
		this.mrName = mrName;
	}

	public void setMrTime(String mrTime) {
		this.mrTime = mrTime;
	}

	public void setMrMany(String mrMany) {
		this.mrMany = mrMany;
	}

	public void setMrComment(String mrComment) {
		this.mrComment = mrComment;
	}

	public void setMrPatName(String mrPatName) {
		this.mrPatName = mrPatName;
	}

	public void setMrEmpName(String mrEmpName) {
		this.mrEmpName = mrEmpName;
	}

	@Override
	public String toString() {
		return "MedicienRecord [mrNo=" + mrNo + ", mrDate=" + mrDate + ", mrState=" + mrState + ", mrName=" + mrName
				+ ", mrTime=" + mrTime + ", mrMany=" + mrMany + ", mrComment=" + mrComment + ", mrPatName=" + mrPatName
				+ ", mrEmpName=" + mrEmpName + "]";
	}
	
}
