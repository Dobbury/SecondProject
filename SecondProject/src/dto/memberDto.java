package dto;

import java.io.Serializable;

public class memberDto implements Serializable {

	private String id;
	private String pw;
	private String nick;
	private String name;
	
	public memberDto(){}
	
	public memberDto(String id,String pw ,String nick, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.name = name;
	}
	
	public memberDto(String id, String nick, String name) {
		super();
		this.id = id;
		this.nick = nick;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
}
