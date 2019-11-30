package pkg;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

public class Email {

    String subject = null, messageText = null,to=null;

    public int mail() {
        try {
            String host = "smtp.gmail.com";
            String user = "subject.noreply@gmail.com";
            String pass = "noooreplyy";
            String from = "subject.noreply@gmail.com";
            boolean sessionDebug = false;
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");
            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setContent(messageText,"text/html");
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("sent");
            transport.close();
            return 1;
        }  catch(SendFailedException ex){
            return 2;
        }catch (MessagingException ex) {
            System.out.println(ex +"msg nor sent");
            return 0;
        }
    }

    public void msg(String subject,String msg,String to) {
        this.subject = subject;
        this.messageText = msg;
        this.to = to;
    }
}
