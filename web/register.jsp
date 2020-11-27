<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbcon.ConnectionDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="text.EncryptText"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String pass = request.getParameter("password");
    pass = EncryptText.getEncrypted(EncryptText.getEncrypted(EncryptText.getEncrypted(pass,"MD5"),"SHA-1"),"MD5");
    String gender = request.getParameter("gen");
    String add = request.getParameter("address");
    String batch = request.getParameter("batch");
    String dob = request.getParameter("dob");
    String dept = request.getParameter("dept");
    Connection con = ConnectionDB.getConnection();
    PreparedStatement ps= con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, phone);
    ps.setString(4, gender);
    ps.setString(5, add);
    ps.setString(6, dob);
    ps.setString(7, batch);
    ps.setString(8, dept);
    ps.setString(9, "images\\noimage.jpg");
    ps.setString(10, pass);
    if(ps.executeUpdate()>0){
        out.print("Registration Successfull");
        con.commit();
        con.close();
    }else{
            out.print("Can't Register");
            con.close();
    }
%>