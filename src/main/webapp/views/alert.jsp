<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notice</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>body { font-family: 'Segoe UI', system-ui, sans-serif; }</style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center px-4">
    <div class="bg-white rounded-xl shadow-md p-10 max-w-md w-full text-center">
        <div class="w-14 h-14 bg-red-50 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg class="w-7 h-7 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M12 9v2m0 4h.01M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z"/>
            </svg>
        </div>
        <h2 class="text-lg font-bold text-gray-800 mb-2">Something went wrong</h2>
        <p class="text-gray-500 text-sm mb-6">
            <%= request.getAttribute("alertMessage") != null
                ? request.getAttribute("alertMessage")
                : "An unexpected error occurred. Please try again." %>
        </p>
        <a href="${pageContext.request.contextPath}/CVController"
           class="inline-block bg-[#1e3a5f] text-white text-sm font-semibold px-6 py-2.5 rounded-lg hover:bg-[#162d4a] transition-colors">
            Return to Form
        </a>
    </div>
</body>
</html>

