<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BooksDAOImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook</title>

<%@include file="all_component/allcss.jsp"%>

<style>
/* Overlay for readability */
.back-img { position: relative; height: 80vh; width: 100%; background-size: cover; background-position: center; animation: slideShow 18s infinite ease-in-out; transition: background-image 1.5s ease-in-out; }
.back-img::before { content: ""; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.45); }
.content-box { position: relative; z-index: 2; max-width: 800px; padding: 20px; }

/* Background slideshow animation */
@keyframes slideShow {
  0% { background-image: url("img/debby-hudson-ERb-JXVwAfo-unsplash.jpg"); }
  33% { background-image: url("img/eniko-kis-ZpPH2VO-xFc-unsplash.jpg"); }
  66% { background-image: url("img/florencia-viadana-1J8k0qqUfYY-unsplash.jpg"); }
  100% { background-image: url("img/photo-1523865236457-3ae3358a4eaa.avif"); }
}

/* Fade animation */
@keyframes fadeIn { from { opacity:0; transform: translateY(25px);} to { opacity:1; transform: translateY(0); } }
.animate-fade { animation: fadeIn 1.5s ease-in-out; }
.animate-fade-delay { animation: fadeIn 2.5s ease-in-out; }
.animate-fade-delay2 { animation: fadeIn 3.5s ease-in-out; }

/* Card hover */
.crd-ho { border: none; border-radius: 15px; transition: all 0.4s ease; background: #fff; }
.crd-ho:hover { transform: translateY(-8px); box-shadow: 0px 10px 25px rgba(0,0,0,0.15); }

.book-img { width: 100%; max-width: 160px; height: 200px; object-fit: cover; border-radius: 10px; }

.custom-btn-danger { background-color: #e53935; border: none; color: #fff; border-radius: 8px; transition: 0.3s; }
.custom-btn-danger:hover { background-color: #c62828; }

.custom-btn-primary { background-color: #303f9f; border: none; color: #fff; border-radius: 8px; transition: 0.3s; }
.custom-btn-primary:hover { background-color: #1a237e; }

.custom-btn-price { background-color: #f3f3f3; color: #303f9f; font-weight: 600; border-radius: 8px; }

.view-all-btn { background-color: #303f9f; color: #fff; border-radius: 50px; font-weight: 500; transition: all 0.3s ease; }
.view-all-btn:hover { background-color: #1a237e; transform: translateY(-3px); }

@media (max-width:768px){ .book-img{height:180px;} .crd-ho{margin-bottom:1rem;} }
@media (max-width:576px){ .book-img{height:160px;} .btn{font-size:0.8rem; padding:6px 10px;} h3{font-size:1.4rem;} }
</style>
</head>

<body style="background-color: #f7f7f7;">


	<%
	User u=(User)session.getAttribute("userobj");
	%>





	<%@include file="all_component/navbar.jsp"%>



<!-- Hero Section -->
<div class="container-fluid back-img d-flex flex-column justify-content-center align-items-center text-center text-white">
  <div class="content-box">
    <h2 class="display-4 fw-bold mb-3 animate-fade">📚 EBook Management System</h2>
    <p class="lead mb-4 animate-fade-delay">Discover, Read, and Manage Your Favorite Ebooks — Anytime, Anywhere.</p>
    <div class="d-flex justify-content-center flex-wrap gap-3 animate-fade-delay2">
      <a href="exploreLibrary.jsp" class="btn btn-light text-primary px-4 py-2 shadow-sm fw-semibold rounded-pill">
        <i class="fa-solid fa-book-open"></i> Explore Library
      </a>
      <a href="register.jsp" class="btn btn-primary px-4 py-2 shadow-sm fw-semibold rounded-pill ml-3" style="background-color:#303f9f; border:none;">
        <i class="fa-solid fa-rocket"></i> Get Started
      </a>
    </div>
  </div>
</div>

<!-- Hero End Here -->






<!-- 🌟 Start Recent Book Section  -->


	<div class="container my-5 px-4" id="RecentBook">
		<h3 class="text-center fw-bold mb-4" style="color: #303f9f;">📚
			Recent Books</h3>
		<div class="row gy-4 justify-content-center">
			<%
			BooksDAOImpl dao2 = new BooksDAOImpl(DBconnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>


			<div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex">
				<div class="card crd-ho flex-fill shadow-sm text-center">
					<div class="card-body">
						<img src="book/<%=b.getPhotoName() %>" alt="<%=b.getBookName()%>"
							class="book-img mb-3">
						<h6 class="fw-semibold mb-1"><%=b.getBookName()%></h6>
						<p class="text-muted small mb-1"><%=b.getAuthor()%></p>
						<p class="badge bg-success mb-3 text-white">
						<%
						if(b.getBookCategory().equals("Old"))
						{
						
						%>
						Categories : <%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2 flex-wrap">
						
							 <a href="viewbooks.jsp?bookId=<%=b.getBookId()%>"
								class="btn custom-btn-primary btn-sm shadow-sm ml-1"> <i
								class="fa-solid fa-eye"></i> View
							</a> 
							
							<a href="#" class="btn custom-btn-price btn-sm shadow-sm ml-1 mt-1" style="background-color: white; color: #303f9f; border: 1px solid #303f9f;">Price
								₹<%=b.getPrice()%>
							</a>
							
						</div>
						
							
						<% 
						} else{%>
							Categories : <%=b.getBookCategory()%></p>
							
						<div class="d-flex justify-content-center gap-2 flex-wrap">
						
						
						
						<%
							if (u == null) {
							%>
							<a href="login.jsp"
								class="btn custom-btn-danger btn-sm shadow-sm"> <i
								class="fa-solid fa-cart-plus"></i> Add
							</a>
							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn custom-btn-danger btn-sm shadow-sm"> <i
								class="fa-solid fa-cart-plus"></i> Add
							</a>

							<%
							}
							%>
							
							
							<a href="viewbooks.jsp?bookId=<%=b.getBookId()%>"
								class="btn custom-btn-primary btn-sm shadow-sm ml-1"> <i
								class="fa-solid fa-eye"></i> View
							</a> 
							
							<a href="#" class="btn custom-btn-price btn-sm shadow-sm ml-1 mt-1" style="background-color: white; color: #303f9f; border: 1px solid #303f9f;">Price
								₹<%=b.getPrice()%>
								
							</a>
							
						</div>
						<%
						}
						%>
						
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-5">
			<a href="allRecentBook.jsp" class="btn view-all-btn px-4 py-2 shadow-sm">
				<i class="fa-solid fa-arrow-right"></i> View All Books
			</a>
		</div>

	</div>



<!-- 🌟 End Recent Book Section -->












<!-- 🌟 New Books Section (Dynamic) -->


	<div class="container my-5 px-4">
		<h3 class="text-center fw-bold mb-4" style="color: #303f9f;">📔
			New Books</h3>
		<div class="row gy-4 justify-content-center">
			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBconnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex">
				<div class="card crd-ho flex-fill shadow-sm text-center">
					<div class="card-body">
						<img src="book/<%=b.getPhotoName()%>" alt="<%=b.getBookName()%>"
							class="book-img mb-3">
						<h6 class="fw-semibold mb-1"><%=b.getBookName()%></h6>
						<p class="text-muted small mb-1"><%=b.getAuthor()%></p>
						<p class="badge bg-success mb-3 text-white">
							Categories : <%=b.getBookCategory()%></p>
						
						<div class="d-flex justify-content-center gap-2 flex-wrap">

							<%
							if (u == null) {
							%>
							<a href="login.jsp"
								class="btn custom-btn-danger btn-sm shadow-sm"> <i
								class="fa-solid fa-cart-plus"></i> Add
							</a>
							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn custom-btn-danger btn-sm shadow-sm"> <i
								class="fa-solid fa-cart-plus"></i> Add
							</a>

							<%
							}
							%>


							<a href="viewbooks.jsp?bookId=<%=b.getBookId()%>"
								class="btn custom-btn-primary btn-sm shadow-sm ml-1"> <i
								class="fa-solid fa-eye"></i> View
							</a> 
							
							<a href="#" class="btn custom-btn-price btn-sm shadow-sm ml-1 mt-1" style="background-color: white; color: #303f9f; border: 1px solid #303f9f;">Price
								₹<%=b.getPrice()%>
							</a>
							
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-5">
			<a href="allNewBook.jsp" class="btn view-all-btn px-4 py-2 shadow-sm">
				<i class="fa-solid fa-arrow-right"></i> View All Books
			</a>
		</div>

	</div>










	<!-- 🌟 Star Old Book Section 📙 Old Books -->

<div class="container my-5 px-4" id="RecentBook">
    <h3 class="text-center fw-bold mb-4" style="color: #303f9f;">📚 Old Books</h3>

    <div class="row gy-4 justify-content-center">
        <%
            BooksDAOImpl dao3 = new BooksDAOImpl(DBconnect.getConn());
            List<BookDtls> list3 = dao3.getOldBooks();
            for (BookDtls b : list3) {
        %>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex">
            <div class="card crd-ho flex-fill shadow-sm text-center">
                <div class="card-body">
                    <img src="book/<%= b.getPhotoName() %>" alt="<%= b.getBookName() %>"
                        class="book-img mb-3 img-fluid rounded">
                    <h6 class="fw-semibold mb-1"><%= b.getBookName() %></h6>
                    <p class="text-muted small mb-1"><%= b.getAuthor() %></p>
                    <p class="badge bg-success mb-3 text-white">
                        Category: <%= b.getBookCategory() %>
                    </p>
                    <div class="d-flex justify-content-center gap-2 flex-wrap">
                       
                        <a href="viewbooks.jsp?bookId=<%= b.getBookId() %>"
                           class="btn custom-btn-primary btn-sm shadow-sm">
                            <i class="fa-solid fa-eye"></i> View
                        </a>
                        
                        <a href="#" class="btn custom-btn-price btn-sm shadow-sm ml-1" style="background-color: white; color: #303f9f; border: 1px solid #303f9f;">
                            Price ₹<%= b.getPrice() %>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%
            } // closing for loop
        %>
    </div>

    <div class="text-center mt-5">
        <a href="allOldBook.jsp" class="btn view-all-btn px-4 py-2 shadow-sm">
            <i class="fa-solid fa-arrow-right"></i> View All Books
        </a>
    </div>
</div>



<!-- 🌟 End Old Book Section -->
			
			
			
			
			
			
			
			

<%@include file="all_component/footer.jsp"%>
</body>
</html>
