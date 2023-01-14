package com.smhrd.model1;

public class MemberVO {

    private String user_Id;

	private String user_Pw;

    private String user_Nick;

    private String user_Code;

    public MemberVO(String user_Id, String user_Pw) {
    	super();
    	this.user_Id = user_Id;
    	this.user_Pw = user_Pw;
    }
    
    
    
	public MemberVO(String user_Id, String user_Pw, String user_Nick) {
		this.user_Id = user_Id;
		this.user_Pw = user_Pw;
		this.user_Nick = user_Nick;
		this.user_Code = "0";
	}



	public MemberVO(String user_Id, String user_Pw, String user_Nick, String user_Code) {
		super();
		this.user_Id = user_Id;
		this.user_Pw = user_Pw;
		this.user_Nick = user_Nick;
		this.user_Code = user_Code;
	}


	public String getUser_Id() {
		return user_Id;
	}

	public String getUser_Pw() {
		return user_Pw;
	}

	public String getUser_Nick() {
		return user_Nick;
	}

	public String getUser_Code() {
		return user_Code;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public void setUser_Pw(String user_Pw) {
		this.user_Pw = user_Pw;
	}

	public void setUser_Nick(String user_Nick) {
		this.user_Nick = user_Nick;
	}

	public void setUser_Code(String user_Code) {
		this.user_Code = user_Code;
	}

	@Override
	public String toString() {
		return "MemberVO [user_Id=" + user_Id + ", user_Pw=" + user_Pw + ", user_Nick=" + user_Nick + ", user_Code="
				+ user_Code + "]";
	}
	
}