package com.doubleu.calender.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.calender.mybatis.CalenderDao;
import com.doubleu.calender.vo.CalenderParticiptant;
import com.doubleu.calender.vo.CalenderVo;
import com.doubleu.calender.vo.CalenderWeekList;

@Transactional
@Service
public class CalenderService {

	@Autowired
	CalenderDao dao;

	int year;
	int month;
	int day;

	String week[] = { "SUN", "MON", "TUE", "WEN", "THU", "FRI", "SAT" };
	int lastDay[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

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
	
	
	//selectList
	public List<CalenderVo> selectList(){
		return dao.selectList();
	}
	
	//selectOne
	public CalenderVo selectOne(int id) {
		CalenderVo cList = dao.selectOne(id);
		int no = cList.getCalenderNo();
		List<CalenderParticiptant> pList = dao.selectPartiList(no);
		cList.setCalPartiList(pList);
		return dao.selectOne(id);
	}
	
	// insert 
	public String insert(CalenderVo vo, List<String> cp) {
		
		 List<CalenderParticiptant> calpartiList = new ArrayList<>(); 
		 for(int i=0; i<cp.size(); i++) { 
			 CalenderParticiptant cp1 = new CalenderParticiptant();
			 cp1.setCalenderPartiMember(cp.get(i));
			 calpartiList.add(cp1); 
			 }
			 vo.setCalPartiList(calpartiList);
		 
		
		return dao.insert(vo);
	}
	
	

	public CalenderService() {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0, 4));
		month = Integer.parseInt(time1.substring(5, 7));
		day = Integer.parseInt(time1.substring(8, 10));
	}

	public int MakeCalenderId(int year, int month, int day) {
		String syear = Integer.toString(year);
		String smonth;
		String sday;
		
		if (month < 10) {
			smonth = "0" + Integer.toString(month);
		} else {
			smonth = Integer.toString(month);
		}
		
		if (day < 10) {
			sday = "0" + Integer.toString(day);
		} else {
			sday = Integer.toString(day);
		}
		
		int sum = Integer.parseInt(syear + smonth + sday);
		
		return sum;
	}

	public int MakeVoId(CalenderVo vo) {

		String year = vo.getCalenderStartYear();
		String month = vo.getCalenderStartMonth();
		String day = vo.getCalenderStartDay();
		int sum = Integer.parseInt(year + month + day);
		
		return sum;
	}
	
	public int MakeVoEndId(CalenderVo vo) {
		String year = vo.getCalenderEndYear();
		String month = vo.getCalenderEndMonth();
		String day = vo.getCalenderEndDay();
		int sum = Integer.parseInt(year + month + day);
		
		return sum;
	}
	
	public String MakeDaytoString(int no) {
		String str = "";
		String tNo = Integer.toString(no);
		if(no<10) {
			str = "0"+tNo;
		}else {
			str = tNo;
		}
		
		return str;
	}

	public int setWeekMethod(int year, int month, int day) {
		String week[] = { "일", "월", "화", "수", "목", "금", "토" };
		int lastDay[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if (year % 400 == 0) {
			lastDay[1] = 29;
		} else if (year % 100 == 0) {
			lastDay[1] = 28;
		} else if (year % 4 == 0) {
			lastDay[1] = 29;
		}
		int totalyear = (year - 2017 - 1) * 365 + ((year - 2017) / 4); // 기준년부터 작년까지의 총 일수

		int totalmonth = 0;
		for (int i = 0; i < month - 1; i++) // 올해의 오늘까지의 총 일수
		{
			totalmonth += lastDay[i];
		}

		int totaltoday = totalyear + totalmonth + day;
		int totalweek = totaltoday % 7;

		return totalweek;
	}

	public List<CalenderWeekList> setMonthCalender() {

		List<CalenderWeekList> list = new ArrayList<>();

		// 2017년 1월 1일 일요일이 기준
		String week[] = { "일", "월", "화", "수", "목", "금", "토" };
		int lastDay[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		if (year % 400 == 0) {
			lastDay[1] = 29;
		} else if (year % 100 == 0) {
			lastDay[1] = 28;
		} else if (year % 4 == 0) {
			lastDay[1] = 29;
		}
		int totalyear = (year - 2017 - 1) * 365 + ((year - 2017) / 4); // 기준년부터 작년까지의 총 일수

		int totalmonth = 0;
		for (int i = 0; i < month - 1; i++) // 올해의 오늘까지의 총 일수
		{
			totalmonth += lastDay[i];
		}

		int totaltoday = totalyear + totalmonth + day;
		int totalweek = totaltoday % 7; // 오늘 요일 계산하기

		int monthfirstday = totalyear + totalmonth + 1;
		int monthweek = monthfirstday % 7; // 이번 달 1일의 요일 계산하기

		// 화면단에 뿌려질 날짜리스트
		// 첫번째 일요일 날짜부터 차례대로 입력한다.
		// da의 수만큼 이전 달의 날짜를 입력한다.
		int lastmonth = month - 2; // 이전달 구하기 lastmonth는 이전달 index 값
		if ((month - 1) == 0) {
			lastmonth = 11;
		} else {
			lastmonth = month - 2;
		}
		int lastMonthday = lastDay[lastmonth]; // 이전달 마지막 일 구하기
		System.out.println(lastMonthday);

		List<CalenderVo> cList = dao.selectList();

		if (month == 1) {
			for (int i = 0; i < monthweek; i++) {
				CalenderWeekList cl = new CalenderWeekList();
				int startNum = lastMonthday - monthweek + 1;
				startNum = startNum + i;
				cl.setDay(startNum);
				cl.setMonth(12);
				cl.setYear(year - 1);
				cl.setDateIdN(MakeCalenderId(year - 1, 12, startNum));
				
				for(int j=0; j<cList.size(); j++) {
					if(MakeVoEndId(cList.get(j))>= cl.getDateIdN() && cl.getDateIdN()>=MakeVoId(cList.get(j))) {
						
						 if(cList.get(j).getCalenderType().equals("장기")) {
							 cl.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
							 cl.setVo(cList.get(j));
						 }else if(cList.get(j).getCalenderType().equals("단기")) {
							 if(cl.getDateIdN()==MakeVoId(cList.get(j))) {
								 cl.setVo(cList.get(j));
							 }
						 }
						
					}
				}

				list.add(cl);
			}
		} else {
			for (int i = 0; i < monthweek; i++) {
				CalenderWeekList cl = new CalenderWeekList();
				int startNum = lastMonthday - monthweek + 1;
				startNum = startNum + i;
				cl.setDay(startNum);
				cl.setMonth(month - 1);
				cl.setYear(year);
				cl.setDateIdN(MakeCalenderId(year, month - 1, startNum));

				for(int j=0; j<cList.size(); j++) {
					if(MakeVoEndId(cList.get(j))>= cl.getDateIdN() && cl.getDateIdN()>=MakeVoId(cList.get(j))) {
						
						 if(cList.get(j).getCalenderType().equals("장기")) {
							 cl.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
							 cl.setVo(cList.get(j));
						 }else if(cList.get(j).getCalenderType().equals("단기")) {
							 if(cl.getDateIdN()==MakeVoId(cList.get(j))) {
								 cl.setVo(cList.get(j));
							 }
						 }
						
					}
				}

				list.add(cl);
			}
		}

		for (int i = 0; i < lastDay[month - 1]; i++) {
			CalenderWeekList cl = new CalenderWeekList();
			cl.setDay(i + 1);
			cl.setMonth(month);
			cl.setYear(year);
			cl.setDateIdN(MakeCalenderId(year, month, i + 1));
			
			for(int j=0; j<cList.size(); j++) {
				if(MakeVoEndId(cList.get(j))>= cl.getDateIdN() && cl.getDateIdN()>=MakeVoId(cList.get(j))) {
					
					 if(cList.get(j).getCalenderType().equals("장기")) {
						 cl.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
						 cl.setVo(cList.get(j));
					 }else if(cList.get(j).getCalenderType().equals("단기")) {
						 if(cl.getDateIdN()==MakeVoId(cList.get(j))) {
							 cl.setVo(cList.get(j));
						 }
					 }
					
				}
			}

			list.add(cl);
		}

		if (month == 12) {
			int nextMonthday = 42 - (monthweek + lastDay[month - 1]);
			for (int i = 0; i < nextMonthday; i++) {
				CalenderWeekList cl = new CalenderWeekList();
				cl.setDay(i + 1);
				cl.setMonth(1);
				cl.setYear(year + 1);
				cl.setDateIdN(MakeCalenderId(year + 1, 1, i + 1));

				for(int j=0; j<cList.size(); j++) {
					if(MakeVoEndId(cList.get(j))>= cl.getDateIdN() && cl.getDateIdN()>=MakeVoId(cList.get(j))) {
						
						 if(cList.get(j).getCalenderType().equals("장기")) {
							 cl.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
							 cl.setVo(cList.get(j));
						 }else if(cList.get(j).getCalenderType().equals("단기")) {
							 if(cl.getDateIdN()==MakeVoId(cList.get(j))) {
								 cl.setVo(cList.get(j));
							 }
						 }
						
					}
				}

				list.add(cl);
			}
		} else {

			int nextMonthday = 42 - (monthweek + lastDay[month - 1]);
			for (int i = 0; i < nextMonthday; i++) {
				CalenderWeekList cl = new CalenderWeekList();
				cl.setDay(i + 1);
				cl.setMonth(month + 1);
				cl.setYear(year);
				cl.setDateIdN(MakeCalenderId(year, month + 1, i + 1));

				for(int j=0; j<cList.size(); j++) {
					if(MakeVoEndId(cList.get(j))>= cl.getDateIdN() && cl.getDateIdN()>=MakeVoId(cList.get(j))) {
						
						 if(cList.get(j).getCalenderType().equals("장기")) {
							 cl.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
							 cl.setVo(cList.get(j));
						 }else if(cList.get(j).getCalenderType().equals("단기")) {
							 if(cl.getDateIdN()==MakeVoId(cList.get(j))) {
								 cl.setVo(cList.get(j));
							 }
						 }
						
					}
				}

				list.add(cl);
			}
		}

		return list;
	}

	// Month 이전,다음
	public List<CalenderWeekList> changeMonth(int diff) {
		System.out.println("월 변경 시작");
		if ((month + diff) > 12) {
			setMonth(1);
			setYear(year + 1);
		} else if ((month + diff) == 0) {
			setMonth(12);
			setYear(year - 1);
		} else {
			setMonth(month + diff);
		}
		System.out.println(month);
		return setMonthCalender();
	}

	// Month오늘
	public List<CalenderWeekList> changeMonthToday() {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0, 4));
		month = Integer.parseInt(time1.substring(5, 7));
		day = Integer.parseInt(time1.substring(8, 10));

		return setMonthCalender();
	}

	public List<CalenderWeekList> monthSelectedMonth(int changedMonth) {
		setMonth(changedMonth);
		return setMonthCalender();
	}

	public List<CalenderWeekList> monthSelectedYear(int changedYear) {
		setYear(changedYear);
		return setMonthCalender();
	}

	// @@@@@@@@@@@@@@@@@@ CalenderWeek @@@@@@@@@@@@@@@@@@@
	
	
	
	

	public List<CalenderWeekList> setCalenderWeek() {

		List<CalenderWeekList> list = new ArrayList<>();
		List<CalenderVo> cList = dao.selectList();
		
		int totalweek;
		int startNum;

		if (day - 7 < 0 && day <= setWeekMethod(year, month, day)) { // 주간이 지난달을 포함할 경우
				System.out.println("1");
			if ((month - 1) == 0) {  // 1월인 경우 년,월 처리 
				totalweek = setWeekMethod(year - 1, 12, lastDay[11]);
				startNum = lastDay[11] - totalweek;

				for (int i = 0; i < totalweek + 1; i++) { // 리스트에 vo 넣는 작업
					CalenderWeekList weekList = new CalenderWeekList();
					weekList.setDay(startNum);
					weekList.setWeek(week[i]);
					weekList.setMonth(month - 1);
					weekList.setYear(year - 1);
					weekList.setDay1(MakeDaytoString(startNum));
					weekList.setDateIdN(MakeCalenderId(year - 1, 12, startNum));

					for(int j=0; j<cList.size(); j++) { // 리스트와 일치하는 날짜에 vo 넣기
						if(MakeVoEndId(cList.get(j))>= weekList.getDateIdN() && weekList.getDateIdN()>=MakeVoId(cList.get(j))) {
							
							 if(cList.get(j).getCalenderType().equals("장기")) {
								 weekList.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
								 weekList.setVo(cList.get(j));
							 }else if(cList.get(j).getCalenderType().equals("단기")) {
								 if(weekList.getDateIdN()==MakeVoId(cList.get(j))) {
									 weekList.setVo(cList.get(j));
								 }
							 }
							
						}
					}
					
					/* 시간 별 일정 정리 */
					List<String> timeList = new ArrayList<>();
					for(int j=0; j<24; j++) {
						String time = Integer.toString(j);
						timeList.add(time);
						
					}
					weekList.setTime(timeList);
					
					list.add(weekList);
					startNum = startNum + 1;
				}
			} else {  // 1월 이외의 경우
				System.out.println("2");
				totalweek = setWeekMethod(year, month - 1, lastDay[month - 2]);
				startNum = lastDay[month - 2] - totalweek;

				for (int i = 0; i < totalweek + 1; i++) {  // 리스트에 vo 넣기
					CalenderWeekList weekList = new CalenderWeekList();
					weekList.setDay(startNum);
					weekList.setWeek(week[i]);
					weekList.setMonth(month - 1);
					weekList.setYear(year);
					weekList.setDay1(MakeDaytoString(startNum));
					weekList.setDateIdN(MakeCalenderId(year, month - 1, startNum));
					
					for(int j=0; j<cList.size(); j++) { // 리스트와 일치하는 날짜에 vo 넣기
						if(MakeVoEndId(cList.get(j))>= weekList.getDateIdN() && weekList.getDateIdN()>=MakeVoId(cList.get(j))) {
							System.out.println("3");
							 if(cList.get(j).getCalenderType().equals("장기")) {
								 System.out.println("장기 등록");
								 weekList.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
								 weekList.setVo(cList.get(j));
							 }else if(cList.get(j).getCalenderType().equals("단기")) {
								 System.out.println("@@@ 단기 : 달력 아이디 :" +weekList.getDateIdN());
								 System.out.println("@@@ 단기 : 디비 아이디 :" +MakeVoId(cList.get(j)));
								 if(weekList.getDateIdN()==MakeVoId(cList.get(j))) {
									 weekList.setVo(cList.get(j));
								 }
							 }
							
						}
					}
					
					/* 시간 별 일정 정리 */
					List<String> timeList = new ArrayList<>();
					for(int j=0; j<24; j++) {
						String time = Integer.toString(j);
						timeList.add(time);
					}
					weekList.setTime(timeList);
					
					list.add(weekList);
					startNum = startNum + 1;
				}
			}

			startNum = 1;

			for (int i = (totalweek + 1); i < 7; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				weekList.setMonth(month);
				weekList.setYear(year);
				weekList.setDay1(MakeDaytoString(startNum));
				weekList.setDateIdN(MakeCalenderId(year, month, day));

				for(int j=0; j<cList.size(); j++) {
					if(MakeVoEndId(cList.get(j))>= weekList.getDateIdN() && weekList.getDateIdN()>=MakeVoId(cList.get(j))) {
						
						 if(cList.get(j).getCalenderType().equals("장기")) { // 리스트와 일치하는 날짜에 vo 넣기
							 weekList.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
							 weekList.setVo(cList.get(j));
						 }else if(cList.get(j).getCalenderType().equals("단기")) {
							 if(weekList.getDateIdN()==MakeVoId(cList.get(j))) {
								 weekList.setVo(cList.get(j));
							 }
						 }
						
					}
				}

				/* 시간 별 일정 정리 */
				List<String> timeList = new ArrayList<>();
				for(int j=0; j<24; j++) {
					String time = Integer.toString(j);
					timeList.add(time);

				}
				weekList.setTime(timeList);
				

				list.add(weekList);
				startNum = startNum + 1;
			}

		} else if (day + 7 - (totalweek = setWeekMethod(year, month, day)) > lastDay[month - 1]) { // 주간이 다음달을 포함할 경우
			System.out.println("3");
			totalweek = setWeekMethod(year, month, lastDay[month - 1]);
			startNum = lastDay[month - 1] - totalweek;

			for (int i = 0; i < totalweek + 1; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				weekList.setMonth(month);
				weekList.setYear(year);
				weekList.setDay1(MakeDaytoString(startNum));
				weekList.setDateIdN(MakeCalenderId(year, month, startNum));

				for(int j=0; j<cList.size(); j++) {
					if(MakeVoEndId(cList.get(j))>= weekList.getDateIdN() && weekList.getDateIdN()>=MakeVoId(cList.get(j))) {
						
						 if(cList.get(j).getCalenderType().equals("장기")) { // 리스트와 일치하는 날짜에 vo 넣기
							 weekList.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
							 weekList.setVo(cList.get(j));
						 }else if(cList.get(j).getCalenderType().equals("단기")) {
							 if(weekList.getDateIdN()==MakeVoId(cList.get(j))) {
								 weekList.setVo(cList.get(j));
							 }
						 }
						
					}
				}

				/* 시간 별 일정 정리 */
				List<String> timeList = new ArrayList<>();
				for(int j=0; j<24; j++) {
					String time = Integer.toString(j);
					timeList.add(time);
					
				}
				weekList.setTime(timeList);
				
				list.add(weekList);
				startNum = startNum + 1;
			}
			

			if (month == 12) {
				totalweek = setWeekMethod(year, 12, lastDay[11]);
				startNum = 1;

				for (int i = (totalweek + 1); i < 7; i++) {
					CalenderWeekList weekList = new CalenderWeekList();
					weekList.setDay(startNum);
					weekList.setWeek(week[i]);
					weekList.setMonth(1);
					weekList.setYear(year + 1);
					weekList.setDay1(MakeDaytoString(startNum));
					weekList.setDateIdN(MakeCalenderId(year + 1, 1, startNum));
					
					for(int j=0; j<cList.size(); j++) {
						if(MakeVoEndId(cList.get(j))>= weekList.getDateIdN() && weekList.getDateIdN()>=MakeVoId(cList.get(j))) {
							
							 if(cList.get(j).getCalenderType().equals("장기")) { // 리스트와 일치하는 날짜에 vo 넣기
								 weekList.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
								 weekList.setVo(cList.get(j));
							 }else if(cList.get(j).getCalenderType().equals("단기")) {
								 if(weekList.getDateIdN()==MakeVoId(cList.get(j))) {
									 weekList.setVo(cList.get(j));
								 }
							 }
							
						}
					}
					

					/* 시간 별 일정 정리 */
					List<String> timeList = new ArrayList<>();
					for(int j=0; j<24; j++) {
						String time = Integer.toString(j);
						timeList.add(time);
					}
					weekList.setTime(timeList);
					
					list.add(weekList);
					startNum = startNum + 1;
				}

			} else {
				System.out.println("4");
				totalweek = setWeekMethod(year, month, lastDay[month - 1]);
				startNum = 1;

				for (int i = (totalweek + 1); i < 7; i++) {
					CalenderWeekList weekList = new CalenderWeekList();
					weekList.setDay(startNum);
					weekList.setWeek(week[i]);
					weekList.setMonth(month + 1);
					weekList.setYear(year);
					weekList.setDay1(MakeDaytoString(startNum));
					weekList.setDateIdN(MakeCalenderId(year, month + 1, startNum));

					for(int j=0; j<cList.size(); j++) {
						if(MakeVoEndId(cList.get(j))>= weekList.getDateIdN() && weekList.getDateIdN()>=MakeVoId(cList.get(j))) {
							
							 if(cList.get(j).getCalenderType().equals("장기")) { // 리스트와 일치하는 날짜에 vo 넣기
								 weekList.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
								 weekList.setVo(cList.get(j));
							 }else if(cList.get(j).getCalenderType().equals("단기")) {
								 if(weekList.getDateIdN()==MakeVoId(cList.get(j))) {
									 weekList.setVo(cList.get(j));
								 }
							 }
							
						}
					}

					/* 시간 별 일정 정리 */
					List<String> timeList = new ArrayList<>();
					for(int j=0; j<24; j++) {
						String time = Integer.toString(j);
						timeList.add(time);
						
					}
					weekList.setTime(timeList);
					

					list.add(weekList);
					startNum = startNum + 1;
				}

			}

		} else {
			System.out.println("5");
			totalweek = setWeekMethod(year, month, day);
			startNum = day - totalweek;

			for (int i = 0; i < 7; i++) {
				CalenderWeekList weekList = new CalenderWeekList();
				weekList.setDay(startNum);
				weekList.setWeek(week[i]);
				weekList.setMonth(month);
				weekList.setYear(year);
				weekList.setDay1(MakeDaytoString(startNum));
				weekList.setDateIdN(MakeCalenderId(year, month, startNum));

				for(int j=0; j<cList.size(); j++) {
					if(MakeVoEndId(cList.get(j))>= weekList.getDateIdN() && weekList.getDateIdN()>=MakeVoId(cList.get(j))) {
						
						 if(cList.get(j).getCalenderType().equals("장기")) {
							 weekList.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
							 weekList.setVo(cList.get(j));
						 }else if(cList.get(j).getCalenderType().equals("단기")) {
							 if(weekList.getDateIdN()==MakeVoId(cList.get(j))) {
								 weekList.setVo(cList.get(j));
							 }
						 }
						
					}
				}

				/* 시간 별 일정 정리 */
				List<String> timeList = new ArrayList<>();
				for(int j=0; j<24; j++) {
					String time1 = Integer.toString(j);
					timeList.add(time1);
					
				}
				weekList.setTime(timeList);
				
				list.add(weekList);
				startNum = startNum + 1;
			}
		}

		return list;
	}

	// Week 이전,다음
	public List<CalenderWeekList> changeWeek(int diff) {
		List<CalenderWeekList> list = new ArrayList<CalenderWeekList>();
		
		int totalweek;
		int lastDay[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		int monthIndex = month - 1;
		if ((day + diff) < 1) { // 변경된 day가 1일보다 미만일 경우
			if (monthIndex == 0) {
				setMonth(12);
				setYear(year - 1);
				monthIndex = 11;
			} else {
				monthIndex = monthIndex - 1;
				setMonth(monthIndex + 1);
			}
			setDay(lastDay[monthIndex] + (day + diff));
		} else if ((day + diff) > lastDay[monthIndex]) { // 변경된 day가 마지막일을 초과할 경우
			if (monthIndex == 11) {
				setMonth(1);
				setYear(year + 1);
				setDay(day + diff - lastDay[11]);
			} else {
				setMonth(month + 1);
				setDay(day + diff - lastDay[monthIndex]);
			}

		} else { // 변경된 day가 월 범위 내 인경우
			setDay((day + diff));
		}

		list = setCalenderWeek();
		System.out.println(day + "현재 설정날짜");
		return list;
	}

	public List<CalenderWeekList> changeWeekToday() {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0, 4));
		month = Integer.parseInt(time1.substring(5, 7));
		day = Integer.parseInt(time1.substring(8, 10));

		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		return setCalenderWeek();
	}

	public CalenderWeekList setCalenderDay() {
		CalenderWeekList listDay = new CalenderWeekList();
		List<CalenderVo> cList = dao.selectList();
		listDay.setYear(year);
		listDay.setMonth(month);
		listDay.setDay(day);
		listDay.setWeek(week[setWeekMethod(year, month, day)]);
		listDay.setDateIdN(MakeCalenderId(year, month, day));

		for(int j=0; j<cList.size(); j++) {
			if(MakeVoEndId(cList.get(j))>= listDay.getDateIdN() && listDay.getDateIdN()>=MakeVoId(cList.get(j))) {
				
				 if(cList.get(j).getCalenderType().equals("장기")) {
					 listDay.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
					 listDay.setVo(cList.get(j));
				 }else if(cList.get(j).getCalenderType().equals("단기")) {
					 if(listDay.getDateIdN()==MakeVoId(cList.get(j))) {
						 listDay.setVo(cList.get(j));
					 }
				 }
				
			}
		}
		

		return listDay;
	}

	public List<CalenderWeekList> weekSelectedMonth(int changedMonth) {
		setMonth(changedMonth);
		return setCalenderWeek();
	}

	public List<CalenderWeekList> weekSelectedYear(int changedYear) {
		setYear(changedYear);
		return setCalenderWeek();
	}

	// Day 이전,다음
	public CalenderWeekList changeDay(int diff) {

		CalenderWeekList listDay = new CalenderWeekList();
		List<CalenderVo> cList = dao.selectList();

		if (day + diff == 0) {
			if (month == 1) {
				setYear(year - 1);
				setMonth(12);
				setDay(31);
			} else {
				setMonth(month - 1);
				setDay(lastDay[month - 1]);
			}
		} else if (day + diff > lastDay[month - 1]) {
			if (month == 12) {
				setYear(year + 1);
				setMonth(1);
				setDay(1);
			} else {
				setMonth(month + 1);
				setDay(1);
			}
		} else {
			setDay(day + diff);
		}

		listDay.setDay(day);
		listDay.setWeek(week[setWeekMethod(year, month, day)]);
		listDay.setDateIdN(MakeCalenderId(year, month, day));
		
		for(int j=0; j<cList.size(); j++) {
			if(MakeVoEndId(cList.get(j))>= listDay.getDateIdN() && listDay.getDateIdN()>=MakeVoId(cList.get(j))) {
				
				 if(cList.get(j).getCalenderType().equals("장기")) {
					 listDay.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
					 listDay.setVo(cList.get(j));
				 }else if(cList.get(j).getCalenderType().equals("단기")) {
					 if(listDay.getDateIdN()==MakeVoId(cList.get(j))) {
						 listDay.setVo(cList.get(j));
					 }
				 }
				
			}
		}
		
		return listDay;
	}

	public CalenderWeekList changeDayToday() {

		CalenderWeekList listDay = new CalenderWeekList();
		List<CalenderVo> cList = dao.selectList();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		year = Integer.parseInt(time1.substring(0, 4));
		month = Integer.parseInt(time1.substring(5, 7));
		day = Integer.parseInt(time1.substring(8, 10));

		listDay.setYear(year);
		listDay.setMonth(month);
		listDay.setDay(day);
		listDay.setWeek(week[setWeekMethod(year, month, day)]);
		listDay.setDateIdN(MakeCalenderId(year, month, day));
		
		for(int j=0; j<cList.size(); j++) {
			if(MakeVoEndId(cList.get(j))>= listDay.getDateIdN() && listDay.getDateIdN()>=MakeVoId(cList.get(j))) {
				
				 if(cList.get(j).getCalenderType().equals("장기")) {
					 listDay.setPeriod(MakeVoEndId(cList.get(j))-MakeVoId(cList.get(j)));
					 listDay.setVo(cList.get(j));
				 }else if(cList.get(j).getCalenderType().equals("단기")) {
					 if(listDay.getDateIdN()==MakeVoId(cList.get(j))) {
						 listDay.setVo(cList.get(j));
					 }
				 }
				
			}
		}
		
		return listDay;
	}

	public CalenderWeekList daySelectedMonth(int changedMonth) {
		setMonth(changedMonth);
		return setCalenderDay();
	}

	public CalenderWeekList daySelectedYear(int changedYear) {
		setYear(changedYear);
		return setCalenderDay();
	}
}
