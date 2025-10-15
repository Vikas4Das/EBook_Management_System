<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook</title>

<%@include file="all_component/allcss.jsp"%>


<style>
/* Overlay for readability */
.back-img {
  position: relative;
  height: 80vh;
  width: 100%;
  background-size: cover;
  background-position: center;
  animation: slideShow 18s infinite ease-in-out;
  transition: background-image 1.5s ease-in-out;
}

.back-img::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.45);
}

/* Ensure content appears above overlay */
.content-box {
  position: relative;
  z-index: 2;
  max-width: 800px;
  padding: 20px;
}

/* Background slideshow animation */
@keyframes slideShow {
  0%   { background-image: url("img/debby-hudson-ERb-JXVwAfo-unsplash.jpg"); }
  33%  { background-image: url("img/eniko-kis-ZpPH2VO-xFc-unsplash.jpg"); }
  66%  { background-image: url("img/florencia-viadana-1J8k0qqUfYY-unsplash.jpg"); }
  100% { background-image: url("img/photo-1523865236457-3ae3358a4eaa.avif"); }
}

/* Smooth text animations */
.animate-fade {
  animation: fadeIn 1.5s ease-in-out;
}
.animate-fade-delay {
  animation: fadeIn 2.5s ease-in-out;
}
.animate-fade-delay2 {
  animation: fadeIn 3.5s ease-in-out;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(25px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Button hover glow effect */
.btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 0 15px rgba(255, 255, 255, 0.4);
  transition: all 0.3s ease;
}
</style>
</head>

<body>
  <%@include file="all_component/navbar.jsp"%>
<div class="container-fluid back-img d-flex flex-column justify-content-center align-items-center text-center text-white">
  
  <div class="content-box">
    <h2 class="display-4 fw-bold mb-3 animate-fade">📚 EBook Management System</h2>
    
    <p class="lead mb-4 animate-fade-delay">
      Discover, Read, and Manage Your Favorite Ebooks — Anytime, Anywhere.
    </p>
    
    <div class="d-flex justify-content-center flex-wrap gap-3 animate-fade-delay2">
      <a href="#" class="btn btn-light text-primary px-4 py-2 shadow-sm fw-semibold rounded-pill">
        <i class="fa-solid fa-book-open"></i> Explore Library
      </a>
      <a href="#" class="btn btn-primary px-4 py-2 shadow-sm fw-semibold rounded-pill ml-2"
         style="background-color:#303f9f; border:none;">
        <i class="fa-solid fa-rocket"></i> Get Started
      </a>
    </div>
  </div>

</div>
</body>
</html>
