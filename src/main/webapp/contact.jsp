<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us | EduConnect</title>
<%@include file="all_component/allcss.jsp"%>

<style>

.contact-header {
    color:#303f9f;
    padding: 15px 0;
    text-align: center;
    margin-top:0px;
    border-bottom-left-radius: 50px;
    border-bottom-right-radius: 50px;
}

.contact-header h1 {
    font-size: 2.8rem;
    font-weight: 700;
}



.contact-form {
    background: #fff;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    border-radius: 15px;
    padding: 30px;
}

.contact-info i {
    color: #303f9f;
    font-size: 1.5rem;
    margin-right: 10px;
}

.contact-info p {
    font-size: 1rem;
    margin: 0;
}


.btn-custom {
    background:  #303f9f;
    color: white;
    border: none;
}

.btn-custom:hover {
    background: linear-gradient(90deg, #6610f2, #007bff);
    color: #fff;
}
</style>

</head>
<body>

<%@include file="all_component/navbar.jsp"%>

<!-- Contact Header -->
<div class="contact-header">
    <h1>Get In Touch With Us</h1>
    <p class="lead">We’d love to hear from you! Let’s connect and grow together.</p>
</div>

<!-- Contact Section -->
<div class="container my-5">
    <div class="row g-4">
        <!-- Contact Information -->
        <div class="col-md-5">
            <div class="contact-info p-4 bg-light rounded">
                <h3 class="mb-4  " style="color: #303f9f;">Contact Information</h3>
                <div class="mb-3 d-flex align-items-center">
                    <i class="fas fa-map-marker-alt"></i>
                    <p>Centurion University of Technology and Management<br>Bhubaneswar, Odisha, India</p>
                </div>
                <div class="mb-3 d-flex align-items-center">
                    <i class="fas fa-envelope"></i>
                    <p>support@educonnect.com</p>
                </div>
                <div class="mb-3 d-flex align-items-center">
                    <i class="fas fa-phone"></i>
                    <p>+91 98765 43210</p>
                </div>
                <div class="mb-3 d-flex align-items-center">
                    <i class="fas fa-clock"></i>
                    <p>Mon - Sat: 9:00 AM - 6:00 PM</p>
                </div>
                <div class="mt-4">
                    <h5 class="" style="color: #303f9f;">Follow Us</h5>
                    <a href="#" class="text-dark me-3"><i class="fab fa-facebook fa-lg"></i></a>
                    <a href="#" class="text-dark me-3"><i class="fab fa-twitter fa-lg"></i></a>
                    <a href="#" class="text-dark me-3"><i class="fab fa-linkedin fa-lg"></i></a>
                    <a href="#" class="text-dark"><i class="fab fa-instagram fa-lg"></i></a>
                </div>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="col-md-7">
            <div class="contact-form">
                <h3 class="text-center  mb-4" style="color: #303f9f;">Send Us a Message</h3>
                <form action="contactForm" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Your full name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="yourmail@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label for="subject" class="form-label">Subject</label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Message subject" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Your Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5" placeholder="Type your message here..." required></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-custom px-5 py-2">Send Message</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Google Map -->
<div class="container mb-5">
    <div class="mapouter">
        <div class="gmap_canvas">
            <iframe width="100%" height="400" id="gmap_canvas"
                src="https://maps.google.com/maps?q=Centurion%20University%20Bhubaneswar&t=&z=15&ie=UTF8&iwloc=&output=embed"
                frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
        </div>
    </div>
</div>

<%@include file="all_component/footer.jsp"%>


</body>
</html>
