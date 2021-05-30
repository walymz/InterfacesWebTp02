<%-- 
    Document   : ClientesBaja
    Created on : 24 ene. 2021, 12:22:18
    Author     : Titos.arg
--%>

<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Cliente"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.connectors.Connector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());
    Cliente cliente = new Cliente();%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Cliente</title>
        <!-- CSS only -->
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
    </head>
    <body>
        <div class="jumbotron">
            <h1>Mantenimiento de Clientes</h1>
        </div>       
        <div class="container">
            <div class="card text-left">
                <div class="card-body"> 
                    <h5 class="card-title text-center">Baja de Cliente</h5>
                    <%
                        try {
                            cliente = cr.getById(Integer.parseInt(request.getParameter("id")));
                            if (cliente != null) {
                                out.println("<h5 class=\"card-title card text-center\"> ¿Desea eliminar el cliente " + cliente.getNombre() + " " + cliente.getApellido() + " con el id= " + cliente.getId() + "?</center></h5>");   %>

                    <form action="ClienteBorrar.jsp">
                        <input type="text" value=<%out.println(request.getParameter("id").trim());%> name="id" readOnly hidden/>
                        <div class="d-grid gap-2 d-md-flex justify-content-center boton">
                            <button class="btn btn-success btn-lg" type="submit">Eliminar</button>
                            <button class="btn btn-success btn-lg" type="button" onclick="history.back()">Volver</button>
                        </div>    
                    </form>


                    <% }
                    } catch (Exception e) {  %>
                    <div class="card-footer text-muted text-center">
                        <h5>¡Parámetros no validos!</h5><br>
                        <a href="Clientes.jsp" class="btn btn-success btn-lg">Volver</a>
                    </div>
                    <%   
                      }%>


                </div>  

            </div>       
        </div>                  

    </body>
</html>
