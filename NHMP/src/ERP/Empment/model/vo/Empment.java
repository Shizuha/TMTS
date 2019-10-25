package ERP.Empment.model.vo;

import java.io.Serializable;

public class Empment implements Serializable{

	private static final long serialVersionUID = 5777L;
	private String empmentCode;
	private String empmentName;
	
	public Empment() {}

	public Empment(String empmentCode, String empmentName) {
		super();
		this.empmentCode = empmentCode;
		this.empmentName = empmentName;
	}

	public String getEmpmentCode() {
		return empmentCode;
	}

	public void setEmpmentCode(String empmentCode) {
		this.empmentCode = empmentCode;
	}

	public String getEmpmentName() {
		return empmentName;
	}

	public void setEmpmentName(String empmentName) {
		this.empmentName = empmentName;
	}

	@Override
	public String toString() {
		return "Empment [empmentCode=" + empmentCode + ", empmentName=" + empmentName + "]";
	}
}
