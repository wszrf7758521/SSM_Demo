package com.secondHandTradingNetwork.entity;
import java.sql.Date;

public class Goods {
	private long goodsId;
    private int userId;
    private int buyerId;
    private String goodsName;
    private Double goodsPrice;
    private int goodsStatus;
    private String goodsDesc;
    private String imgAddress;
    private Date createTime;
    private User user;
 
	
	public long getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(long goodsId) {
		this.goodsId = goodsId;
	}
	public int getUserId() {
		return userId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getImgAddress() {
		return imgAddress;
	}
	public void setImgAddress(String imgAddress) {
		this.imgAddress = imgAddress;
	}
	
	public int getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(int goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", userId=" + userId + ", buyerId=" + buyerId + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", goodsStatus=" + goodsStatus + ", goodsDesc=" + goodsDesc
				+ ", imgAddress=" + imgAddress + ", createTime=" + createTime + ", user=" + user + "]";
	}
	
}
