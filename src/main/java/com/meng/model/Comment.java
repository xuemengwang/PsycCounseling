package com.meng.model;

public class Comment {
    private Integer id;

    private Integer essayid;

    private Integer reviewerid;

    private Long time;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEssayid() {
        return essayid;
    }

    public void setEssayid(Integer essayid) {
        this.essayid = essayid;
    }

    public Integer getReviewerid() {
        return reviewerid;
    }

    public void setReviewerid(Integer reviewerid) {
        this.reviewerid = reviewerid;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}