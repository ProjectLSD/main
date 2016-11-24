package search.model;

import java.util.List;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import band.model.Band;

@Component
public class IdPassSearchService {
   @Autowired
   SqlSessionFactory fac;
   @Autowired
   JavaMailSender sender;
   
   public List<Band> searchId(Band dto){
      System.out.println(dto);
	   SqlSession ss = fac.openSession();      
      
         List<Band> li = ss.selectList("idpass.bandid",dto);
         
         ss.close();
            return li;
         
   }   

   public boolean searchPw(String id, String email){
      MimeMessage mail = sender.createMimeMessage();   
      SqlSession ss = fac.openSession();
      try{
         String pass = ss.selectOne("idpass.bandpass",id);
         if(pass==null){
            return false;
         }
         mail.addRecipient(RecipientType.TO, new InternetAddress(email));   //To setRecipient / setRecipients
         
         
         mail.setSender(new InternetAddress("admin@group.kr"));//From
         mail.setSubject("비밀 번호 입니다.");
         String text = "<h3>비밀 번호</h3>";
         text += "비밀 번호는 "+pass+" 입니다.";
         mail.setText(text,"utf-8","html");
         sender.send(mail);
         return true;
      }catch(Exception e){
         e.printStackTrace();
         return false;
      }finally {
         ss.close();
      }
   }
}