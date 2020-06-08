package com.meng.model;

public class Questions {
    private Integer id;

    private Integer testid;

    private String title;

    private String option1;

    private Integer score1;

    private String option2;

    private Integer score2;

    private String option3;

    private Integer score3;

    private String option4;

    private Integer score4;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1 == null ? null : option1.trim();
    }

    public Integer getScore1() {
        return score1;
    }

    public void setScore1(Integer score1) {
        this.score1 = score1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2 == null ? null : option2.trim();
    }

    public Integer getScore2() {
        return score2;
    }

    public void setScore2(Integer score2) {
        this.score2 = score2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3 == null ? null : option3.trim();
    }

    public Integer getScore3() {
        return score3;
    }

    public void setScore3(Integer score3) {
        this.score3 = score3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4 == null ? null : option4.trim();
    }

    public Integer getScore4() {
        return score4;
    }

    public void setScore4(Integer score4) {
        this.score4 = score4;
    }

    @Override
    public String toString() {
        return "Questions{" +
                "id=" + id +
                ", testid=" + testid +
                ", title='" + title + '\'' +
                ", option1='" + option1 + '\'' +
                ", score1=" + score1 +
                ", option2='" + option2 + '\'' +
                ", score2=" + score2 +
                ", option3='" + option3 + '\'' +
                ", score3=" + score3 +
                ", option4='" + option4 + '\'' +
                ", score4=" + score4 +
                '}';
    }
}