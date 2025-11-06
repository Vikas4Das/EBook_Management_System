
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<%@include file="all_component/allcss.jsp"%>


 <style>
        body {
            background-color: #f9f9f9;
        }

        /* Gradient heading */
        .heading {
            font-weight: 600;
            text-align: center;
            margin-top: 40px;
            margin-bottom: 10px;
            color: #303f9f;
        }

        @keyframes fadeSlide {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .heading-underline {
            width: 0;
            height: 4px;
            
            border-radius: 10px;
            margin: 0 auto 40px auto;
            animation: underlineGrow 1s ease-out 1s forwards;
        }

        @keyframes underlineGrow {
            from { width: 0; }
            to { width: 120px; }
        }

        .about-section {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }

        .step-card {
            border-radius: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color: #ffffff;
            border: none;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        .step-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 16px rgba(0,0,0,0.15);
        }

        .step-icon {
            font-size: 2rem;
            color: #303f9f;
        }

        .mission-box {
            background-color: #303f9f;
            color: white;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
        }
    </style>
    

</head>
<body>

	<%@include file="all_component/navbar.jsp"%>






 <!-- Header -->
    <div class="container my-5">
        <h3 class="heading">📖 About Our Ebooks Library</h3>
        <div class="heading-underline"></div>

        <div class="about-section">
            <p>
               <h4><center> <strong style="color: #303f9f;">Welcome to Ebooks Library</strong> <br></center></h4>   your one-stop destination for exploring, purchasing, and reading digital books online. 
                Our platform is designed to make learning and reading easier, smarter, and more accessible for everyone. 
                Whether you're a student, teacher, or an avid reader, we provide a seamless experience to discover books from various categories — all in one place.
            </p>
        </div>

        <!-- How It Works -->
        <h3 class="text-center fw-bold mt-5 mb-4" style="color:#303f9f;">⚙️ How It Works</h3>
        <div class="row g-4 justify-content-center">
            <div class="col-md-4">
                <div class="card step-card text-center p-4">
                    <div class="step-icon mb-3"><i class="fa-solid fa-book-open"></i></div>
                    <h5 class="fw-semibold mb-2">1️⃣ Browse Books</h5>
                    <p>Explore thousands of books organized by category, author, and popularity — from new releases to old classics.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card step-card text-center p-4">
                    <div class="step-icon mb-3"><i class="fa-solid fa-cart-shopping"></i></div>
                    <h5 class="fw-semibold mb-2">2️⃣ Add to Cart</h5>
                    <p>Choose your favorite books and add them to your cart with a single click for a quick and easy checkout process.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card step-card text-center p-4">
                    <div class="step-icon mb-3"><i class="fa-solid fa-download"></i></div>
                    <h5 class="fw-semibold mb-2">3️⃣ Get Instant Access</h5>
                    <p>Once purchased, access your ebooks instantly in your personal library — anytime, anywhere.</p>
                </div>
            </div>
        </div>

        <!-- Mission -->
        <div class="mission-box mt-5">
            <h3 class="fw-bold mb-3">🎯 Our Mission</h3>
            <p>
                Our mission is to make knowledge universally accessible through technology.  
                We believe that digital reading should be simple, affordable, and enjoyable.  
                By combining smart design with user-friendly navigation, we ensure a reading experience that inspires learning and creativity.
            </p>
        </div>
    </div>











	<%@include file="all_component/footer.jsp"%>

</body>
</html>