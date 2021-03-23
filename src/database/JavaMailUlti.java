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

public class JavaMailUlti {
	public static void sendMail(String recipient) throws MessagingException {
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
		Message message = prepareMessage(session, myAccountEmail, recipient);
		Transport.send(message);
		System.out.println("Message sent successfully");
	}

	private static Message prepareMessage(Session session, String myAccountEmail, String recipient) {
		// TODO Auto-generated method stub
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(myAccountEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			message.setSubject("Forget Password?");
			String htmlCode = "<h3>Nhấp vào link dưới đây để thay đổi mật khẩu của bạn</h3><br><a href=http://localhost:8080/WebProject/ForgotPasswordServlet?index=2>link thay đổi mật khẩu</a><br><h3 style=color:red>Lưu ý: Link này chỉ tồn tại 24h, quá 24h sẽ không được chấp nhận thay đổi mật khẩu :333</h3>";
			message.setContent(htmlCode, "text/html;charset=UTF-8");
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
		JavaMailUlti.sendMail("minhhien2000k@gmail.com");
	}
}
