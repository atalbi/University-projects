package ressources;

import java.io.Serializable;
import java.util.Properties;

import javax.jms.*;
import javax.naming.*;

import messages.MessageMdb;

import entity.Candidat;

public class Mdb {
	Context context = null;
	QueueConnection queueConnection = null;
	QueueSession queueSession = null;
	Queue queue = null;
	QueueSender queueSender = null;
	ObjectMessage message = null;
	boolean esito = true;

	public Context getInitialContext() throws NamingException {
		Properties props = new Properties();
		props.setProperty("java.naming.factory.initial",
				"org.jnp.interfaces.NamingContextFactory");
		props.setProperty("java.naming.factory.url.pkgs",
				"org.jboss.naming:org.jnp.interfaces");
		props.setProperty("java.naming.provider.url", "127.0.0.1:1099");
		Context context = new InitialContext(props);
		return context;
	}

	public void send(MessageMdb m) throws JMSException, NamingException {
		context = getInitialContext();
		QueueConnectionFactory queueFactory = (QueueConnectionFactory) context
				.lookup("ConnectionFactory");
		queueConnection = queueFactory.createQueueConnection();
		queueSession = queueConnection.createQueueSession(false,
				javax.jms.Session.AUTO_ACKNOWLEDGE);
		queue = (Queue) context.lookup("queue/testQueue");
		queueSender = queueSession.createSender(queue);
		message = queueSession.createObjectMessage();
		message.setObject(m);
		queueSender.send(queue, message);
		context.close();
		queueSession.close();
		queueConnection.close();
	}

}