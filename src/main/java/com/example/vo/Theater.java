package com.example.vo;

public class Theater {

	private int no;
	private String name;
	private String streetAddress;
	private int longitude;
	private int latitude;
	private int regionNo;

	public Theater() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	public int getLatitude() {
		return latitude;
	}

	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}

	public int getRegionNo() {
		return regionNo;
	}

	public void setRegionNo(int region) {
		this.regionNo = regionNo;
	}

	@Override
	public String toString() {
		return "Theater [no=" + no + ", name=" + name + ", streetAddress=" + streetAddress + ", longitude=" + longitude
				+ ", latitude=" + latitude + ", regionNo=" + regionNo + "]";
	}
	
	
}
