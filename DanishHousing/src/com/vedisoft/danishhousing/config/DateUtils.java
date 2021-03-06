package com.vedisoft.danishhousing.config;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class DateUtils {
	public static java.util.Date acceptDate() {
		java.util.Date dt = null;
		Scanner in = new Scanner(System.in);
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		String str = in.nextLine();
		try {
			dt = df.parse(str);
		} catch (ParseException e) {
			System.out.println("invalid format");
		}
		return dt;
	}

	public static java.util.Date convertDate(String date) {
		java.util.Date dt = null;
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		try {
			dt = df.parse(date);
		} catch (ParseException e) {
			System.out.println("invalid format");
		}
		return dt;
	}

	public static String bankInitials(String bkName) {
		String bkIn = new String();
		String[] parts = bkName.split(" ");
		for (String s : parts) {
			if (s != null && !s.isEmpty())
				bkIn = bkIn + s.charAt(0);
		}

		return bkIn;
	}

	public static String dateFormat(java.util.Date date) {
		if (date == null)
			return "";
		String d = date.toString();
		String mon = d.substring(4, 7);
		String m = new String();
		if (mon.equals("Jan")) {
			m = "01";
		} else if (mon.equals("Feb")) {
			m = "02";
		} else if (mon.equals("Mar")) {
			m = "03";
		} else if (mon.equals("Apr")) {
			m = "04";
		} else if (mon.equals("May")) {
			m = "05";
		} else if (mon.equals("Jun")) {
			m = "06";
		} else if (mon.equals("Jul")) {
			m = "07";
		} else if (mon.equals("Aug")) {
			m = "08";
		} else if (mon.equals("Sep")) {
			m = "09";
		} else if (mon.equals("Oct")) {
			m = "10";
		} else if (mon.equals("Nov")) {
			m = "11";
		} else {
			m = "12";
		}
		String day = d.substring(8, 10);
		String year = d.substring(24, 28);
		return (day + "/" + m + "/" + year);
	}

	public static int calculateAge(Date dob) {
		int age = 0;
		String d1 = DateUtils.dateFormat(dob);
		String d2 = DateUtils.dateFormat(new java.util.Date());
		int dt1 = Integer.parseInt(d1.substring(0, 2));
		int dt2 = Integer.parseInt(d2.substring(0, 2));
		int m1 = Integer.parseInt(d1.substring(3, 5));
		int m2 = Integer.parseInt(d2.substring(3, 5));
		int y1 = Integer.parseInt(d1.substring(6, 10));
		int y2 = Integer.parseInt(d2.substring(6, 10));
		if (m1 != m2) {
			if ((m2 - m1) < 0) {
				age = y2 - 1 - y1;
			} else {
				age = y2 - y1;
			}
		} else {
			if ((dt2 - dt1) < 0) {
				age = y2 - 1 - y1;
			} else {
				age = y2 - y1;
			}
		}

		return age;
	}

	public static Date getPreviousDate(Date d) {
		final Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		cal.add(cal.DATE, -1);
		return cal.getTime();
	}

	public static Date getNextDate(Date d) {
		final Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		cal.add(cal.DATE, +1);
		return cal.getTime();
	}

	// public static String getNextDate(String date) {
	// final SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	// final Date date = format.parse(date);
	// final Calendar calendar = Calendar.getInstance();
	// calendar.setTime(date);
	// calendar.add(Calendar.DAY_OF_YEAR, 1);
	// return format.format(calendar.getTime());
	// }

	public static Date getFinancialStartDate(Date d) {
		final Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		int currentYear = cal.get(Calendar.YEAR);
		int currentMonth = cal.get(Calendar.MONTH) + 1;
		String finStart = "";
		if (currentMonth < 4) {
			finStart = "01/04/" + (currentYear - 1);
		} else {
			finStart = "01/04/" + (currentYear);
		}
		return DateUtils.convertDate(finStart);
	}

	public static Date getFinancialLastDate(Date d) {
		final Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		int currentYear = cal.get(Calendar.YEAR);
		int currentMonth = cal.get(Calendar.MONTH) + 1;
		String finLast = "";
		if (currentMonth < 4) {
			finLast = "31/03/" + (currentYear);
		} else {
			finLast = "31/03/" + (currentYear + 1);
		}
		return DateUtils.convertDate(finLast);
	}

	public static void main(String[] arg) {
		// Date d = convertDate("29/03/2017");
		// System.out.println(getFinancialStartDate(d));
		// System.out.println();
		// System.out.println(getFinancialLastDate(d));
		// System.out.println(getNextDate(d));

		System.out.println(bankInitials(" State Bank Of India"));
	}

}
