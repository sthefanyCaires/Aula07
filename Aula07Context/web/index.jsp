<%-- 
    Document   : index
    Created on : 20 de set. de 2021, 19:18:48
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //Processamento do formulário
    String context = request.getParameter("context");
    String name = request.getParameter("name");
    if(context != null && name!=null){
        if(context.equals("request")){
            request.setAttribute("name", name);
        }else if(context.equals("session")){
            session.setAttribute("name", name);
            session.setAttribute("counter", 1);
        }else if(context.equals("application")){
            application.setAttribute("name", name);
        }
    }
    //Processamento do contador de requisições
    if(application.getAttribute("counter")==null){
        application.setAttribute("counter", 1);
    }
    int counter = (int) application.getAttribute("counter");
    application.setAttribute("counter", counter+1);
    //Processamento do contador de requisições da sessão
    int sessionCounter = 0;
    if(session.getAttribute("counter")!=null){
        sessionCounter = (int) session.getAttribute("counter");
        session.setAttribute("counter", sessionCounter+1);
    }
    //Leitura dos atributos
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
        <h1><a href="index.jsp">Atributos de contexto</a></h1>
        <form>
            Contexto:
            <select name="context">
                <option value=""></option>
                <option value="request">Requisição</option>
                <option value="session">Sessão</option>
                <option value="application">Aplicação</option>
            </select>
            Nome:<input type="text" name="name"/>
            <input type="submit" value="Enviar"/>
        </form>
        <%if(requestName!=null){%>
            <hr/>
            <h2>Requisição</h2>
            <div>Nome: <%= requestName %></div>
        <%}%>
        <%if(sessionName!=null){%>
            <hr/>
            <h2>Sessão</h2>
            <h3>Nome: <%= sessionName %></h3>
            <h3>Requisições: <%= sessionCounter %></h3>
        <%}%>
        <hr/>
        <h2>Aplicação</h2>
        <h3>Requisições: <%= counter %></h3>
        <%if(applicationName!=null){%>
            <h3>Nome: <%= applicationName %></h3>
        <%}%>
    </body>
</html>