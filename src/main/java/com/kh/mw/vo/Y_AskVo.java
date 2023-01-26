package com.kh.mw.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Y_AskVo {
	private String recipient = "lee";
	private String question;
	private String sender;
	private Date writedate;
}
