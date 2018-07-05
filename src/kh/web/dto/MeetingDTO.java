package kh.web.dto;

import java.util.Date;

public class MeetingDTO {
   private int meeting_seq;
   private int group_seq;
   private String group_name;
   private String group_leader;
   private String meeting_title;
   private String meeting_contents;
   private Date meeting_start_time;
   private Date meeting_end_time;
   private String meeting_location;
   private String meeting_picture;
   private String meeting_lat;
   private String meeting_lng;
   private String member_email;

   public MeetingDTO() {
      super();
   }

   public MeetingDTO(int meeting_seq, int group_seq, String group_name, String group_leader, String meeting_title,
         String meeting_contents, Date meeting_start_time, Date meeting_end_time, String meeting_location,
         String meeting_picture, String meeting_lat, String meeting_lng, String member_email) {
      super();
      this.meeting_seq = meeting_seq;
      this.group_seq = group_seq;
      this.group_name = group_name;
      this.group_leader = group_leader;
      this.meeting_title = meeting_title;
      this.meeting_contents = meeting_contents;
      this.meeting_start_time = meeting_start_time;
      this.meeting_end_time = meeting_end_time;
      this.meeting_location = meeting_location;
      this.meeting_picture = meeting_picture;
      this.meeting_lat = meeting_lat;
      this.meeting_lng = meeting_lng;
      this.member_email = member_email;
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

   public String getGroup_name() {
      return group_name;
   }

   public void setGroup_name(String group_name) {
      this.group_name = group_name;
   }

   public String getGroup_leader() {
      return group_leader;
   }

   public void setGroup_leader(String group_leader) {
      this.group_leader = group_leader;
   }

   public String getMeeting_title() {
      return meeting_title;
   }

   public void setMeeting_title(String meeting_title) {
      this.meeting_title = meeting_title;
   }

   public String getMeeting_contents() {
      return meeting_contents;
   }

   public void setMeeting_contents(String meeting_contents) {
      this.meeting_contents = meeting_contents;
   }

   public Date getMeeting_start_time() {
      return meeting_start_time;
   }

   public void setMeeting_start_time(Date meeting_start_time) {
      this.meeting_start_time = meeting_start_time;
   }

   public Date getMeeting_end_time() {
      return meeting_end_time;
   }

   public void setMeeting_end_time(Date meeting_end_time) {
      this.meeting_end_time = meeting_end_time;
   }

   public String getMeeting_location() {
      return meeting_location;
   }

   public void setMeeting_location(String meeting_location) {
      this.meeting_location = meeting_location;
   }

   public String getMeeting_picture() {
      return meeting_picture;
   }

   public void setMeeting_picture(String meeting_picture) {
      this.meeting_picture = meeting_picture;
   }

   public String getMeeting_lat() {
      return meeting_lat;
   }

   public void setMeeting_lat(String meeting_lat) {
      this.meeting_lat = meeting_lat;
   }

   public String getMeeting_lng() {
      return meeting_lng;
   }

   public void setMeeting_lng(String meeting_lng) {
      this.meeting_lng = meeting_lng;
   }

   public String getMember_email() {
      return member_email;
   }

   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }

}