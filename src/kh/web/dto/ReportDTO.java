package kh.web.dto;

public class ReportDTO {
	private String report_caller;
	private String report_calleemember;
	private String report_calleegroup;
	private String report_reason;
	private int report_state;
	private String report_date;
	private int report_type;
	private int group_seq;

	public ReportDTO() {
		super();
	}

	public ReportDTO(String report_caller, String report_calleemember, String report_calleegroup, String report_reason,
			int report_state, String report_date, int report_type) {
		super();
		this.report_caller = report_caller;
		this.report_calleemember = report_calleemember;
		this.report_calleegroup = report_calleegroup;
		this.report_reason = report_reason;
		this.report_state = report_state;
		this.report_date = report_date;
		this.report_type = report_type;
	}

	
	public String getReport_caller() {
		return report_caller;
	}

	public void setReport_caller(String report_caller) {
		this.report_caller = report_caller;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public int getReport_state() {
		return report_state;
	}

	public void setReport_state(int report_state) {
		this.report_state = report_state;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}

	public int getReport_type() {
		return report_type;
	}

	public void setReport_type(int report_type) {
		this.report_type = report_type;
	}

	public String getReport_calleemember() {
		return report_calleemember;
	}

	public void setReport_calleemember(String report_calleemember) {
		this.report_calleemember = report_calleemember;
	}

	public String getReport_calleegroup() {
		return report_calleegroup;
	}

	public void setReport_calleegroup(String report_calleegroup) {
		this.report_calleegroup = report_calleegroup;
	}

	public int getGroup_seq() {
		return group_seq;
	}

	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}


}
