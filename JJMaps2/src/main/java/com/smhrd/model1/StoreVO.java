package com.smhrd.model1;

public class StoreVO {

	private Integer store_Id;

    private String store_Name;

    private String store_Addr;

    private String store_Tel;

    private String store_Open_Dt;

    private String store_Close_Dt;

    private Integer store_Card_Yn;

    private Integer store_Status;

    private String user_Id;

    private String store_Cate;
    
    private Double Latitude;
    
    private Double Longitude;
    
    
    
    public StoreVO() {
    }
    
    






	public StoreVO(String store_Name, String store_Addr, String store_Tel, String store_Open_Dt, String store_Close_Dt,
			Integer store_Card_Yn, Integer store_Status, String user_Id, String store_Cate, Double latitude,Double longitude) {
		this.store_Name = store_Name;
		this.store_Addr = store_Addr;
		this.store_Tel = store_Tel;
		this.store_Open_Dt = store_Open_Dt;
		this.store_Close_Dt = store_Close_Dt;
		this.store_Card_Yn = store_Card_Yn;
		this.store_Status = store_Status;
		this.user_Id = user_Id;
		this.store_Cate = store_Cate;
		this.Latitude = latitude;
		this.Longitude = longitude;
	}








	public StoreVO(String store_Name, String store_Addr, String store_Tel, String store_Open_Dt,
			String store_Close_Dt, Integer store_Card_Yn, Integer store_Status, String user_Id, String store_Cate,
			Double latitude, Double longitude,Integer store_Id) {
		super();
		this.store_Id = store_Id;
		this.store_Name = store_Name;
		this.store_Addr = store_Addr;
		this.store_Tel = store_Tel;
		this.store_Open_Dt = store_Open_Dt;
		this.store_Close_Dt = store_Close_Dt;
		this.store_Card_Yn = store_Card_Yn;
		this.store_Status = store_Status;
		this.user_Id = user_Id;
		this.store_Cate = store_Cate;
		this.Latitude = latitude;
		this.Longitude = longitude;
	}




	public StoreVO(Integer store_Id, String store_Name, String store_Addr, String store_Tel, String store_Open_Dt,
			String store_Close_Dt, Integer store_Card_Yn, Integer store_Status, String user_Id, String store_Cate) {
		super();
		this.store_Id = store_Id;
		this.store_Name = store_Name;
		this.store_Addr = store_Addr;
		this.store_Tel = store_Tel;
		this.store_Open_Dt = store_Open_Dt;
		this.store_Close_Dt = store_Close_Dt;
		this.store_Card_Yn = store_Card_Yn;
		this.store_Status = store_Status;
		this.user_Id = user_Id;
		this.store_Cate = store_Cate;
	}


	public Integer getStore_Id() {
		return store_Id;
	}

	public String getStore_Name() {
		return store_Name;
	}

	public String getStore_Addr() {
		return store_Addr;
	}

	public String getStore_Tel() {
		return store_Tel;
	}

	public String getStore_Open_Dt() {
		return store_Open_Dt;
	}

	public String getStore_Close_Dt() {
		return store_Close_Dt;
	}

	public Integer getStore_Card_Yn() {
		return store_Card_Yn;
	}

	public Integer getStore_Status() {
		return store_Status;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public String getStore_Cate() {
		return store_Cate;
	}

	public Double getLatitude() {
		return Latitude;
	}

	public Double getLongitude() {
		return Longitude;
	}

	public void setStore_Id(Integer store_Id) {
		this.store_Id = store_Id;
	}

	public void setStore_Name(String store_Name) {
		this.store_Name = store_Name;
	}

	public void setStore_Addr(String store_Addr) {
		this.store_Addr = store_Addr;
	}

	public void setStore_Tel(String store_Tel) {
		this.store_Tel = store_Tel;
	}

	public void setStore_Open_Dt(String store_Open_Dt) {
		this.store_Open_Dt = store_Open_Dt;
	}

	public void setStore_Close_Dt(String store_Close_Dt) {
		this.store_Close_Dt = store_Close_Dt;
	}

	public void setStore_Card_Yn(Integer store_Card_Yn) {
		this.store_Card_Yn = store_Card_Yn;
	}

	public void setStore_Status(Integer store_Status) {
		this.store_Status = store_Status;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public void setStore_Cate(String store_Cate) {
		this.store_Cate = store_Cate;
	}

	public void setLatitude(Double latitude) {
		Latitude = latitude;
	}

	public void setLongitude(Double longitude) {
		Longitude = longitude;
	}

	  
    
 
    

	    
}