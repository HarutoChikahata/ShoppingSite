package jp.co.aforce.beans;

import java.io.Serializable;

public class Users implements Serializable {
    private static final long serialVersionUID = 1L;

    //カラムに合わせたカプセル化
    private String memberId;
    private String password;
    private String lastName;
    private String firstName;
    private String address;
    private String mailAddress;
    
    // コンストラクタ（引数なし）
    public Users() {}

    // コンストラクタ（全フィールド初期化用）
    public Users(String memberId, String password, String lastName, String firstName, String address, String mailAddress) {
        this.memberId = memberId;
        this.password = password;
        this.lastName = lastName;
        this.firstName = firstName;
        this.address = address;
        this.mailAddress = mailAddress;
    }
    
    //ゲッターとセッター
    public String getMemberId() {
    	return memberId;
    }
    public String getPassword() {
    	return password;
    }
    public String getLastName() {
    	return lastName;
    }
    public String getFirstName() {
    	return firstName;
    }
    public String getAddress() {
    	return address;
    }
    public String getMailAdress() {
    	return mailAddress;
    }
    
    public void setMemberId(String memberId) {
    	this.memberId = memberId;
    }
    public void setPassword(String password) {
    	this.password = password;
    }
    public void setLastName(String lastName) {
    	this.lastName = lastName;
    }
    public void setFirstName(String firstName) {
    	this.firstName = firstName;
    }
    public void setAddress(String address) {
    	this.address = address;
    }
    public void setMailAddress(String mailAddress) {
    	this.mailAddress = mailAddress;
    }
}

