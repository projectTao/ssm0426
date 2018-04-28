package com.bdqn.model;

import java.io.Serializable;
import java.util.Date;

public class RealEstate implements Serializable{

    private static final long serialVersionUID = -3854315430325201175L;

    private Long id;

    private Users users;

    private String projectname;

    private String address;

    private String hoursetype;

    private Integer area;

    private Date buildtime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname == null ? null : projectname.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getHoursetype() {
        return hoursetype;
    }

    public void setHoursetype(String hoursetype) {
        this.hoursetype = hoursetype == null ? null : hoursetype.trim();
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Date getBuildtime() {
        return buildtime;
    }

    public void setBuildtime(Date buildtime) {
        this.buildtime = buildtime;
    }

}
