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

	    // Stores 모델 복사
	    public void CopyData(StoreVO param)
	    {
	        this.storeId = param.getStoreId();
	        this.storeName = param.getStoreName();
	        this.storeAddr = param.getStoreAddr();
	        this.storeTel = param.getStoreTel();
	        this.storeOpenDt = param.getStoreOpenDt();
	        this.storeCloseDt = param.getStoreCloseDt();
	        this.storeCardYn = param.getStoreCardYn();
	        this.storeStatus = param.getStoreStatus();
	        this.userId = param.getUserId();
	        this.storeCate = param.getStoreCate();
	    }
	}

