package kh.web.dto;

import java.util.Date;

public class AttendDTO {
   private int attend_seq;
   private int meeting_seq;
   private int group_seq;
   private int attend_people;
   private int member_seq;
   private String member_email;
   private String member_name;
   private String member_picture;
   private Date attend_time;
   
   private int count;

   public int getCount() {
	return count;
}



public void setCount(int count) {
	this.count = count;
}



public AttendDTO () {}
   
   

   public AttendDTO(int attend_seq, int meeting_seq, int group_seq, int attend_people, int member_seq,
         String member_email, String member_name, String member_picture, Date attend_time) {
      super();
      this.attend_seq = attend_seq;
      this.meeting_seq = meeting_seq;
      this.group_seq = group_seq;
      this.attend_people = attend_people;
      this.member_seq = member_seq;
      this.member_email = member_email;
      this.member_name = member_name;
      this.member_picture = member_picture;
      this.attend_time = attend_time;
      
   }

 

public int getAttend_seq() {
      return attend_seq;
   }

   public void setAttend_seq(int attend_seq) {
      this.attend_seq = attend_seq;
   }

   public int getMeeting_seq() {
      return meeting_seq;
   }

   public void setMeeting_seq(int meeting_seq) {
      this.meeting_seq = meeting_seq;
   }

   public int getGroup_seq() {
      return group_seq;
   }

   public void setGroup_seq(int group_seq) {
      this.group_seq = group_seq;
   }

   public int getAttend_people() {
      return attend_people;
   }

   public void setAttend_people(int attend_people) {
      this.attend_people = attend_people;
   }

   public int getMember_seq() {
      return member_seq;
   }

   public void setMember_seq(int member_seq) {
      this.member_seq = member_seq;
   }

   public String getMember_email() {
      return member_email;
   }

   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }

   public String getMember_name() {
      return member_name;
   }

   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }

   public String getMember_picture() {
      return member_picture;
   }

   public void setMember_picture(String member_picture) {
      this.member_picture = member_picture;
   }



public Date getAttend_time() {
	return attend_time;
}



public void setAttend_time(Date attend_time) {
	this.attend_time = attend_time;
}
   
   
   
   
}