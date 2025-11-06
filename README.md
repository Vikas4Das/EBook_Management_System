iv align="center">

# 📚 EBook Management System  
### A Java-based Digital Library Management Web Application  

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![JSP](https://img.shields.io/badge/JSP%2FServlet-007396?style=for-the-badge&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Tomcat-FF9933?style=for-the-badge&logo=apache-tomcat&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)

</div>

---

## 🧠 **Project Overview**

The **EBook Management System** is a Java-based web application that enables users to **buy, sell, and manage e-books** efficiently.  
It provides both **User** and **Admin** modules to handle all digital library operations online.

> This project replaces manual book management systems with a **modern, automated, and user-friendly web platform**.

---

## 🚀 **Features**

### 👩‍💻 For Users:
- 🔐 User Registration & Login  
- 🛒 Add to Cart and Buy Books  
- 📦 Place Orders and Track Them  
- 💬 Edit Profile & Change Password  
- 💵 Sell Old Books with Image Upload  
- 🏠 Manage Delivery Address  

### 🧑‍💼 For Admins:
- 📗 Add / Edit / Delete Books  
- 👥 Manage Users and Orders  
- 📊 View System Overview and Reports  
- 🧹 Clean and Manage Database  

---

## 🧩 **Tech Stack Used**

| Category | Technologies |
|-----------|---------------|
| **Frontend** | HTML5, CSS3, Bootstrap 5, JSP |
| **Backend** | Java (Servlets, JDBC) |
| **Database** | MySQL |
| **Server** | Apache Tomcat 9.0 |
| **IDE** | Eclipse / IntelliJ IDEA |
| **Version Control** | Git & GitHub |

---

## 📂 **Project Folder Structure**


EBook_Management_System/
│
├── 📁 src/main/java/com/
│   ├── 📁 DB/
│   │   └── DBconnect.java              → Handles database connection using JDBC
│   │
│   ├── 📁 DAO/                         → Data Access Layer (interacts with DB)
│   │   ├── BooksDAOImpl.java           → Book-related CRUD operations
│   │   ├── UserDAOImpl.java            → Handles user login, registration, profile update
│   │   ├── CartDAOImpl.java            → Manages cart and order details
│   │   └── OrderDAOImpl.java           → Stores and retrieves order information
│   │
│   ├── 📁 entity/                      → Model classes (JavaBeans)
│   │   ├── BookDtls.java               → Book entity (name, author, price, etc.)
│   │   ├── User.java                   → User entity (name, email, phone, etc.)
│   │   ├── cart.java                   → Cart entity (book + user mapping)
│   │   └── Order.java                  → Order entity (transaction details)
│   │
│   ├── 📁 user/servlet/                → Handles user-side requests
│   │   ├── LoginServlet.java           → User login logic
│   │   ├── RegisterServlet.java        → Handles new user registration
│   │   ├── CartServlet.java            → Adds book to cart
│   │   ├── RemoveBookCart.java         → Deletes books from cart
│   │   ├── UpdateProfileServlet.java   → Updates user information
│   │   ├── OrderServlet.java           → Processes user order
│   │   └── LogoutServlet.java          → Ends user session
│   │
│   ├── 📁 admin/servlet/               → Admin panel backend logic
│   │   ├── AddBooksServlet.java        → Add new books
│   │   ├── EditBooksServlet.java       → Modify existing books
│   │   ├── DeleteBooksServlet.java     → Remove unwanted books
│   │   └── ManageUserServlet.java      → Handles all users and their data
│
├── 📁 WebContent/
│   ├── 📁 all_component/               → Reusable design components
│   │   ├── navbar.jsp                  → Navigation bar for all pages
│   │   ├── footer.jsp                  → Common footer
│   │   ├── allcss.jsp                  → CSS + Bootstrap + Icons import
│   │
│   ├── 📁 admin/                       → Admin dashboard pages
│   │   ├── home.jsp                    → Admin dashboard page
│   │   ├── add_books.jsp               → Add new book form
│   │   ├── view_books.jsp              → View all added books
│   │   └── manage_users.jsp            → Admin view of users
│   │
│   ├── 📁 book/                        → Book images & uploads folder
│   │   ├── sample_book1.jpg
│   │   └── sample_book2.jpg
│   │
│   ├── 📁 user/                        → User-side JSP pages
│   │   ├── register.jsp
│   │   ├── login.jsp
│   │   ├── index.jsp                   → Homepage (book listings)
│   │   ├── cart.jsp                    → User cart page
│   │   ├── order_success.jsp           → Order confirmation page
│   │   ├── edit_profile.jsp            → User profile update page
│   │   └── sell_book.jsp               → Sell old book page
│   │
│   ├── 📁 css/                         → Custom styles
│   │   └── style.css
│   │
│   ├── 📁 images/                      → Logo and background images
│   │   └── logo.png
│   │
│   ├── 404.jsp                         → Error page
│   └── index.jsp                       → Main entry homepage
│
├── pom.xml                             → Maven configuration file
├── .classpath / .project               → Eclipse project files
├── README.md                           → Project documentation
└── ebook.sql                           → Database schema

