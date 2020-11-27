<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                 <a class="navbar-brand" href="#">
                  <img src="images/logo.png" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
                  College Management System
                </a>
                
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-link" href="#">Features</a>
                        <a class="nav-link" href="#">Pricing</a>
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                        
                    </div>
                </div>
                <%
                        HttpSession sess = request.getSession(false);
                        if(sess.getAttribute("email")==null){
                
                %>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                        <button class="btn btn-primary" style="margin:5px" onclick="window.location.href='login.html'">Login</button>
                        <button class="btn btn-danger" style="margin:5px" onclick="window.location.href='register.html'">Register</button>
                    </div>
                <%
                    }else{
                %>
                <div class="navbar-nav" style="color: white">
                Welcome <strong><% out.print(sess.getAttribute("name"));%></strong>
                    </div>
                    <button class="btn btn-sm btn-success" onclick="window.location.href='logout.jsp?key=<% out.print(sess.getAttribute("log_key"));%>'">Logout</button>
                <% }
                %>
</nav>
