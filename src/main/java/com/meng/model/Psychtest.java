package com.meng.model;

public class Psychtest {
    private Integer id;

    private String name;

    private Byte type;

    private String levelLow;

    private String levelMid;

    private String levelHeight;

    private String levelPerfect;

    private String outline;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public String getLevelLow() {
        return levelLow;
    }

    public void setLevelLow(String levelLow) {
        this.levelLow = levelLow == null ? null : levelLow.trim();
    }

    public String getLevelMid() {
        return levelMid;
    }

    public void setLevelMid(String levelMid) {
        this.levelMid = levelMid == null ? null : levelMid.trim();
    }

    public String getLevelHeight() {
        return levelHeight;
    }

    public void setLevelHeight(String levelHeight) {
        this.levelHeight = levelHeight == null ? null : levelHeight.trim();
    }

    public String getLevelPerfect() {
        return levelPerfect;
    }

    public void setLevelPerfect(String levelPerfect) {
        this.levelPerfect = levelPerfect == null ? null : levelPerfect.trim();
    }

    public String getOutline() {
        return outline;
    }

    public void setOutline(String outline) {
        this.outline = outline == null ? null : outline.trim();
    }
}