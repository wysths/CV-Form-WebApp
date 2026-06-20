<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV Builder - Create Your CV</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Segoe UI', system-ui, sans-serif; }
        .section-card {
            background: white;
            border-radius: 0.75rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.08);
            padding: 2rem;
            margin-bottom: 1.5rem;
        }
        .section-title {
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: #2d3748;
            border-bottom: 2px solid #e2c97e;
            padding-bottom: 0.5rem;
            margin-bottom: 1.25rem;
        }
        input[type="text"], input[type="email"], input[type="tel"],
        input[type="url"], textarea {
            width: 100%;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            padding: 0.5rem 0.75rem;
            font-size: 0.875rem;
            color: #374151;
            outline: none;
            transition: border-color 0.15s;
        }
        input:focus, textarea:focus {
            border-color: #1e3a5f;
            box-shadow: 0 0 0 3px rgba(30,58,95,0.1);
        }
        label {
            display: block;
            font-size: 0.8rem;
            font-weight: 600;
            color: #4b5563;
            margin-bottom: 0.3rem;
        }
        .sub-section {
            background: #f9fafb;
            border-radius: 0.5rem;
            padding: 1rem 1.25rem;
            margin-bottom: 1rem;
            border-left: 3px solid #1e3a5f;
        }
        .sub-label {
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #9ca3af;
            margin-bottom: 0.75rem;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen py-10 px-4">

    <!-- Header -->
    <div class="max-w-3xl mx-auto mb-8">
        <div class="bg-[#1e3a5f] text-white rounded-xl px-8 py-6 flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold tracking-wide">CV Builder</h1>
                <p class="text-blue-200 text-sm mt-1">Fill in your details to generate a professional CV</p>
            </div>
            <a href="${pageContext.request.contextPath}/ExampleCVController"
               class="bg-white text-[#1e3a5f] font-semibold text-sm px-5 py-2.5 rounded-lg hover:bg-blue-50 transition-colors">
                View Example CV
            </a>
        </div>
    </div>

    <!-- Form -->
    <form action="${pageContext.request.contextPath}/CVController" method="post" enctype="multipart/form-data"
          class="max-w-3xl mx-auto">

        <!-- Personal Information -->
        <div class="section-card">
            <div class="section-title">Personal Information</div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                <div class="md:col-span-2">
                    <label>Profile Photo <span class="text-gray-400 font-normal">(Optional — JPG or PNG, max 5MB)</span></label>
                    <input type="file" name="profileImage" accept="image/jpeg,image/png"
                           class="w-full text-sm text-gray-500 mt-1
                                  file:mr-4 file:py-2 file:px-4 file:rounded file:border-0
                                  file:text-sm file:font-semibold file:bg-[#1e3a5f] file:text-white
                                  hover:file:bg-[#162d4a]">
                    <p class="text-xs text-gray-400 mt-1">If no photo is uploaded, a default profile image will be used.</p>
                </div>

                <div class="md:col-span-2">
                    <label>Full Name <span class="text-red-400">*</span></label>
                    <input type="text" name="fullName" placeholder="e.g. Richard Sanchez" required>
                </div>
                <div>
                    <label>Job Title <span class="text-red-400">*</span></label>
                    <input type="text" name="jobTitle" placeholder="e.g. Marketing Manager" required>
                </div>
                <div>
                    <label>Email Address <span class="text-red-400">*</span></label>
                    <input type="email" name="email" placeholder="e.g. hello@example.com" required>
                </div>
                <div>
                    <label>Phone Number</label>
                    <input type="tel" name="phone" placeholder="e.g. +123-456-7890">
                </div>
                <div>
                    <label>Address</label>
                    <input type="text" name="address" placeholder="e.g. 123 Anywhere St., Any City">
                </div>
                <div class="md:col-span-2">
                    <label>Website / LinkedIn</label>
                    <input type="url" name="website" placeholder="e.g. https://www.yoursite.com">
                </div>
                <div class="md:col-span-2">
                    <label>Profile Summary</label>
                    <textarea name="profileSummary" rows="4"
                              placeholder="Write a short professional summary about yourself..."></textarea>
                </div>
            </div>
        </div>

        <!-- Education -->
        <div class="section-card">
            <div class="section-title">Education</div>

            <div class="sub-section">
                <div class="sub-label">Education Entry 1</div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    <div class="md:col-span-2">
                        <label>Degree / Qualification</label>
                        <input type="text" name="edu1Degree" placeholder="e.g. Master of Business Management">
                    </div>
                    <div>
                        <label>School / University</label>
                        <input type="text" name="edu1School" placeholder="e.g. Wardiere University">
                    </div>
                    <div>
                        <label>Year</label>
                        <input type="text" name="edu1Year" placeholder="e.g. 2029 - 2031">
                    </div>
                    <div>
                        <label>GPA (Optional)</label>
                        <input type="text" name="edu1Gpa" placeholder="e.g. 3.8 / 4.0">
                    </div>
                </div>
            </div>

            <div class="sub-section">
                <div class="sub-label">Education Entry 2 (Optional)</div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    <div class="md:col-span-2">
                        <label>Degree / Qualification</label>
                        <input type="text" name="edu2Degree" placeholder="e.g. Bachelor of Business Management">
                    </div>
                    <div>
                        <label>School / University</label>
                        <input type="text" name="edu2School" placeholder="e.g. Wardiere University">
                    </div>
                    <div>
                        <label>Year</label>
                        <input type="text" name="edu2Year" placeholder="e.g. 2025 - 2029">
                    </div>
                    <div>
                        <label>GPA (Optional)</label>
                        <input type="text" name="edu2Gpa" placeholder="e.g. 3.8 / 4.0">
                    </div>
                </div>
            </div>
        </div>

        <!-- Work Experience -->
        <div class="section-card">
            <div class="section-title">Work Experience</div>

            <div class="sub-section">
                <div class="sub-label">Work Experience 1 (Most Recent)</div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    <div>
                        <label>Company Name</label>
                        <input type="text" name="work1Company" placeholder="e.g. Borcelle Studio">
                    </div>
                    <div>
                        <label>Job Role / Title</label>
                        <input type="text" name="work1Role" placeholder="e.g. Marketing Manager">
                    </div>
                    <div>
                        <label>Period</label>
                        <input type="text" name="work1Year" placeholder="e.g. 2030 - Present">
                    </div>
                    <div class="md:col-span-2">
                        <label>Description <span class="text-gray-400 font-normal">(Separate each point with a full stop and space ". ")</span></label>
                        <textarea name="work1Desc" rows="3"
                                  placeholder="Led the marketing team to achieve targets. Managed the annual budget. Developed brand strategy."></textarea>
                    </div>
                </div>
            </div>

            <div class="sub-section">
                <div class="sub-label">Work Experience 2 (Optional)</div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    <div>
                        <label>Company Name</label>
                        <input type="text" name="work2Company" placeholder="e.g. Fauget Studio">
                    </div>
                    <div>
                        <label>Job Role / Title</label>
                        <input type="text" name="work2Role" placeholder="e.g. Marketing Specialist">
                    </div>
                    <div>
                        <label>Period</label>
                        <input type="text" name="work2Year" placeholder="e.g. 2025 - 2029">
                    </div>
                    <div class="md:col-span-2">
                        <label>Description</label>
                        <textarea name="work2Desc" rows="3" placeholder="Describe your responsibilities..."></textarea>
                    </div>
                </div>
            </div>

            <div class="sub-section">
                <div class="sub-label">Work Experience 3 (Optional)</div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    <div>
                        <label>Company Name</label>
                        <input type="text" name="work3Company" placeholder="e.g. Studio Shodwe">
                    </div>
                    <div>
                        <label>Job Role / Title</label>
                        <input type="text" name="work3Role" placeholder="e.g. Marketing Coordinator">
                    </div>
                    <div>
                        <label>Period</label>
                        <input type="text" name="work3Year" placeholder="e.g. 2024 - 2025">
                    </div>
                    <div class="md:col-span-2">
                        <label>Description</label>
                        <textarea name="work3Desc" rows="3" placeholder="Describe your responsibilities..."></textarea>
                    </div>
                </div>
            </div>
        </div>

        <!-- Skills & Languages -->
        <div class="section-card">
            <div class="section-title">Skills & Languages</div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label>Skills <span class="text-gray-400 font-normal">(comma-separated)</span></label>
                    <textarea name="skills" rows="3"
                              placeholder="e.g. Project Management, Leadership, Digital Marketing"></textarea>
                </div>
                <div>
                    <label>Languages <span class="text-gray-400 font-normal">(comma-separated)</span></label>
                    <textarea name="languages" rows="3"
                              placeholder="e.g. English (Fluent), French (Fluent), Spanish (Basic)"></textarea>
                </div>
            </div>
        </div>

        <!-- Reference -->
        <div class="section-card">
            <div class="section-title">Reference (Optional)</div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label>Reference Name</label>
                    <input type="text" name="refName" placeholder="e.g. Estelle Darcy">
                </div>
                <div>
                    <label>Title / Company</label>
                    <input type="text" name="refTitle" placeholder="e.g. Wardiere Inc. / CTO">
                </div>
                <div>
                    <label>Phone</label>
                    <input type="tel" name="refPhone" placeholder="e.g. 123-456-7890">
                </div>
                <div>
                    <label>Email</label>
                    <input type="email" name="refEmail" placeholder="e.g. estelle@example.com">
                </div>
            </div>
        </div>

        <!-- Submit Buttons -->
        <div class="flex gap-4 max-w-3xl mx-auto mb-12">
            <button type="submit"
                    class="flex-1 bg-[#1e3a5f] text-white font-semibold py-3 rounded-lg hover:bg-[#162d4a] transition-colors text-sm tracking-wide">
                Generate My CV
            </button>
            <button type="reset"
                    class="px-8 bg-white text-gray-600 font-semibold py-3 rounded-lg border border-gray-300 hover:bg-gray-50 transition-colors text-sm">
                Clear Form
            </button>
        </div>

    </form>
</body>
</html>
