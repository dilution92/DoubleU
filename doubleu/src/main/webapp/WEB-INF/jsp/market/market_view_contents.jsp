<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table  class="table table-striped market-view-table">
			  <thead>
			    <tr >
			      <th scope="col" style="background-color:#f1f2f4;">카테고리</th>
			      <th scope="col" >뷰티/미용</th>
			      <th scope="col" style="background-color:#f1f2f4;">날짜</th>
			      <th scope="col" >2021-02-21</th>
			    </tr>
			    <tr >
			      <th scope="col"style="background-color:#f1f2f4;">작성자</th>
			      <th scope="col" >김재현</th>
			      <th scope="col" style="background-color:#f1f2f4;">조회수</th>
			      <th scope="col" >23</th>
			    </tr>
			  </thead>
			  
			</table>
			<div class='market-view-container'>
				
				<!--  <img src="../images/market/tum.jpeg" class="rounded float-left market-img" alt="...">-->
				<div class='market-view-form' style="display:flex;">	
					<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="width:250px;">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="../images/market/tum.jpeg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="../images/market/tum.jpeg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="../images/market/tum.jpeg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>				
					<div class="form-group-container" style="width:100%; margin-left:50px;">	
					  <div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">제품명</label>
					    <div class="col-sm-8">
					      <div class="form-control" id="inputEmail3" >텀블러</div>
					    </div>
					  </div>
	
					  <div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">가격</label>
					    
					    <div class="col-sm-6" style="display: flex;">
					      <div class="form-control" id="inputEmail3" >8,000원</div>

					    </div>
  							<button data-toggle="modal" 	data-target="#goAccount" type="button" value="찜목록" class="btn btn-primary mb-2">계좌보기</button>
					  </div>
					  <div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">❤</label>
					    
					    <div class="col-sm-6" style="display: flex;">
					      <div class="form-control" id="inputEmail3" >23</div>
						</div>
						
  							<button type="submit"  id="godibModal"class="btn btn-primary mb-2">찜하기</button>
					  </div>
					    </div>
					
				</div>
				
				<div class="card">
				  <div class="card-body">
						It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).				  </div>
				</div>
				
								<div class="market-btn-zone">
					<button class="btn btn-primary" type="submit" id=''>목록</button>
				</div>
			 </div>
</body>
</html>