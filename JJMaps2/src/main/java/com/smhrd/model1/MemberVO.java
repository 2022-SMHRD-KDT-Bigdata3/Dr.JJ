package com.smhrd.model1;

public class MemberVO {

    private String userId;

    public MemberVO(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}

	private String userPw;

    private String userNick;

    private String userCode;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserNick() {
        return userNick;
    }

    public void setUserNick(String userNick) {
        this.userNick = userNick;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    // Members 모델 복사
    public void CopyData(MemberVO param)
    {
        this.userId = param.getUserId();
        this.userPw = param.getUserPw();
        this.userNick = param.getUserNick();
        this.userCode = param.getUserCode();
    }
}