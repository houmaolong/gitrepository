package com.huayin.coms.model;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Customer {
    private String uguid1;

    private String scode;

    private String sname;

    public String getUguid1() {
        return uguid1;
    }

    public void setUguid1(String uguid1) {
        this.uguid1 = uguid1 == null ? null : uguid1.trim();
    }

    public String getScode() {
        return scode;
    }

    public void setScode(String scode) {
        this.scode = scode == null ? null : scode.trim();
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }
}