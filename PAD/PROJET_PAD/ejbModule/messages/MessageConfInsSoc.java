package messages;

import entity.Societe;

public class MessageConfInsSoc extends MessageMdb {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Societe societe;

	public MessageConfInsSoc() {
		super();
		id=1;
	}

	public Societe getSociete() {
		return societe;
	}

	public void setSociete(Societe societe) {
		this.societe = societe;
	}
}
