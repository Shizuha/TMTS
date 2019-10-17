package ERP.Calendar.Model.vo;

public class Calendar implements java.io.Serializable {

	private static final long serialVersionUID = 7000L;
	
	private int calnum;
	private String empid;
	private String title;
	private String startdate;
	private String enddate;
	private String calendarcontent;
	
	public Calendar() {}

	public Calendar(int calnum, String empid, String title, String startdate, String enddate, String calendarcontent) {
		super();
		this.calnum = calnum;
		this.empid = empid;
		this.title = title;
		this.startdate = startdate;
		this.enddate = enddate;
		this.calendarcontent = calendarcontent;
	}

	public int getCalnum() {
		return calnum;
	}

	public void setCalnum(int calnum) {
		this.calnum = calnum;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getCalendarcontent() {
		return calendarcontent;
	}

	public void setCalendarcontent(String calendarcontent) {
		this.calendarcontent = calendarcontent;
	}

	@Override
	public String toString() {
		return "Calendar [calnum=" + calnum + ", empid=" + empid + ", title=" + title + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", calendarcontent=" + calendarcontent + "]";
	}
	
}
