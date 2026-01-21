<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">


</head>
 
<body>
<div class="container">
  <div class="text-center mb-4">
    <h1>📚 EBook Management System</h1>
    <h4 class="text-muted">A Java-based Digital Library Management Web Application</h4>
    <div class="mt-3">
      <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white">
      <img src="https://img.shields.io/badge/JSP%2FServlet-007396?style=for-the-badge&logo=java&logoColor=white">
      <img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white">
      <img src="https://img.shields.io/badge/Tomcat-FF9933?style=for-the-badge&logo=apache-tomcat&logoColor=white">
      <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white">
    </div>
  </div>

  <hr>

  <h2>🧠 Project Overview</h2>
  <p>The <strong>EBook Management System</strong> is a <strong>Java-based web application</strong> designed to allow users to buy, sell, and manage e-books online. It simplifies book transactions for both users and administrators, creating an efficient digital book management platform.</p>
  <blockquote>This project replaces the traditional manual process with a modern, automated, and user-friendly digital system.</blockquote>

  <hr>

  <h2>🚀 Features</h2>
  <h4>👩‍💻 For Users:</h4>
  <ul>
    <li>🔐 User Registration & Login</li>
    <li>🛒 Add to Cart and Buy Books</li>
    <li>📦 Place Orders and View Order History</li>
    <li>💬 Edit Profile & Change Password</li>
    <li>💵 Sell Old Books with Image Upload</li>
    <li>🏠 Manage Delivery Address</li>
  </ul>

  <h4>🧑‍💼 For Admins:</h4>
  <ul>
    <li>📗 Add / Edit / Delete Books</li>
    <li>👥 Manage Users and Orders</li>
    <li>📊 Dashboard for Reports</li>
    <li>🧹 Maintain Database</li>
  </ul>

  <hr>

  <h2>🧩 Tech Stack Used</h2>
  <table>
    <tr><th>Category</th><th>Technologies</th></tr>
    <tr><td>Frontend</td><td>HTML5, CSS3, Bootstrap 5, JSP</td></tr>
    <tr><td>Backend</td><td>Java (Servlets, JDBC)</td></tr>
    <tr><td>Database</td><td>MySQL</td></tr>
    <tr><td>Server</td><td>Apache Tomcat 9.0</td></tr>
    <tr><td>IDE</td><td>Eclipse / IntelliJ IDEA</td></tr>
    <tr><td>Version Control</td><td>Git & GitHub</td></tr>
  </table>

  <hr>

  <h2>📂 Project Folder Structure</h2>
  <pre>
EBook_Management_System/
│
├── 📁 src/main/java/com/
│   ├── DB/ → DBconnect.java
│   ├── DAO/ → BooksDAOImpl, UserDAOImpl, CartDAOImpl, OrderDAOImpl
│   ├── entity/ → BookDtls, User, Cart, Order
│   ├── user/servlet/ → LoginServlet, RegisterServlet, CartServlet, etc.
│   └── admin/servlet/ → AddBooksServlet, ManageUserServlet
│
├── 📁 WebContent/
│   ├── all_component/ → navbar.jsp, footer.jsp, allcss.jsp
│   ├── admin/ → home.jsp, add_books.jsp, manage_users.jsp
│   ├── book/ → image uploads
│   ├── user/ → login.jsp, register.jsp, index.jsp, cart.jsp, sell_book.jsp
│   ├── css/ → style.css
│   ├── images/ → logo.png
│   ├── 404.jsp, index.jsp
│
├── pom.xml
├── README.md
└── ebook.sql
  </pre>

  <hr>

  <h2>🗃️ Database Schema & Tables</h2>
  <table>
    <tr><th>Table Name</th><th>Description</th></tr>
    <tr><td>user</td><td>Stores user details (name, email, password, phone)</td></tr>
    <tr><td>book_dtls</td><td>Contains book details (title, author, category, price)</td></tr>
    <tr><td>cart</td><td>Stores temporary cart items for users</td></tr>
    <tr><td>orders</td><td>Stores final order and payment details</td></tr>
  </table>

  <h4>ER Diagram:</h4>
  <pre>
User (userId) ───┐
                 ▼
              Cart (cartId) ───> Book (bookId)
                 ▼
               Orders (orderId)
  </pre>

  <hr>

  <h2>⚙️ How to Run the Project</h2>
  <ol>
    <li>Clone the repo:
      <pre>git clone https://github.com/Vikas4Das/EBook_Management_System.git</pre>
    </li>
    <li>Open the project in <b>Eclipse IDE</b>.</li>
    <li>Configure <b>Tomcat Server</b> and <b>MySQL Database</b>.</li>
    <li>Import <code>ebook.sql</code> file into MySQL.</li>
    <li>Update <code>DBconnect.java</code> with your credentials.</li>
    <li>Run on Tomcat and visit:
      <pre>http://localhost:8080/EBook_Management_System</pre>
    </li>
  </ol>

  <hr>

  <h2>🖼️ Screenshots</h2>
  <div class="text-center">
    <img src="https://via.placeholder.com/300x180?text=Home+Page" class="m-2">
    <img src="https://via.placeholder.com/300x180?text=Admin+Dashboard" class="m-2">
    <img src="https://via.placeholder.com/300x180?text=User+Cart" class="m-2">
  </div>

  <hr>

  <h2>👨‍💻 Contributors</h2>
  <table>
    <tr><th>Name</th><th>GitHub</th><th>Role</th></tr>
    <tr><td>Vikas Das</td><td><a href="https://github.com/Vikas4Das">@Vikas4Das</a></td><td>Project Lead & Full Stack Developer</td></tr>
    <tr><td>Shrabanee Routray</td><td><a href="https://github.com/Shrabanee04">@Shrabanee04</a></td><td>UI/UX & Frontend Design</td></tr>
    <tr><td>Vasetti Dixita</td><td><a href="https://github.com/Dixita-05">@Dixita-05</a></td><td>Database Management & Testing</td></tr>
    <tr><td>Satyapriya Das</td><td><a href="https://github.com/Satyapriya06">@Satyapriya06</a></td><td>Backend Logic & Integration</td></tr>
    <tr><td>Jyoti Anurag</td><td>—</td><td>Documentation & Report Preparation</td></tr>
  </table>

  <hr>

  <h2>🧾 License</h2>
  <p>This project is licensed under the <strong>MIT License</strong> – free for educational and learning use.</p>

  <hr>

  <h2>📞 Contact</h2>
  <p><b>Email:</b> <a href="mailto:vikasdasofficial04@gmail.com">vikasdasofficial04@gmail.com</a><br>
  <b>GitHub:</b> <a href="https://github.com/Vikas4Das">github.com/Vikas4Das</a><br>
  <b>Institution:</b> Centurion University of Technology and Management, Bhubaneswar</p>

  <footer>
    ✨ <em>"Empowering digital libraries — one line of code at a time."</em> ✨
  </footer>
</div>
</body>
</html>
