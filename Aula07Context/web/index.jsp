<%-- 
    Document   : index
    Created on : 30/09/2021, 13:28:15
    Author     : sthefany.cordeiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String context = request.getParameter("context");   
    String name = request.getParameter("name");
    if (context !=null && name !=null) {
        if (context.equals("request")) {    
            request.setAttribute("name", name);
        } else if (context.equals("session")) {    
            session.setAttribute("session", session); 
            }
            else if (context.equals("application")) {    
            application.setAttribute("name", name); 
            }
    }
    
    String requestName = (String) request.getAttribute("name");
    String sessionName = (String) session.getAttribute("name");
    String applicationName = (String) application.getAttribute("name");
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atributos de contexto</title>
    </head>
    <body>
        <h1>Atributos de contexto</h1>
        <form action="action">
            Contexto:
            <select name="context"> 
                <option value=""></option>
                <option value="request">Requisição</option>
                <option value="session">Sessão</option>
                <option value="application">Aplicação</option>
            </select>     
            Nome: <input type="text" name="name"/>
            <input type="submit" name="Enviar"/>
        </form>
        <%if (requestName !=null) {%>
            <hr/>
            <h2>Requisição</h2>
            <div>Nome: <%= requestName%></div>
        <%} %>        
        <%if (sessionName!=null) {%>
            <hr/>
            <h2>Sessão</h2>
            <div>Nome: <%= sessionName%></div> 
        <%} %>        
        <%if (applicationName!=null) {%>
            <hr/>
            <h2>Aplicação</h2>
            <div>Nome: <%= applicationName%></div> 
        <%} %>  
    </body>
</html>
