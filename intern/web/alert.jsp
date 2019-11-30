<p style="font-size:25px;margin: 0">
    <% try {
            if (request.getParameter("msg") != null) {
                out.println(request.getParameter("msg"));
            }
            else{
                out.println(session.getAttribute("msg").toString());
            }
        } catch (Exception e) {
        }
    %> 
</p>