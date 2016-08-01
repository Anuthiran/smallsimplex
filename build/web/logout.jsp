<%
    if (session != null) {
        if (session.getAttribute("client") != null) {
            String user = (String) session.getAttribute("client");
        } else {
            response.sendRedirect("index.jsp?msg=Please login here");
        }
    }
%>
<% 
  
        session.invalidate(); 
        response.sendRedirect("index.jsp?msg=Thank you. Please come again");
    
    

%>
