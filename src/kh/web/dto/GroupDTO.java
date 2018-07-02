package kh.web.dto;

public class GroupDTO {
   private int group_seq;
   private String group_leader;
   private String group_name;
   private String group_location;
   private String group_interests;
   private String group_info;
   private String group_picture;
   private String group_warningdate;
   private int group_warningnumber;
   private String group_expiredate;
   private int group_isblocked;
   private int group_alarm;
   private String group_createdate;
   private int group_betweendate;

   public GroupDTO() {
      super();
   }

   

   public GroupDTO(int group_seq, String group_leader, String group_name, String group_location,
         String group_interests, String group_info, String group_picture, String group_warningdate,
         int group_warningnumber, String group_expiredate, int group_isblocked, int group_alarm,
         String group_createdate, int group_betweendate) {
      super();
      this.group_seq = group_seq;
      this.group_leader = group_leader;
      this.group_name = group_name;
      this.group_location = group_location;
      this.group_interests = group_interests;
      this.group_info = group_info;
      this.group_picture = group_picture;
      this.group_warningdate = group_warningdate;
      this.group_warningnumber = group_warningnumber;
      this.group_expiredate = group_expiredate;
      this.group_isblocked = group_isblocked;
      this.group_alarm = group_alarm;
      this.group_createdate = group_createdate;
      this.group_betweendate = group_betweendate;
   }



   public int getGroup_seq() {
      return group_seq;
   }

   public void setGroup_seq(int group_seq) {
      this.group_seq = group_seq;
   }

   public String getGroup_leader() {
      return group_leader;
   }

   public void setGroup_leader(String group_leader) {
      this.group_leader = group_leader;
   }

   public String getGroup_name() {
      return group_name;
   }

   public void setGroup_name(String group_name) {
      this.group_name = group_name;
   }

   public String getGroup_location() {
      return group_location;
   }

   public void setGroup_location(String group_location) {
      this.group_location = group_location;
   }

   public String getGroup_interests() {
      return group_interests;
   }

   public void setGroup_interests(String group_interests) {
      this.group_interests = group_interests;
   }

   public String getGroup_info() {
      return group_info;
   }

   public void setGroup_info(String group_info) {
      this.group_info = group_info;
   }

   public String getGroup_picture() {
      return group_picture;
   }

   public void setGroup_picture(String group_picture) {
      this.group_picture = group_picture;
   }

   public String getGroup_warningdate() {
      return group_warningdate;
   }

   public void setGroup_warningdate(String group_warningdate) {
      this.group_warningdate = group_warningdate;
   }

   public int getGroup_warningnumber() {
      return group_warningnumber;
   }

   public void setGroup_warningnumber(int group_warningnumber) {
      this.group_warningnumber = group_warningnumber;
   }

   public String getGroup_expiredate() {
      return group_expiredate;
   }

   public void setGroup_expiredate(String group_expiredate) {
      this.group_expiredate = group_expiredate;
   }

   public int getGroup_isblocked() {
      return group_isblocked;
   }

   public void setGroup_isblocked(int group_isblocked) {
      this.group_isblocked = group_isblocked;
   }

   public int getGroup_alarm() {
      return group_alarm;
   }

   public void setGroup_alarm(int group_alarm) {
      this.group_alarm = group_alarm;
   }

   public String getGroup_createdate() {
      return group_createdate;
   }

   public void setGroup_createdate(String group_createdate) {
      this.group_createdate = group_createdate;
   }

   public int getGroup_betweendate() {
      return group_betweendate;
   }

   public void setGroup_betweendate(int group_betweendate) {
      this.group_betweendate = group_betweendate;
   }
}