package database;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class javaMailllienhe {
	public static void sendMail(String recipient,String conten) throws MessagingException {
		System.out.println("Preparing to send email");
		Properties props = new Properties();

		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		String myAccountEmail = "minhhien2000k@gmail.com";
		String password = "123456789hien";

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(myAccountEmail, password);
			}
		});
		Message message = prepareMessage(session, myAccountEmail, recipient,conten);
		Transport.send(message);
		System.out.println("Message sent successfully");
	}

	private static Message prepareMessage(Session session, String myAccountEmail, String recipient,String conten) {
		// TODO Auto-generated method stub
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(myAccountEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			message.setSubject("hello hiệp");
			message.setContent(conten, "text/html;charset=UTF-8");
			return message;
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}

	public static void main(String[] args) throws MessagingException {
		javaMailllienhe.sendMail("baby1905199@gmail.com","abc");
	}
}

