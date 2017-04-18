package com.gs.bean;

import java.util.Date;

public class Complaint {
    private String complaintId;

    private String userId;

    private String complaintContent;

    private Date complaintCreatedTime;

    private String complaintReply;

    private Date complaintReplyTime;

    private String complaintReplyUser;

    public String getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(String complaintId) {
        this.complaintId = complaintId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getComplaintContent() {
        return complaintContent;
    }

    public void setComplaintContent(String complaintContent) {
        this.complaintContent = complaintContent;
    }

    public Date getComplaintCreatedTime() {
        return complaintCreatedTime;
    }

    public void setComplaintCreatedTime(Date complaintCreatedTime) {
        this.complaintCreatedTime = complaintCreatedTime;
    }

    public String getComplaintReply() {
        return complaintReply;
    }

    public void setComplaintReply(String complaintReply) {
        this.complaintReply = complaintReply;
    }

    public Date getComplaintReplyTime() {
        return complaintReplyTime;
    }

    public void setComplaintReplyTime(Date complaintReplyTime) {
        this.complaintReplyTime = complaintReplyTime;
    }

    public String getComplaintReplyUser() {
        return complaintReplyUser;
    }

    public void setComplaintReplyUser(String complaintReplyUser) {
        this.complaintReplyUser = complaintReplyUser;
    }
}