<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cvapp.model.CV" %>
<%@ page buffer="64kb" %>
<%
    CV cv = (CV) request.getAttribute("cv");
    if (cv == null) {
        response.sendRedirect(request.getContextPath() + "/CVController");
        return;
    }

    String[] skills    = (cv.getSkills()    != null && !cv.getSkills().trim().isEmpty())    ? cv.getSkills().split(",")    : new String[]{};
    String[] languages = (cv.getLanguages() != null && !cv.getLanguages().trim().isEmpty()) ? cv.getLanguages().split(",") : new String[]{};

    String[] w1 = (cv.getWork1Desc() != null && !cv.getWork1Desc().trim().isEmpty()) ? cv.getWork1Desc().split("\\. ") : new String[]{};
    String[] w2 = (cv.getWork2Desc() != null && !cv.getWork2Desc().trim().isEmpty()) ? cv.getWork2Desc().split("\\. ") : new String[]{};
    String[] w3 = (cv.getWork3Desc() != null && !cv.getWork3Desc().trim().isEmpty()) ? cv.getWork3Desc().split("\\. ") : new String[]{};

    String imgSrc;
    if (cv.getProfileImageBase64() != null && !cv.getProfileImageBase64().isEmpty()) {
        imgSrc = cv.getProfileImageBase64();
    } else {
        imgSrc = request.getContextPath() + "/images/default-profile.png";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= cv.getFullName() != null ? cv.getFullName() : "CV" %> - CV</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #e8ecef;
            min-height: 100vh;
            padding: 30px 16px;
            color: #2d3748;
        }

        /* Toolbar */
        .toolbar {
            max-width: 900px;
            margin: 0 auto 20px auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .toolbar a, .toolbar button {
            font-size: 0.8rem;
            font-weight: 600;
            padding: 8px 20px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            letter-spacing: 0.05em;
        }
        .btn-back  { background: white; color: #1e3a5f; border: 1px solid #c5cdd8; }
        .btn-print { background: #1e3a5f; color: white; }
        .btn-back:hover  { background: #f1f5f9; }
        .btn-print:hover { background: #162d4a; }
        .toolbar-right { display: flex; gap: 10px; align-items: center; }

        /* CV Paper */
        .cv-paper {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            box-shadow: 0 4px 24px rgba(0,0,0,0.15);
            display: grid;
            grid-template-columns: 255px 1fr;
            min-height: 1100px;
        }

        /* SIDEBAR */
        .sidebar { background: #1e3a5f; color: white; }

        .photo-area {
            background: #162d4a;
            display: flex;
            justify-content: center;
            padding: 36px 28px 28px;
        }
        .photo-area img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid rgba(255,255,255,0.2);
        }

        .sidebar-body { padding: 26px 26px 40px; }

        .sidebar-heading {
            font-size: 0.63rem;
            font-weight: 800;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: #e2c97e;
            border-bottom: 1px solid rgba(255,255,255,0.12);
            padding-bottom: 5px;
            margin-bottom: 12px;
            margin-top: 24px;
        }
        .sidebar-heading:first-child { margin-top: 0; }

        /* Contact */
        .contact-row {
            display: flex;
            align-items: flex-start;
            gap: 9px;
            margin-bottom: 9px;
            font-size: 0.76rem;
            color: rgba(255,255,255,0.82);
            line-height: 1.45;
            word-break: break-word;
        }
        .contact-row svg {
            width: 14px;
            min-width: 14px;
            height: 14px;
            margin-top: 2px;
            opacity: 0.65;
        }

        /* Skills and Languages */
        .list-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.76rem;
            color: rgba(255,255,255,0.82);
            padding: 2px 0;
        }
        .dot {
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: #e2c97e;
            min-width: 5px;
        }

        /* Reference */
        .ref-name  { font-size: 0.83rem; font-weight: 700; color: white; }
        .ref-role  { font-size: 0.72rem; color: #e2c97e; margin: 2px 0 8px; }
        .ref-line  { font-size: 0.71rem; color: rgba(255,255,255,0.72); line-height: 1.9; }
        .ref-bold  { font-weight: 700; color: rgba(255,255,255,0.9); }

        /* MAIN CONTENT */
        .name-header {
            background: #2c4f7c;
            padding: 38px 42px 30px;
        }
        .name-header h1 {
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: 0.07em;
            text-transform: uppercase;
            color: white;
            line-height: 1.1;
        }
        .name-header .job-title {
            font-size: 0.85rem;
            letter-spacing: 0.13em;
            text-transform: uppercase;
            color: #b0cce8;
            margin-top: 8px;
        }

        /* Sections */
        .cv-section { padding: 24px 42px 8px; }

        .cv-section-title {
            font-size: 0.68rem;
            font-weight: 800;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: #1e3a5f;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 16px;
        }
        .icon-circle {
            width: 26px;
            height: 26px;
            border-radius: 50%;
            background: #1e3a5f;
            flex-shrink: 0;
        }
        .title-line {
            flex: 1;
            height: 1.5px;
            background: #cdd8e3;
        }

        /* Profile paragraph */
        .profile-para {
            font-size: 0.78rem;
            color: #4a5568;
            line-height: 1.75;
            text-align: justify;
            margin-left: 38px;
        }

        /* Timeline entry */
        .entry {
            margin-left: 38px;
            padding-left: 16px;
            border-left: 1.5px solid #cdd8e3;
            margin-bottom: 18px;
        }
        .entry-top {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
        }
        .entry-company { font-size: 0.86rem; font-weight: 700; color: #1e3a5f; }
        .entry-year    { font-size: 0.73rem; color: #7a8fa6; font-style: italic; white-space: nowrap; }
        .entry-role    { font-size: 0.76rem; color: #5a6e82; margin: 2px 0 7px; }

        .bullets { list-style: none; padding: 0; }
        .bullets li {
            font-size: 0.76rem;
            color: #4a5568;
            line-height: 1.65;
            padding: 1px 0 1px 14px;
            position: relative;
            text-align: justify;
        }
        .bullets li::before {
            content: '';
            position: absolute;
            left: 0;
            top: 9px;
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: #1e3a5f;
        }

        /* GPA */
        .gpa { font-size: 0.76rem; color: #4a5568; margin-top: 3px; }
        .gpa strong { color: #1e3a5f; }

        /* Print */
        @media print {
    body { 
        background: white; 
        padding: 0; 
        margin: 0;
    }
    .toolbar { 
        display: none; 
    }
    .cv-paper { 
        box-shadow: none; 
        max-width: 100%;
        width: 100%;
    }
    /* Force background colors to print */
    .sidebar {
        background: #1e3a5f !important;
        -webkit-print-color-adjust: exact !important;
        print-color-adjust: exact !important;
        color-adjust: exact !important;
    }
    .photo-area {
        background: #162d4a !important;
        -webkit-print-color-adjust: exact !important;
        print-color-adjust: exact !important;
    }
    .name-header {
        background: #2c4f7c !important;
        -webkit-print-color-adjust: exact !important;
        print-color-adjust: exact !important;
    }
    * {
        -webkit-print-color-adjust: exact !important;
        print-color-adjust: exact !important;
        color-adjust: exact !important;
    }
}
    </style>
</head>
<body>

    <!-- Toolbar -->
    <div class="toolbar">
        <a href="<%= request.getContextPath() %>/CVController" class="btn-back">Back to Form</a>
        <div class="toolbar-right">
            <a href="<%= request.getContextPath() %>/ExampleCVController" class="btn-back">View Example CV</a>
            <button class="btn-print" onclick="printCV()">Print / Save as PDF</button>
        </div>
    </div>

    <!-- CV Paper -->
    <div class="cv-paper">

        <!-- SIDEBAR -->
        <aside class="sidebar">

            <!-- Photo -->
            <div class="photo-area">
                <img src="<%= imgSrc %>" alt="Profile Photo">
            </div>

            <div class="sidebar-body">

                <!-- Contact -->
                <div class="sidebar-heading">Contact</div>

                <% if (cv.getPhone() != null && !cv.getPhone().trim().isEmpty()) { %>
                <div class="contact-row">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                    </svg>
                    <%= cv.getPhone() %>
                </div>
                <% } %>

                <% if (cv.getEmail() != null && !cv.getEmail().trim().isEmpty()) { %>
                <div class="contact-row">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                    </svg>
                    <%= cv.getEmail() %>
                </div>
                <% } %>

                <% if (cv.getAddress() != null && !cv.getAddress().trim().isEmpty()) { %>
                <div class="contact-row">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    <%= cv.getAddress() %>
                </div>
                <% } %>

                <% if (cv.getWebsite() != null && !cv.getWebsite().trim().isEmpty()) { %>
                <div class="contact-row">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9"/>
                    </svg>
                    <%= cv.getWebsite() %>
                </div>
                <% } %>

                <!-- Skills -->
                <% if (skills.length > 0) { %>
                <div class="sidebar-heading">Skills</div>
                <% for (String s : skills) {
                       s = s.trim();
                       if (!s.isEmpty()) { %>
                <div class="list-item">
                    <span class="dot"></span>
                    <%= s %>
                </div>
                <%     }
                   } %>
                <% } %>

                <!-- Languages -->
                <% if (languages.length > 0) { %>
                <div class="sidebar-heading">Languages</div>
                <% for (String l : languages) {
                       l = l.trim();
                       if (!l.isEmpty()) { %>
                <div class="list-item">
                    <span class="dot"></span>
                    <%= l %>
                </div>
                <%     }
                   } %>
                <% } %>

                <!-- Reference -->
                <% if (cv.getRefName() != null && !cv.getRefName().trim().isEmpty()) { %>
                <div class="sidebar-heading">Reference</div>
                <div class="ref-name"><%= cv.getRefName() %></div>
                <% if (cv.getRefTitle() != null && !cv.getRefTitle().trim().isEmpty()) { %>
                <div class="ref-role"><%= cv.getRefTitle() %></div>
                <% } %>
                <% if (cv.getRefPhone() != null && !cv.getRefPhone().trim().isEmpty()) { %>
                <div class="ref-line"><span class="ref-bold">Phone: </span><%= cv.getRefPhone() %></div>
                <% } %>
                <% if (cv.getRefEmail() != null && !cv.getRefEmail().trim().isEmpty()) { %>
                <div class="ref-line"><span class="ref-bold">Email: </span><%= cv.getRefEmail() %></div>
                <% } %>
                <% } %>

            </div>
        </aside>

        <!-- MAIN CONTENT -->
        <main>

            <!-- Name Header -->
            <div class="name-header">
                <h1><%= cv.getFullName() != null ? cv.getFullName() : "" %></h1>
                <% if (cv.getJobTitle() != null && !cv.getJobTitle().trim().isEmpty()) { %>
                <div class="job-title"><%= cv.getJobTitle() %></div>
                <% } %>
            </div>

            <!-- Profile Summary -->
            <% if (cv.getProfileSummary() != null && !cv.getProfileSummary().trim().isEmpty()) { %>
            <section class="cv-section">
                <div class="cv-section-title">
                    <div class="icon-circle"></div>
                    Profile
                    <div class="title-line"></div>
                </div>
                <p class="profile-para"><%= cv.getProfileSummary() %></p>
            </section>
            <% } %>

            <!-- Work Experience -->
            <%
                boolean hasWork = (cv.getWork1Company() != null && !cv.getWork1Company().trim().isEmpty())
                               || (cv.getWork2Company() != null && !cv.getWork2Company().trim().isEmpty())
                               || (cv.getWork3Company() != null && !cv.getWork3Company().trim().isEmpty());
                if (hasWork) {
            %>
            <section class="cv-section">
                <div class="cv-section-title">
                    <div class="icon-circle"></div>
                    Work Experience
                    <div class="title-line"></div>
                </div>

                <% if (cv.getWork1Company() != null && !cv.getWork1Company().trim().isEmpty()) { %>
                <div class="entry">
                    <div class="entry-top">
                        <span class="entry-company"><%= cv.getWork1Company() %></span>
                        <span class="entry-year"><%= cv.getWork1Year() != null ? cv.getWork1Year() : "" %></span>
                    </div>
                    <div class="entry-role"><%= cv.getWork1Role() != null ? cv.getWork1Role() : "" %></div>
                    <% if (w1.length > 0) { %>
                    <ul class="bullets">
                        <% for (String b : w1) {
                               b = b.trim();
                               if (!b.isEmpty()) { %>
                        <li><%= b.endsWith(".") ? b : b + "." %></li>
                        <%     }
                           } %>
                    </ul>
                    <% } %>
                </div>
                <% } %>

                <% if (cv.getWork2Company() != null && !cv.getWork2Company().trim().isEmpty()) { %>
                <div class="entry">
                    <div class="entry-top">
                        <span class="entry-company"><%= cv.getWork2Company() %></span>
                        <span class="entry-year"><%= cv.getWork2Year() != null ? cv.getWork2Year() : "" %></span>
                    </div>
                    <div class="entry-role"><%= cv.getWork2Role() != null ? cv.getWork2Role() : "" %></div>
                    <% if (w2.length > 0) { %>
                    <ul class="bullets">
                        <% for (String b : w2) {
                               b = b.trim();
                               if (!b.isEmpty()) { %>
                        <li><%= b.endsWith(".") ? b : b + "." %></li>
                        <%     }
                           } %>
                    </ul>
                    <% } %>
                </div>
                <% } %>

                <% if (cv.getWork3Company() != null && !cv.getWork3Company().trim().isEmpty()) { %>
                <div class="entry">
                    <div class="entry-top">
                        <span class="entry-company"><%= cv.getWork3Company() %></span>
                        <span class="entry-year"><%= cv.getWork3Year() != null ? cv.getWork3Year() : "" %></span>
                    </div>
                    <div class="entry-role"><%= cv.getWork3Role() != null ? cv.getWork3Role() : "" %></div>
                    <% if (w3.length > 0) { %>
                    <ul class="bullets">
                        <% for (String b : w3) {
                               b = b.trim();
                               if (!b.isEmpty()) { %>
                        <li><%= b.endsWith(".") ? b : b + "." %></li>
                        <%     }
                           } %>
                    </ul>
                    <% } %>
                </div>
                <% } %>

            </section>
            <% } %>

            <!-- Education -->
            <%
                boolean hasEdu = (cv.getEdu1Degree() != null && !cv.getEdu1Degree().trim().isEmpty())
                              || (cv.getEdu2Degree() != null && !cv.getEdu2Degree().trim().isEmpty());
                if (hasEdu) {
            %>
            <section class="cv-section">
                <div class="cv-section-title">
                    <div class="icon-circle"></div>
                    Education
                    <div class="title-line"></div>
                </div>

                <% if (cv.getEdu1Degree() != null && !cv.getEdu1Degree().trim().isEmpty()) { %>
                <div class="entry">
                    <div class="entry-top">
                        <span class="entry-company"><%= cv.getEdu1Degree() %></span>
                        <span class="entry-year"><%= cv.getEdu1Year() != null ? cv.getEdu1Year() : "" %></span>
                    </div>
                    <div class="entry-role"><%= cv.getEdu1School() != null ? cv.getEdu1School() : "" %></div>
                    <% if (cv.getEdu1Gpa() != null && !cv.getEdu1Gpa().trim().isEmpty()) { %>
                    <div class="gpa"><strong>GPA: </strong><%= cv.getEdu1Gpa() %></div>
                    <% } %>
                </div>
                <% } %>

                <% if (cv.getEdu2Degree() != null && !cv.getEdu2Degree().trim().isEmpty()) { %>
                <div class="entry">
                    <div class="entry-top">
                        <span class="entry-company"><%= cv.getEdu2Degree() %></span>
                        <span class="entry-year"><%= cv.getEdu2Year() != null ? cv.getEdu2Year() : "" %></span>
                    </div>
                    <div class="entry-role"><%= cv.getEdu2School() != null ? cv.getEdu2School() : "" %></div>
                    <% if (cv.getEdu2Gpa() != null && !cv.getEdu2Gpa().trim().isEmpty()) { %>
                    <div class="gpa"><strong>GPA: </strong><%= cv.getEdu2Gpa() %></div>
                    <% } %>
                </div>
                <% } %>

            </section>
            <% } %>

        </main>
    </div>
     <script>
    function printCV() {
        window.print();
    }
    </script>
</body>
</html>