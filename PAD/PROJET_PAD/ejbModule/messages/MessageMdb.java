package messages;

import java.io.Serializable;

public class MessageMdb implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int id;

	public MessageMdb() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
