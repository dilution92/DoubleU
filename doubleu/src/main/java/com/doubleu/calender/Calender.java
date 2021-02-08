package com.doubleu.calender;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Calender {
	int year;
	int month;
	int day;
	List<Integer> list = new ArrayList<Integer>();
	
	
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public List<Integer> getList() {
		return list;
	}

	public void setList(List<Integer> list) {
		this.list = list;
	}

	public Calender() {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0,4));
		month = Integer.parseInt(time1.substring(5,7));
		day = Integer.parseInt(time1.substring(8,10));
		
		
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		
		
		//2017년 1월 1일 일요일이 기준
		String week[] = {"일","월","화","수","목","금","토"};
		int lastDay[] = {31,28,31,30,31,30,31,31,30,31,30,31};
		if(year%4==0) {
		    lastDay[1]=29;
			}else {
		    lastDay[1]=28;
		}
		int totalyear = (year-2017-1)*365+((year-2017)/4); // 기준년부터 작년까지의 총 일수
		
		int totalmonth = 0;
		for(int i=0;i<month-1;i++) // 올해의 오늘까지의 총 일수
	       {
			totalmonth+=lastDay[i];
	       }
		
		int totaltoday = totalyear+totalmonth+day;
		int totalweek = totaltoday%7; // 오늘 요일 계산하기
		
		System.out.println(week[totalweek]);
		
		int monthfirstday = totalyear+totalmonth+1;
		int monthweek = monthfirstday%7; // 이번 달 1일의 요일 계산하기
		
		System.out.println(week[monthweek]);
		
		// 화면단에 뿌려질 날짜리스트
		//첫번째 일요일 날짜부터 차례대로 입력한다.
		//da의 수만큼 이전 달의 날짜를 입력한다.
		int lastmonth = month-2; // 이전달 구하기
		if((month-2)<0) {
			lastmonth = 12-month-2;
		}else {
			lastmonth = month-2;
		}
		int lastMonthday = lastDay[lastmonth]; // 이전달 마지막 일 구하기
		System.out.println(lastMonthday);
		for(int i=0; i<monthweek; i++) {
			int startNum = lastMonthday-monthweek;
			list.add(startNum);
			startNum++;
		}
		for(int i=0; i<lastDay[month-1]; i++) {
			list.add(i+1);
		}
		int nextMonthday = 42-(monthweek+lastDay[month-1]);
		for(int i=0; i<nextMonthday; i++) {
			list.add(i+1);
		}
		System.out.println("달력출력");
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	
	public static void main(String[] args) {
		new Calender();
	}
}
