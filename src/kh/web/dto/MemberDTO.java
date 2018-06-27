package kh.web.dto;

public class MemberDTO {

   private int member_seq;
   private String member_name;
   private String member_email;
   private String member_pwd;
   private String member_location;
   private String member_interests;
   private String member_picture;
   private String member_gender;
   private int member_warningnumber;
   private String member_warningdate;
   private String member_expiredate;
   private String member_joindate;
   private int member_alarm;
   private int member_isblocked;
   private int member_betweendate;

   public MemberDTO() {
      super();
   }

   public MemberDTO(int member_seq, String member_name, String member_email, String member_pwd, String member_location,
         String member_interests, String member_picture, String member_gender, int member_warningnumber,
         String member_warningdate, String member_expiredate, String member_joindate, int member_alarm,
         int member_isblocked) {
      super();
      this.member_seq = member_seq;
      this.member_name = member_name;
      this.member_email = member_email;
      this.member_pwd = member_pwd;
      this.member_location = member_location;
      this.member_interests = member_interests;
      this.member_picture = member_picture;
      this.member_gender = member_gender;
      this.member_warningnumber = member_warningnumber;
      this.member_warningdate = member_warningdate;
      this.member_expiredate = member_expiredate;
      this.member_joindate = member_joindate;
      this.member_alarm = member_alarm;
      this.member_isblocked = member_isblocked;
   }

   public int getMember_seq() {
      return member_seq;
   }

   public void setMember_seq(int member_seq) {
      this.member_seq = member_seq;
   }

   public String getMember_name() {
      return member_name;
   }

   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }

   public String getMember_email() {
      return member_email;
   }

   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }

   public String getMember_pwd() {
      return member_pwd;
   }

   public void setMember_pwd(String member_pwd) {
      this.member_pwd = member_pwd;
   }

   public String getMember_location() {
      return member_location;
   }

   public void setMember_location(String member_location) {
      this.member_location = member_location;
   }

   public String getMember_interests() {
      return member_interests;
   }

   public void setMember_interests(String member_interests) {
      this.member_interests = member_interests;
   }

   public String getMember_picture() {
      return member_picture;
   }

   public void setMember_picture(String member_picture) {
      this.member_picture = member_picture;
   }

   public String getMember_gender() {
      return member_gender;
   }

   public void setMember_gender(String member_gender) {
      this.member_gender = member_gender;
   }

   public int getMember_warningnumber() {
      return member_warningnumber;
   }

   public void setMember_warningnumber(int member_warningnumber) {
      this.member_warningnumber = member_warningnumber;
   }

   public String getMember_warningdate() {
      return member_warningdate;
   }

   public void setMember_warningdate(String member_warningdate) {
      this.member_warningdate = member_warningdate;
   }

   public String getMember_expiredate() {
      return member_expiredate;
   }

   public void setMember_expiredate(String member_expiredate) {
      this.member_expiredate = member_expiredate;
   }

   public String getMember_joindate() {
      return member_joindate;
   }

   public void setMember_joindate(String member_joindate) {
      this.member_joindate = member_joindate;
   }

   public int getMember_alarm() {
      return member_alarm;
   }

   public void setMember_alarm(int member_alarm) {
      this.member_alarm = member_alarm;
   }

   public int getMember_isblocked() {
      return member_isblocked;
   }

   public void setMember_isblocked(int member_isblocked) {
      this.member_isblocked = member_isblocked;
   }

   public int getMember_betweendate() {
      return member_betweendate;
   }

   public void setMember_betweendate(int member_betweendate) {
      this.member_betweendate = member_betweendate;
   }

}