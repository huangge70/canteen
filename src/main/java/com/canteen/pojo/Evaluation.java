package com.canteen.pojo;

import java.util.Date;

public class Evaluation {
    private Integer id;

    private Integer oid;

    private Integer uid;

    private String content;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Evaluation{" +
                "id=" + id +
                ", oid=" + oid +
                ", uid=" + uid +
                ", content='" + content + '\'' +
                ", time=" + time +
                '}';
    }
}