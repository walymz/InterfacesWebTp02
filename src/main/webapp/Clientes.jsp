<%-- 
    Document   : Clientes
    Created on : 29 mayo 2021, 11:06
    Author     : Waleska
--%>

<%@page import="java.util.List"%>
<%@page import="ar.org.centro8.curso.java.web.utils.TableHtml"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Cliente"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enums.TipoDocumento"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ar.org.centro8.curso.java.connectors.Connector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ClienteRepository cr = new ClienteRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html lang="es">
   <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
     <title>Cliente</title>
     <!-- Hoja de estilo -->
     <link rel="stylesheet" type="text/css" href="css/style.css"/>
   </head>
   <body>
     <div class="jumbotron">
         <h1>Mantenimiento de Clientes</h1>
     </div>  
     <div class="container">
       <div class="card bg-light">
           <h5 class="card-title principal">Nuevo Cliente:</h5>
              <div class="card-body d-grid gap-2 pb-0 d-md-flex justify-content-center">
                    <form class="row g-4">
                        <div class="col-3"> 
                            <input type="text" class="form-control" id="nombre" name="nombre" minlength="3" maxlength="20" placeholder="Nombre" aria-label="Nombre" required>
                            <div class="invalid-feedback">
                                Por favor el nombre debe tener entre 3 y 20 caracteres.
                            </div>
                        </div>
                        <div class="col-3"> 
                            <input type="text" class="form-control" id="apellido" name="apellido" minlength="3" maxlength="20" placeholder="Apellido" aria-label="Apellido" required>
                            <div class="invalid-feedback">
                                Por favor el apellido debe tener entre 3 y 20 caracteres.
                            </div>
                        </div>
                        <div class="col-2">
                            <input type="number" class="form-control" id="edad" name="edad" placeholder="Edad" aria-label="edad" required> 
                            <div class="invalid-feedback">
                                Por favor la edad debe ser un valor numérico.
                            </div>
                        </div>
                         <div class="col-4">
                            <input type="text" class="form-control" id="direccion" name="direccion" minlength="3" maxlength="50" placeholder="Dirección" aria-label="direccion" required> 
                            <div class="invalid-feedback">
                                Por favor la dirección debe tener entre 3 y 50 caracteres.
                            </div>    
                        </div>
                        <div class="col-5">
                            <input type="email" class="form-control" id="email" name="email" minlength="3" maxlength="30" placeholder="Email" aria-label="email" required> 
                            <div class="invalid-feedback">
                                Por favor el email debe contener entre 3 y 30 caracteres.
                            </div>    
                        </div> 
                         <div class="col-2">
                            <input type="number" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" aria-label="telefono" required>   
                        </div>
                        <div class="col-2">
                            <select class="form-select" id="tipo" name="tipoDocumento" required>
                                <option selected disabled value="">Tipo de Documento</option>
                                 <%
                                   for(TipoDocumento t: TipoDocumento.values()){
                                       out.print("<option value="+t.toString()+">"+t.toString()+"</option>");
                                   }
                                 %>
                            </select>
                            <div class="invalid-feedback">
                                Por favor seleccione un tipo de documento.
                            </div>
                        </div>
                        <div class="col-3">
                            <input type="number" class="form-control" id="numeroDocumento" name="numeroDocumento" placeholder="Número de documento" aria-label="numeroDocumento" required> 
                        </div>
                        <div class="d-grid mt-3 gap-2 d-md-flex justify-content-center boton">
                            <button class="btn btn-success btn-lg" type="submit">Aceptar</button>
                            <button class="btn btn-success btn-lg" type="reset">Cancelar</button>
                        </div>   
                    </form>   
                 </div>     
                   
           </div>
         
           <%        
                //////////////////////// INSERTAR CLIENTE NUEVO ////////////////////////////  
           try {
                   try {
                       String nombre = request.getParameter("nombre");
                       String apellido = request.getParameter("apellido");
                       int edad = Integer.parseInt(request.getParameter("edad"));
                       String direccion = request.getParameter("direccion");
                       String email = request.getParameter("email");
                       String telefono = request.getParameter("telefono");
                       TipoDocumento tipoDocumento = TipoDocumento.valueOf(request.getParameter("tipoDocumento"));
                       String numeroDocumento = request.getParameter("numeroDocumento");

                       Cliente cliente = new Cliente(nombre, apellido, edad, direccion, telefono, email, tipoDocumento, numeroDocumento);
                       cr.save(cliente);

                       if (cliente.getId() != 0) {
                           out.print("<h5>Se guardó el cliente id=" + cliente.getId() + "</h5>");
                       } else {
                           out.print("<h5>No se pudo dar de alta al cliente</h5>");
                       }
                   } catch (NumberFormatException e) {
                       out.println("<p class=\"principal\"> Debe completar todos los campos</p>");
                   }
               } catch (Exception e) {
                   out.println("<p class=\"principal\"> Debe completar todos los campos</p>");
               }
           %>
        
           <div class="card">
              <div class="card-body">               
                     <form class="row g-7">
                         <div class="d-grid gap-2 d-md-flex justify-content-center">
                            <div class="col-auto">  
                                <input type="text" class="form-control" id="buscarNombre" name="buscarNombre" placeholder="Buscar por nombre" aria-label="buscarNombre">
                            </div>
                            <div class="col-auto">  
                                <button class="btn btn-outline-success me-md-2" type="submit">Aceptar</button>
                            </div>
                            <div class="col-auto">  
                                <input type="text" class="form-control" id="buscarApellido" name="buscarApellido" placeholder="Buscar por apellido" aria-label="buscarApellido">
                            </div>
                            <div class="col-auto">  
                                <button class="btn btn-outline-success me-md-2" type="submit">Aceptar</button>
                            </div> 
                        </div>
                     </form>
               </div>
             </div>
             <h5 class="card-title principal">Clientes registrados:</h5>
         </div>
           <div id="tabla"></div>
                 <%
                    //////////////////////// MOSTRAR CLIENTES EN TABLA  //////////////////////////// 
                   
                   String tablaHTML="";
                   String estilo="class=\"table table-striped\"";
                   
                   String buscarApellido = request.getParameter("buscarApellido");
                   String buscarNombre = request.getParameter("buscarNombre");
                   if (buscarApellido==null) buscarApellido="";
                   if (buscarNombre==null) buscarNombre="";
                   
                   if (buscarApellido.isBlank() && buscarNombre.isBlank()) tablaHTML = new TableHtml<Cliente>().getTable(cr.getAll(), estilo, "ClientesUpdate.jsp", "ClientesBaja.jsp");
                   
                   if (!buscarApellido.isBlank())
                        tablaHTML = new TableHtml<Cliente>().getTable(cr.getLikeApellido(buscarApellido), estilo, "ClientesUpdate.jsp", "ClientesBaja.jsp");
                   
                   if (!buscarNombre.isBlank())
                        tablaHTML = new TableHtml<Cliente>().getTable(cr.getLikeNombre(buscarNombre), estilo, "ClientesUpdate.jsp", "ClientesBaja.jsp");
                      
                      out.println("<div id=\"contenido\">"+ tablaHTML +"</div>");
                %>
               
       <!-- CSS only -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"> 
   </body> 
</html>
