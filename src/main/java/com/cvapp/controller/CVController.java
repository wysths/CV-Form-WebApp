package com.cvapp.controller;

import com.cvapp.model.CV;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.InputStream;
import java.io.*;
import java.nio.file.*;

@WebServlet("/CVController")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024)
public class CVController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/myform.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        CV cv = new CV();

        // Personal Info
        cv.setFullName(request.getParameter("fullName"));
        cv.setJobTitle(request.getParameter("jobTitle"));
        cv.setEmail(request.getParameter("email"));
        cv.setPhone(request.getParameter("phone"));
        cv.setAddress(request.getParameter("address"));
        cv.setWebsite(request.getParameter("website"));
        cv.setProfileSummary(request.getParameter("profileSummary"));

        // Education
        cv.setEdu1Degree(request.getParameter("edu1Degree"));
        cv.setEdu1School(request.getParameter("edu1School"));
        cv.setEdu1Year(request.getParameter("edu1Year"));
        cv.setEdu1Gpa(request.getParameter("edu1Gpa"));
        cv.setEdu2Degree(request.getParameter("edu2Degree"));
        cv.setEdu2School(request.getParameter("edu2School"));
        cv.setEdu2Year(request.getParameter("edu2Year"));
        cv.setEdu2Gpa(request.getParameter("edu2Gpa"));

        // Work Experience
        cv.setWork1Company(request.getParameter("work1Company"));
        cv.setWork1Role(request.getParameter("work1Role"));
        cv.setWork1Year(request.getParameter("work1Year"));
        cv.setWork1Desc(request.getParameter("work1Desc"));
        cv.setWork2Company(request.getParameter("work2Company"));
        cv.setWork2Role(request.getParameter("work2Role"));
        cv.setWork2Year(request.getParameter("work2Year"));
        cv.setWork2Desc(request.getParameter("work2Desc"));
        cv.setWork3Company(request.getParameter("work3Company"));
        cv.setWork3Role(request.getParameter("work3Role"));
        cv.setWork3Year(request.getParameter("work3Year"));
        cv.setWork3Desc(request.getParameter("work3Desc"));

        // Skills and Languages
        cv.setSkills(request.getParameter("skills"));
        cv.setLanguages(request.getParameter("languages"));

        // Reference
        cv.setRefName(request.getParameter("refName"));
        cv.setRefTitle(request.getParameter("refTitle"));
        cv.setRefPhone(request.getParameter("refPhone"));
        cv.setRefEmail(request.getParameter("refEmail"));

        // Handle image upload - convert to Base64
        String imageBase64 = "";
        try {
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && !fileName.trim().isEmpty()
                        && (fileName.toLowerCase().endsWith(".jpg")
                        || fileName.toLowerCase().endsWith(".jpeg")
                        || fileName.toLowerCase().endsWith(".png"))) {

                    InputStream imageStream = filePart.getInputStream();
                    byte[] imageBytes = imageStream.readAllBytes();
                    imageBase64 = java.util.Base64.getEncoder().encodeToString(imageBytes);

                    String mimeType = "image/jpeg";
                    if (fileName.toLowerCase().endsWith(".png")) {
                        mimeType = "image/png";
                    }
                    imageBase64 = "data:" + mimeType + ";base64," + imageBase64;
                }
            }
        } catch (Exception e) {
            imageBase64 = "";
        }

        cv.setProfileImageBase64(imageBase64);
        cv.setProfileImagePath("images/default-profile.png");

        
        request.setAttribute("cv", cv);
        request.getRequestDispatcher("/views/processinput.jsp").forward(request, response);
    }
}