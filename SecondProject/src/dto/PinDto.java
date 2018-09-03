package dto;

import java.io.Serializable;

public class PinDto implements Serializable {

	private double lat;
	private double lng;
	private String Pin_name;
	private String kinds;
	private String location;
	
	public PinDto() {
	}

	public PinDto(double lat, double lng, String Pin_name, String kinds, String location) {
		super();
		this.lat = lat;
		this.lng = lng;
		this.Pin_name = Pin_name;
		this.kinds = kinds;
		this.location = location;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getPin_name() {
		return Pin_name;
	}

	public void setPin_name(String Pin_name) {
		this.Pin_name = Pin_name;
	}

	
	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "PinDto [lat=" + lat + ", lng=" + lng + ", place_name=" + Pin_name + ", kinds=" + kinds + ", location="
				+ location + "]";
	}
	
	
	
	
	
}
