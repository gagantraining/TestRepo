
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.ConnectionDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
            HttpSession sess = request.getSession(false);
            String email = sess.getAttribute("email").toString();
            String path = "C:/Users/gagan/Desktop/SMIT Advanced JAVA/CollegeManagement/web/images/uploads/"+email;
            File f = new File(path);
            if(!f.exists()){
                f.mkdirs();
            }else{
                out.print("not done");
            }
            try{
                MultipartRequest mr = new MultipartRequest(request,path,2017952);
                path = "images/uploads/"+email+"/"+mr.getOriginalFileName("image");
                Connection con = ConnectionDB.getConnection();
                PreparedStatement ps = con.prepareStatement("update student set Picture=? where Email=?");
                ps.setString(1, path);
                ps.setString(2, email);
                if(ps.executeUpdate()>0){
                    con.commit();
                    con.close();
                    out.print("<script>alert('upload success')</script>");
                    out.print("<script>window.location.href='welcome.jsp'</script>");
                }
            }catch(IOException e){
                out.print("<h1> Image Size too Large </h1>");
            }
            
        %>
    </body>
</html>
