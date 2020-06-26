package com.bolg.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class AdminMenu implements Serializable {
    private Integer id;
    private String m_name;
    private String m_icon;
    private String m_pid;
    private String m_url;
    private String m_sort;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date m_createDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getM_icon() {
        return m_icon;
    }

    public void setM_icon(String m_icon) {
        this.m_icon = m_icon;
    }

    public String getM_pid() {
        return m_pid;
    }

    public void setM_pid(String m_pid) {
        this.m_pid = m_pid;
    }

    public String getM_url() {
        return m_url;
    }

    public void setM_url(String m_url) {
        this.m_url = m_url;
    }

    public String getM_sort() {
        return m_sort;
    }

    public void setM_sort(String m_sort) {
        this.m_sort = m_sort;
    }

    public Date getM_createDate() {
        return m_createDate;
    }

    public void setM_createDate(Date m_createDate) {
        this.m_createDate = m_createDate;
    }
}
