<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: h4kar
  Date: 7/10/2024
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%--NAV BAR--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%--END NAV BAR--%>

<div class="container">
    <h2>MANAGEMENT SYSTEM</h2>
    <hr>
    <a href="/home?action=add"><button type="button" class="btn btn-outline-secondary">ADD NEW</button></a>
    <form action="/home?action=search" method="post">
        <div class="row mt-3">
            <div class="col-auto">
                <span class="align-middle">Danh sách top: </span>
            </div>
            <div class="col-md-2">
                <select class="form-select" aria-label="Default select example" name="top">
                    <option value="3">Top 3</option>
                    <option value="5">Top 5</option>
                    <option value="10">Top 10</option>
                </select>
            </div>
            <div class="col-auto">
                <span> Sản phẩm được đặt hàng nhiều nhất</span>
            </div>
            <div class="col">
                <button type="submit" class="btn btn-outline-primary">XEM</button>
            </div>
        </div>
    </form>
    <div class="row mt-3">
        <div>Danh sách sản phẩm đặt từ</div>
        <form action="home?action=date" method="post">

        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <label for="startDate">Ngày bắt đầu</label>
                <input id="startDate" class="form-control" type="date" name="startDate"/>
                <span id="startDateSelected"></span>
            </div>
            <div class="col-lg-3 col-sm-6">
                <label for="endDate">Ngày kết thúc</label>
                <input id="endDate" class="form-control" type="date" name="endDate"/>
                <span id="endDateSelected"></span>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-outline-primary">XEM</button>
            </div>
        </div>
        </form>
    </div>
    <table class="table table-bordered mt-2">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Discount</th>
            <th scope="col">Stock</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.discount}</td>
                <td>${product.stock}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
