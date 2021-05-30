<%-- 
    Document   : ClientesUpdate
    Created on : 24 ene. 2021, 12:22:31
    Author     : Titos.arg
--%>


<%@page import="ar.org.centro8.curso.java.aplicaciones.enums.TipoDocumento"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Cliente"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.connectors.Connector"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  I_ClienteRepository cr = new ClienteRepository(Connector.getConnection());  %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar cliente</title>
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
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Actualización de Clientes</h5>     
                </div>
                <div class="card-footer text-muted">
                    <%  Cliente cliente = null;
                        try {
                            cliente = cr.getById(Integer.parseInt(request.getParameter("id")));
                        } catch (Exception e) {
                            out.println("<h5>¡Parámetro no validos!</h5><br>");
                            out.println("<a href=\"Cliente.jsp\" class=\"btn btn-success btn-lg\">Volver</a>");
                        }
                        if (cliente != null) {
                    %>
                    <div class="container">
                        <div class="card bg-light">
                            <div class="card-body d-grid gap-2 pb-0 d-md-flex justify-content-center">
                                <form class="row g-4" action="ClienteModificado.jsp" method="GET">
                                    <div class="col-3">
                                        <input type="text" class="form-control" id="id" name="id" value=<% out.println(cliente.getId());%> hidden>
                                        <label for="nombre" class="form-label">Nombre:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" value=<% out.println(cliente.getNombre());%> minlength="3" maxlength="20" placeholder="Nombre" aria-label="nombre" required>
                                        <div class="invalid-feedback">
                                            Por favor el nombre debe tener entre 3 y 20 caracteres.
                                        </div>
                                    </div>
                                    <div class="col-3"> 
                                        <label for="apellido" class="form-label">Apellido:</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" value=<% out.println(cliente.getApellido());%> minlength="3" maxlength="20" placeholder="Apellido" aria-label="apellido" required>
                                        <div class="invalid-feedback">
                                            Por favor el apellido debe tener entre 3 y 20 caracteres.
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="edad" class="form-label">Edad:</label>
                                        <input type="number" class="form-control" id="edad" name="edad" value=<% out.println(cliente.getEdad());%> placeholder="Edad" aria-label="edad" required> 
                                        <div class="invalid-feedback">
                                            Por favor la edad debe ser un valor numérico.
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label for="direccion" class="form-label">Direccion:</label>
                                        <input type="text" class="form-control" id="direccion" name="direccion" value=<% out.println(cliente.getDireccion());%> minlength="3" maxlength="50" placeholder="Dirección" aria-label="direccion" required> 
                                        <div class="invalid-feedback">
                                            Por favor la dirección debe tener entre 3 y 50 caracteres.
                                        </div>    
                                    </div>
                                    <div class="col-5">
                                        <label for="email" class="form-label">Email:</label>
                                        <input type="email" class="form-control" id="email" name="email" value=<% out.println(cliente.getEmail());%> minlength="3" maxlength="30" placeholder="Email" aria-label="email" required> 
                                        <div class="invalid-feedback">
                                            Por favor el email debe contener entre 3 y 30 caracteres.
                                        </div>    
                                    </div> 
                                    <div class="col-2">
                                        <label for="telefono" class="form-label">Teléfono:</label>
                                        <input type="number" class="form-control" id="telefono" name="telefono" value=<% out.println(cliente.getTelefono());%> placeholder="Teléfono" aria-label="telefono" required> 
                                        <div class="invalid-feedback">
                                            Por favor el teléfono debe tener entre 3 y 25 números.
                                        </div>    
                                    </div>
                                    <div class="col-2">
                                        <label for="tipoDocumento" class="form-label">Tipo documento:</label>
                                        <select id="tipoDocumento" class="form-select" name="tipoDocumento" required>
                                            <%
                                                for (TipoDocumento t : TipoDocumento.values()) {
                                                    if (t == cliente.getTipoDocumento()) {
                                                        out.println("<option value=" + t + " selected>" + t + "</option>");
                                                    } else {
                                                        out.println("<option value=" + t + ">" + t + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                        <div class="invalid-feedback">
                                            Por favor seleccione un tipo de documento.
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <label for="numeroDocumento" class="form-label">Número de documento:</label>
                                        <input type="number" class="form-control" id="numeroDocumento" name="numeroDocumento" value=<% out.println(cliente.getNumeroDocumento());%> placeholder="Número de documento" aria-label="numeroDocumento" required>
                                        <div class="col-6 invalid-feedback">
                                            Por favor el número de documento debe contener 8 caracteres.
                                        </div>    
                                    </div>
                                    <div class="d-grid mt-3 gap-2 d-md-flex justify-content-center boton">
                                        <button class="btn btn-success btn-lg" type="submit">Aceptar</button>
                                        <button class="btn btn-success btn-lg" type="button" onclick="history.back()">Volver</button>
                                    </div>   
                                </form>   
                            </div>     
                        </div>
                    </div>
                 <% } %>
                </div>                    
            </div>             
        </div>       
</body>
</html>
