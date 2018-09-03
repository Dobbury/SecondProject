package dto;

import java.io.Serializable;

public class memberDto implements Serializable {
	private String id;
	private String pwd;
	private String nick;
	private String name;
	
	public memberDto() {
		// TODO Auto-generated constructor stub
	}

	public memberDto(String id, String pwd, String nick, String name) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nick = nick;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	@Override
	public String toString() {
		return "memberDto [id=" + id + ", pwd=" + pwd + ", nick=" + nick + ", name=" + name + "]";
	}
	
	
}
