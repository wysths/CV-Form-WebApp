package com.cvapp.model;

public class CV {

    // Personal Info
    private String fullName;
    private String jobTitle;
    private String email;
    private String phone;
    private String address;
    private String website;
    private String profileSummary;
    private String profileImagePath;
    private String profileImageBase64;

    // Education (up to 2 entries, kept simple for beginners)
    private String edu1Degree;
    private String edu1School;
    private String edu1Year;
    private String edu1Gpa;

    private String edu2Degree;
    private String edu2School;
    private String edu2Year;
    private String edu2Gpa;

    // Work Experience (up to 3 entries)
    private String work1Company;
    private String work1Role;
    private String work1Year;
    private String work1Desc;

    private String work2Company;
    private String work2Role;
    private String work2Year;
    private String work2Desc;

    private String work3Company;
    private String work3Role;
    private String work3Year;
    private String work3Desc;

    // Skills (comma-separated string)
    private String skills;

    // Languages (comma-separated string)
    private String languages;

    // Reference
    private String refName;
    private String refTitle;
    private String refPhone;
    private String refEmail;

    // ---------- Getters and Setters ----------

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }

    public String getProfileSummary() { return profileSummary; }
    public void setProfileSummary(String profileSummary) { this.profileSummary = profileSummary; }

    public String getProfileImagePath() { return profileImagePath; }
    public void setProfileImagePath(String profileImagePath) { this.profileImagePath = profileImagePath; }

    public String getEdu1Degree() { return edu1Degree; }
    public void setEdu1Degree(String edu1Degree) { this.edu1Degree = edu1Degree; }

    public String getEdu1School() { return edu1School; }
    public void setEdu1School(String edu1School) { this.edu1School = edu1School; }

    public String getEdu1Year() { return edu1Year; }
    public void setEdu1Year(String edu1Year) { this.edu1Year = edu1Year; }

    public String getEdu1Gpa() { return edu1Gpa; }
    public void setEdu1Gpa(String edu1Gpa) { this.edu1Gpa = edu1Gpa; }

    public String getEdu2Degree() { return edu2Degree; }
    public void setEdu2Degree(String edu2Degree) { this.edu2Degree = edu2Degree; }

    public String getEdu2School() { return edu2School; }
    public void setEdu2School(String edu2School) { this.edu2School = edu2School; }

    public String getEdu2Year() { return edu2Year; }
    public void setEdu2Year(String edu2Year) { this.edu2Year = edu2Year; }

    public String getEdu2Gpa() { return edu2Gpa; }
    public void setEdu2Gpa(String edu2Gpa) { this.edu2Gpa = edu2Gpa; }

    public String getWork1Company() { return work1Company; }
    public void setWork1Company(String work1Company) { this.work1Company = work1Company; }

    public String getWork1Role() { return work1Role; }
    public void setWork1Role(String work1Role) { this.work1Role = work1Role; }

    public String getWork1Year() { return work1Year; }
    public void setWork1Year(String work1Year) { this.work1Year = work1Year; }

    public String getWork1Desc() { return work1Desc; }
    public void setWork1Desc(String work1Desc) { this.work1Desc = work1Desc; }

    public String getWork2Company() { return work2Company; }
    public void setWork2Company(String work2Company) { this.work2Company = work2Company; }

    public String getWork2Role() { return work2Role; }
    public void setWork2Role(String work2Role) { this.work2Role = work2Role; }

    public String getWork2Year() { return work2Year; }
    public void setWork2Year(String work2Year) { this.work2Year = work2Year; }

    public String getWork2Desc() { return work2Desc; }
    public void setWork2Desc(String work2Desc) { this.work2Desc = work2Desc; }

    public String getWork3Company() { return work3Company; }
    public void setWork3Company(String work3Company) { this.work3Company = work3Company; }

    public String getWork3Role() { return work3Role; }
    public void setWork3Role(String work3Role) { this.work3Role = work3Role; }

    public String getWork3Year() { return work3Year; }
    public void setWork3Year(String work3Year) { this.work3Year = work3Year; }

    public String getWork3Desc() { return work3Desc; }
    public void setWork3Desc(String work3Desc) { this.work3Desc = work3Desc; }

    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }

    public String getLanguages() { return languages; }
    public void setLanguages(String languages) { this.languages = languages; }

    public String getRefName() { return refName; }
    public void setRefName(String refName) { this.refName = refName; }

    public String getRefTitle() { return refTitle; }
    public void setRefTitle(String refTitle) { this.refTitle = refTitle; }

    public String getRefPhone() { return refPhone; }
    public void setRefPhone(String refPhone) { this.refPhone = refPhone; }

    public String getRefEmail() { return refEmail; }
    public void setRefEmail(String refEmail) { this.refEmail = refEmail; }
    
    public String getProfileImageBase64() { return profileImageBase64; }
    public void setProfileImageBase64(String profileImageBase64) { this.profileImageBase64 = profileImageBase64; }
}

