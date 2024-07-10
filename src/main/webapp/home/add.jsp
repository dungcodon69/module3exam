<%--
  Created by IntelliJ IDEA.
  User: h4kar
  Date: 7/10/2024
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new</title>
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
    <h2>ADD NEW</h2>
    <hr>
    <form action="/home?action=add" method="post">
        <label class="form-label">Name</label>
        <input type="text" class="form-control" name="name" required>
        <label class="form-label">Price</label>
        <input type="number" class="form-control" name="price" required min="101">
        <label class="form-label">Discount</label>
        <select class="form-select" aria-label="Default select example" name="discount" required>
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
        </select>
        <label class="form-label">Stock</label>
        <input type="number" class="form-control" name="stock" required min="11">
        <button type="submit" class="btn btn-secondary mt-2">ADD</button>
    </form>

</div>

</body>
</html>
