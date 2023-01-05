package com.smhrd.model1;

public class StoreVO {

	private String storeId;

    private String storeName;

    private String storeAddr;

    private String storeTel;

    private String storeOpenDt;

    private String storeCloseDt;

    private Integer storeCardYn;

    private Integer storeStatus;

    private String userId;

    private String storeCate;
    private Double Latitude;
    private Double Longitude;   
    public StoreVO() {
    }
    
	public StoreVO(String storeId, String storeName, String storeAddr, String storeTel, String storeOpenDt,
			String storeCloseDt, Integer storeCardYn, Integer storeStatus, String userId, String storeCate,
			Double latitude, Double longitude) {
	
		this.storeId = storeId;
		this.storeName = storeName;
		this.storeAddr = storeAddr;
		this.storeTel = storeTel;
		this.storeOpenDt = storeOpenDt;
		this.storeCloseDt = storeCloseDt;
		this.storeCardYn = storeCardYn;
		this.storeStatus = storeStatus;
		this.userId = userId;
		this.storeCate = storeCate;
		Latitude = latitude;
		Longitude = longitude;
	}
		public StoreVO(String storeId, String storeName, String storeAddr, String storeTel, String storeOpenDt,
			String storeCloseDt, Integer storeCardYn, Integer storeStatus, String userId, String storeCate) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.storeAddr = storeAddr;
		this.storeTel = storeTel;
		this.storeOpenDt = storeOpenDt;
		this.storeCloseDt = storeCloseDt;
		this.storeCardYn = storeCardYn;
		this.storeStatus = storeStatus;
		this.userId = userId;
		this.storeCate = storeCate;
	}
		
		public String getStoreId() {
			return storeId;
		}
		public void setStoreId(String storeId) {
			this.storeId = storeId;
		}
		public String getStoreName() {
			return storeName;
		}
		public void setStoreName(String storeName) {
			this.storeName = storeName;
		}
		public String getStoreAddr() {
			return storeAddr;
		}
		public void setStoreAddr(String storeAddr) {
			this.storeAddr = storeAddr;
		}
		public String getStoreTel() {
			return storeTel;
		}
		public void setStoreTel(String storeTel) {
			this.storeTel = storeTel;
		}
		public String getStoreOpenDt() {
			return storeOpenDt;
		}
		public void setStoreOpenDt(String storeOpenDt) {
			this.storeOpenDt = storeOpenDt;
		}
		public String getStoreCloseDt() {
			return storeCloseDt;
		}
		public void setStoreCloseDt(String storeCloseDt) {
			this.storeCloseDt = storeCloseDt;
		}
		public Integer getStoreCardYn() {
			return storeCardYn;
		}
		public void setStoreCardYn(Integer storeCardYn) {
			this.storeCardYn = storeCardYn;
		}
		public Integer getStoreStatus() {
			return storeStatus;
		}
		public void setStoreStatus(Integer storeStatus) {
			this.storeStatus = storeStatus;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getStoreCate() {
			return storeCate;
		}
		public void setStoreCate(String storeCate) {
			this.storeCate = storeCate;
		}
		public Double getLatitude() {
			return Latitude;
		}
		public void setLatitude(Double latitude) {
			Latitude = latitude;
		}
		public Double getLongitude() {
			return Longitude;
		}
		public void setLongitude(Double longitude) {
			Longitude = longitude;
		}
		@Override
		public String toString() {
			return "StoreVO [storeId=" + storeId + ", storeName=" + storeName + ", storeAddr=" + storeAddr
					+ ", storeTel=" + storeTel + ", storeOpenDt=" + storeOpenDt + ", storeCloseDt=" + storeCloseDt
					+ ", storeCardYn=" + storeCardYn + ", storeStatus=" + storeStatus + ", userId=" + userId
					+ ", storeCate=" + storeCate + ", Latitude=" + Latitude + ", Longitude=" + Longitude + "]";
		}

	    
}