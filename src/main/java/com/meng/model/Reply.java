package com.meng.model;

public class Reply {
    private Integer id;

    private Integer problid;

    private Long time;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProblid() {
        return problid;
    }

    public void setProblid(Integer problid) {
        this.problid = problid;
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