package kh.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
	public static void main(String[] args) {
		String str = "2018/07/14/15/54";
		String[] str2 = str.split("/");
		System.out.println(str2[0]);
		System.out.println(str2[1]);
		System.out.println(str2[2]);
		String str3 = str2[0] + "-" + str2[1] + "-" + str2[2];
		System.out.println(str2[3]);
		String str4 = str2[3] + ":" + str2[4] + ":" + "00";
		System.out.println(str2[4]);
		System.out.println(str3);
		System.out.println(str4);
		String str5 = str3 + " " + str4;
		String str6 = str2[0] + str2[1] + str2[2] + str2[3] + str2[4];
		System.out.println("str6:" + str6);
		
		SimpleDateFormat simpleFullDateFormat = new SimpleDateFormat("yyyyMMddHHmm");
		try {

		Date sDate01 =  simpleFullDateFormat.parse(str6);
		System.out.println(sDate01);
//		Date bDate02 = simpleFullDateFormat.parse(data02);
		// System.out.println(sDate01);
		// System.out.println(bDate02);
		// System.out.println(sDate01.getTime());
		// System.out.println(bDate02.getTime());
		// //int result = dbdt.insertTimetables(sDate01, bDate02);
		// DataSampleDto dsdto = new DataSampleDto();
		// dsdto.setStarttime(sDate01);
		// dsdto.setEndtime(bDate02);
		// int result = dbdt.insertTimetablesList(dsdto);
		// System.out.println(result);
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	// public int insertTimetablesList(DataSampleDto dsdto) throws Exception {
	// Connection cons = DBUtils.getConnection();
	// String sql = "insert into timetables values(?,?)";
	// PreparedStatement pst = cons.prepareStatement(sql);
	// pst.setTimestamp(1, new java.sql.Timestamp(dsdto.getStarttime().getTime()));
	// pst.setTimestamp(2, new java.sql.Timestamp(dsdto.getEndtime().getTime()));
	// int result = pst.executeUpdate();
	// cons.commit();
	// pst.close();
	// cons.close();
	// return result;
	// } <- 예시 DAO
}
