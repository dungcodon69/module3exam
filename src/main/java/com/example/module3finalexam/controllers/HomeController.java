package com.example.module3finalexam.controllers;


import com.example.module3finalexam.models.Product;
import com.example.module3finalexam.repositories.ProductRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(value = "/home")
public class HomeController extends HttpServlet {
    ProductRepository productRepository = new ProductRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                req.getRequestDispatcher("/home/add.jsp").forward(req,resp);
                break;
            case "update":
                req.getRequestDispatcher("/home/update.jsp").forward(req,resp);
                break;
            default:
                List<Product> products = productRepository.findAllProduct();
                req.setAttribute("products",products);
                req.getRequestDispatcher("/home/index.jsp").forward(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                String name = req.getParameter("name");
                float price = Float.parseFloat(req.getParameter("price"));
                int discount = Integer.parseInt(req.getParameter("discount"));
                int stock = Integer.parseInt(req.getParameter("stock"));
                Product p = new Product(name,price,discount,stock);
                productRepository.addNewProduct(p);
                resp.sendRedirect("/home");
                break;
            case "date":
                String startDate = req.getParameter("startDate");
                String endDate = req.getParameter("endDate");
                List<Product> productsDate = productRepository.getOrderByDate(startDate,endDate);
                req.setAttribute("products",productsDate);
                req.getRequestDispatcher("/home/index.jsp").forward(req,resp);
                break;
            case "search":
                int top = Integer.parseInt(req.getParameter("top"));
                List<Product> products = productRepository.getOrderByTop(top);
                req.setAttribute("products",products);
                req.getRequestDispatcher("/home/index.jsp").forward(req,resp);
                break;
        }
    }
}
