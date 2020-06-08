package com.meng.model;

public class Testresult {
    private Integer id;

    private Integer testid;

    private Integer testerid;

    private Integer score;

    private String conclusion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTestid() {
        return testid;
    }

    public void setTestid(Integer testid) {
        this.testid = testid;
    }

    public Integer getTesterid() {
        return testerid;
    }

    public void setTesterid(Integer testerid) {
        this.testerid = testerid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion == null ? null : conclusion.trim();
    }
}