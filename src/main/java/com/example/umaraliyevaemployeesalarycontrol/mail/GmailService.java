package com.example.umaraliyevaemployeesalarycontrol.mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.util.Properties;

public class GmailService {

    public static void send(String txt, String gmail) throws MessagingException, IOException {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        String username = "sabinakazakova783@gmail.com";
        String appPassword = "fyfoyplqyknyiwlk";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, appPassword);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(gmail));
        message.setSubject("Your Verification Code");

        String content = """
                <!DOCTYPE html>
                <html>
                <head>
                    <style>
                        .code {
                            font-size: 1.5rem;
                            font-weight: bold;
                            color: #6a11cb;
                            background: #f4f4f9;
                            padding: 10px;
                            border: 1px dashed #6a11cb;
                            border-radius: 5px;
                        }
                    </style>
                </head>
                <body>
                    <h3>Your Verification Code:</h3>
                    <p>Please use the code below to complete your process:</p>
                    <div class="code">%s</div>
                    <p>If you did not request this, please ignore this email.</p>
                </body>
                </html>
                """.formatted(txt);

        MimeBodyPart mimeBodyPart = new MimeBodyPart();
        mimeBodyPart.setContent(content, "text/html");

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(mimeBodyPart);

        message.setContent(multipart);

        Transport.send(message);
        System.out.println("Email sent successfully!");
    }



}



