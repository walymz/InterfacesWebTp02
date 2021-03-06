<%-- 
    Document   : ClienteBorrar
    Created on : 24 ene. 2021, 13:36:46
    Author     : Titos.arg
--%>

<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository"%>
<%@page import="java.time.LocalDateTime"%>

<%@page import="ar.org.centro8.curso.java.connectors.Connector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <% I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());%>
 
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar cliente</title>
        <!-- CSS only -->
         <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
       <div class="jumbotron">
          <h1>Mantenimiento de Clientes</h1>
       </div>
       <div class="container">
          <div class="card text-center">
            <div class="card-body"> 
              <%
                try {
                         cr.remove(cr.getById(Integer.parseInt(request.getParameter("id"))));
                         out.println("<h5 class=\"card-title\">¡Cliente eliminado!</h5>");   
                    } catch (Exception e) { 
                        out.println("<h5>¡No se pudo eliminar el cliente!</h5><br>");
                        System.out.print("********************************");
                        System.out.print(LocalDateTime.now());
                        e.printStackTrace();
                        System.out.print("********************************");
                    }
               %> 
            </div> 
            <div class="card-footer text-muted">
                 <a href="Clientes.jsp" class="btn btn-success btn-lg">Volver</a>
            </div>
    
         </div>
      </div>
            <!-- CSS only -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 </body>       
</html>
