<%
    if (session != null) {
        if (session.getAttribute("admin") != null) {
            String user = (String) session.getAttribute("admin");
        } else {
            response.sendRedirect("login.jsp?msg=Please login here");
        }
    }
%>
<% 
  
        session.invalidate(); 
        response.sendRedirect("login.jsp?msg=Thank you. Please come again");
    
    

%>