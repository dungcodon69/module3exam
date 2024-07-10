package com.example.module3finalexam.repositories;

import com.example.module3finalexam.models.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {

    public List<Product> findAllProduct(){
        List<Product> products = new ArrayList<>();
        String sql = "select * from products";
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionInstance().prepareStatement(sql);
            ResultSet  s = preparedStatement.executeQuery();
            while (s.next()){
                Product product = new Product(s.getInt("id_product"),s.getString("name_product"),s.getFloat("price"),s.getInt("discount"),s.getInt("stock"));
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public void addNewProduct(Product p ){
        String sql = "insert into products(name_product,price,discount,stock) values (?,?,?,?)";
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionInstance().prepareStatement(sql);
            preparedStatement.setString(1,p.getName());
            preparedStatement.setFloat(2,p.getPrice());
            preparedStatement.setInt(3,p.getDiscount());
            preparedStatement.setInt(4,p.getStock());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> getOrderByTop(int top) {
        List<Product> products = new ArrayList<>();
        String sql = "select products.*, sum(quantity) as sum from products inner join orders_detail on products.id_product = orders_detail.id_product group by products.id_product\n" +
                "order by sum desc limit ?";
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionInstance().prepareStatement(sql);
            preparedStatement.setInt(1,top);
            ResultSet  s = preparedStatement.executeQuery();
            while (s.next()){
                Product product = new Product(s.getInt("id_product"),s.getString("name_product"),s.getFloat("price"),s.getInt("discount"),s.getInt("stock"));
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public List<Product> getOrderByDate(String startDate, String endDate) {
        List<Product> products = new ArrayList<>();
        String sql = "select products.*from products inner join orders_detail on products.id_product = orders_detail.id_product \n" +
                "inner join orders on orders.id_order = orders_detail.id_order\n" +
                "where orders.dateOrder between ? and ? \n" +
                "group by products.id_product";

        try {
            PreparedStatement preparedStatement = BaseRepository.getConnectionInstance().prepareStatement(sql);
            preparedStatement.setString(1,startDate);
            preparedStatement.setString(2,endDate);
            ResultSet  s = preparedStatement.executeQuery();
            while (s.next()){
                Product product = new Product(s.getInt("id_product"),s.getString("name_product"),s.getFloat("price"),s.getInt("discount"),s.getInt("stock"));
                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}
