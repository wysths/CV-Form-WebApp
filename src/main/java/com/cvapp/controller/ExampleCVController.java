package com.cvapp.controller;

import com.cvapp.model.CV;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ExampleCVController")
public class ExampleCVController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Hardcoded example CV data (like Richard Sanchez from the sample)
        CV cv = new CV();

        cv.setFullName("Richard Sanchez");
        cv.setJobTitle("Marketing Manager");
        cv.setEmail("hello@reallygreatsite.com");
        cv.setPhone("+123-456-7890");
        cv.setAddress("123 Anywhere St., Any City");
        cv.setWebsite("www.reallygreatsite.com");
        cv.setProfileSummary(
            "Results-driven Marketing Manager with over 6 years of experience developing and executing " +
            "comprehensive marketing strategies. Proven track record of leading high-performing teams, " +
            "managing budgets efficiently, and delivering measurable ROI. Adept at identifying market " +
            "trends and building strong relationships with partners and agencies to amplify brand presence."
        );
        cv.setProfileImagePath("images/default-profile.png");

        // Education
        cv.setEdu1Degree("Master of Business Management");
        cv.setEdu1School("School of Business | Wardiere University");
        cv.setEdu1Year("2029 - 2031");
        cv.setEdu1Gpa("3.8 / 4.0");

        cv.setEdu2Degree("Bachelor of Business Management");
        cv.setEdu2School("School of Business | Wardiere University");
        cv.setEdu2Year("2025 - 2029");
        cv.setEdu2Gpa("3.8 / 4.0");

        // Work Experience
        cv.setWork1Company("Borcelle Studio");
        cv.setWork1Role("Marketing Manager & Specialist");
        cv.setWork1Year("2030 - Present");
        cv.setWork1Desc(
            "Develop and execute comprehensive marketing strategies and campaigns that align with company goals. " +
            "Lead and mentor a high-performing marketing team, fostering a collaborative work environment. " +
            "Monitor brand consistency across all marketing channels and materials."
        );

        cv.setWork2Company("Fauget Studio");
        cv.setWork2Role("Marketing Manager & Specialist");
        cv.setWork2Year("2025 - 2029");
        cv.setWork2Desc(
            "Created and managed the marketing budget, ensuring efficient allocation of resources and optimizing ROI. " +
            "Oversaw market research to identify emerging trends, customer needs, and competitor strategies."
        );

        cv.setWork3Company("Studio Shodwe");
        cv.setWork3Role("Marketing Manager & Specialist");
        cv.setWork3Year("2024 - 2025");
        cv.setWork3Desc(
            "Developed and maintained strong relationships with partners, agencies, and vendors to support marketing initiatives. " +
            "Monitored and maintained brand consistency across all marketing channels and materials."
        );

        // Skills
        cv.setSkills("Project Management, Public Relations, Teamwork, Time Management, Leadership, Effective Communication, Critical Thinking, Digital Marketing");

        // Languages
        cv.setLanguages("English (Fluent), French (Fluent), German (Basic), Spanish (Intermediate)");

        // Reference
        cv.setRefName("Estelle Darcy");
        cv.setRefTitle("Wardiere Inc. / CTO");
        cv.setRefPhone("123-456-7890");
        cv.setRefEmail("hello@reallygreatsite.com");

        request.setAttribute("cv", cv);
        request.getRequestDispatcher("/views/processinput.jsp").forward(request, response);
    }
}