<%-- 
    Document   : ClientesAlta
    Created on : 22 ene. 2021, 16:19:07
    Author     : Titos.arg
--%>

<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Cliente"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enums.TipoDocumento"%>
<%@page import="ar.org.centro8.curso.java.connectors.Connector"%>

<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <title>Alta de clientes</title>
    </head>
    <body>
      <div class="jumbotron">
          <h1>Mantenimiento de Clientes</h1>
      </div>
      <div class="container">
        <div class="card">
         <div class="card-body text-center">
           <h5 class="card-title">Alta de Clientes</h5>        
                <form action="Cliente.jsp">
                    <% 
                        try {

                             String nombre                  =   request.getParameter("nombre");
                             String apellido                =   request.getParameter("apellido");
                             int edad                       =   Integer.parseInt(request.getParameter("edad"));
                             String direccion               =   request.getParameter("direccion");
                             String telefono                =   request.getParameter("telefono");
                             String email                   =   request.getParameter("email");
                             TipoDocumento tipoDocumento    =   TipoDocumento.valueOf(request.getParameter("tipoDocumento"));
                             String numeroDocumento         =   request.getParameter("numeroDocumento");

                            Cliente cliente = new Cliente(
                                    nombre,
                                    apellido,
                                    edad,
                                    direccion,
                                    email,
                                    telefono,
                                    tipoDocumento,
                                    numeroDocumento
                            );

                            I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());
                            cr.save(cliente);
                            out.println("<h5>Se dio de alta al cliente "+cliente.getNombre()+" "+ cliente.getApellido()+" con el id="+cliente.getId()+"</h5>");


                            } catch (Exception e) { 
                                out.println("<div class=\"card-footer text-muted\">");
                                out.println("<h5>Parámetros no validos</h5>");
                                System.out.print("********************************");
                                System.out.print(LocalDateTime.now());
                                e.printStackTrace();
                                System.out.print("********************************");
                            }

                    %>
                 
                    <div class="mx-auto boton text-center">
                          <button class="btn btn-success btn-lg" type="submit">Volver</button>
                    </div>
                  </div>       
                </form>
              </div>  
           </div>         
        <!-- CSS only -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"> 
    </body>
</html>
