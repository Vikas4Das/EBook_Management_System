<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Help Center | Ebook</title>
<%@include file="all_component/allcss.jsp"%>
<style>

    .containerr {
        width: 90%;
        max-width: 1100px;
        margin: 40px auto;
        background: #fff;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #2c3e9a;
        margin-bottom: 10px;
        font-size: 32px;
    }

    p.subtitle {
        text-align: center;
        color: #555;
        margin-bottom: 40px;
        font-size: 16px;
    }

    .support-section {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 25px;
    }

    .card {
        background: #f9faff;
        border-radius: 10px;
        padding: 25px;
        text-align: center;
        transition: 0.3s ease-in-out;
        border: 1px solid #e0e3f0;
    }

    .card:hover {
        background: #2c3e9a;
        color: white;
        transform: translateY(-5px);
    }

    .card h3 {
        color: #2c3e9a;
        margin-bottom: 10px;
    }

    .card:hover h3 {
        color: #fff;
    }

    .card p {
        font-size: 15px;
        color: #555;
    }

    .card:hover p {
        color: #e6e6e6;
    }

    .faq-section {
        margin-top: 50px;
    }

    .faq-section h2 {
        color: #2c3e9a;
        text-align: center;
        margin-bottom: 25px;
    }

    .faq {
        background: #f9faff;
        border-left: 4px solid #2c3e9a;
        padding: 15px 20px;
        margin-bottom: 15px;
        border-radius: 8px;
    }

    .faq h4 {
        margin: 0 0 8px 0;
        color: #2c3e9a;
    }

    .faq p {
        margin: 0;
        color: #555;
        font-size: 15px;
    }

    

    /* Responsive Design */
    @media (max-width: 768px) {
        h1 {
            font-size: 26px;
        }
        .card p, .faq p {
            font-size: 14px;
        }
    }
</style>
</head>
<body style="background-color: #f7f7f7;" >
<%@include file="all_component/navbar.jsp"%>
<div class="containerr">
    <h1>Help Center</h1>
    <p class="subtitle">We’re here to assist you 24×7. Choose an option below to get in touch or find answers quickly.</p>

    <!-- Support Cards -->
    <div class="support-section">
        <div class="card">
            <h3>📞 Call Us</h3>
            <p>Available 24×7 for your support.<br>Call: <strong>1800-123-456</strong></p>
        </div>

        <div class="card">
            <h3>💬 Live Chat</h3>
            <p>Chat with our support team for instant help.<br>Available every day.</p>
        </div>

        <div class="card">
            <h3>📧 Email Us</h3>
            <p>Send your queries anytime.<br>Email: <strong>support@ebook.com</strong></p>
        </div>
    </div>

    <!-- FAQ Section -->
    <div class="faq-section">
        <h2>Frequently Asked Questions (FAQs)</h2>

        <div class="faq">
            <h4>How can I track my book order?</h4>
            <p>Go to “My Orders” → select the order → check the current status and delivery details.</p>
        </div>

        <div class="faq">
            <h4>Can I cancel my order?</h4>
            <p>Yes, you can cancel before the order is shipped. Visit “My Orders” to manage cancellations.</p>
        </div>

        <div class="faq">
            <h4>What payment options are available?</h4>
            <p>We support COD, UPI, Debit/Credit Card, and Net Banking.</p>
        </div>
    </div>

</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>
