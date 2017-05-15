package com.gs.bean;

public class IncomingType {
    private String inTypeId;

    private String inTypeName;

    private String companyId;

    private String inTypeStatus;

    /**
     * 关联公司
     */
    private Company company;

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public String getInTypeId() {
        return inTypeId;
    }

    public void setInTypeId(String inTypeId) {
        this.inTypeId = inTypeId;
    }

    public String getInTypeName() {
        return inTypeName;
    }

    public void setInTypeName(String inTypeName) {
        this.inTypeName = inTypeName;
    }

    public String getInTypeStatus() {
        return inTypeStatus;
    }

    public void setInTypeStatus(String inTypeStatus) {
        this.inTypeStatus = inTypeStatus;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }
}