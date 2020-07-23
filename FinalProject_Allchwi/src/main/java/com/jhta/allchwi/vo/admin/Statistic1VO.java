package com.jhta.allchwi.vo.admin;

public class Statistic1VO {
	private int month;
	private int monthlySum;
	public Statistic1VO(int month, int monthlySum) {
		super();
		this.month = month;
		this.monthlySum = monthlySum;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getMonthlySum() {
		return monthlySum;
	}
	public void setMonthlySum(int monthlySum) {
		this.monthlySum = monthlySum;
	}
	
	
	
}
