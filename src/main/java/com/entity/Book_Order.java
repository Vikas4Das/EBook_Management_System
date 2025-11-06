package com.entity;

public class Book_Order {
	
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phno;
	private String fulladd;
	private String paymentType;
	private String bookname;
	private String author;
	private String price;
	
	public Book_Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phno=" + phno + ", fulladd=" + fulladd + ", paymentType=" + paymentType + ", bookname=" + bookname
				+ ", author=" + author + ", price=" + price + "]";
	}
}
	
	
	
	
