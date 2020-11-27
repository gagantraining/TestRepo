<%@page import="java.util.Random"%>
<%@page import="text.EncryptText"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbcon.ConnectionDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Connection con= ConnectionDB.getConnection();
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            pass = EncryptText.getEncrypted(EncryptText.getEncrypted(EncryptText.getEncrypted(pass,"MD5"),"SHA-1"),"MD5");
            RequestDispatcher rd;
            PreparedStatement ps = con.prepareStatement("select * from student where Email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                    if(pass.equals(rs.getString("Password"))){
                        out.print("Success");
                        HttpSession sess = request.getSession();
                        Random r = new Random();
                        int x  = (r.nextInt(900)+100)*100;
                        String key = EncryptText.getEncrypted(x+"", "MD5");
                        sess.setAttribute("name", rs.getString("Name"));
                        sess.setAttribute("email", rs.getString("Email"));
                        sess.setAttribute("log_key", key);
                        response.sendRedirect("welcome.jsp");
                    }
                    else{
                        rd = request.getRequestDispatcher("login.html");
                        out.print("<script>alert('Invalid Password')</script>");
                        //rd.include(request, response);
                    }
            }else{
                rd = request.getRequestDispatcher("login.html");
                out.print("<script>alert('Invalid User Please Register')</script>");
                //rd.include(request, response);            
            }
        %>
    </body>
</html>
