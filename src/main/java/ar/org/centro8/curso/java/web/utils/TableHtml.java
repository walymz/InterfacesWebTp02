package ar.org.centro8.curso.java.web.utils;
import java.lang.reflect.Field;
import java.util.List;
public class TableHtml<E>{
    public String getTable(List<E>list, String estilo){
        String table="";
        if(list==null || list.isEmpty()) return table;
        if(estilo==null) table="<table>";  
        else table="<table "+estilo+">";
        E e=list.get(0);
        Field[] campos=e.getClass().getDeclaredFields();
        table+="<tr>";
        String titulo="";
        for(Field f:campos){
            titulo = f.getName().substring(0, 1).toUpperCase()
                    + f.getName().substring(1);
            table += "<th>";
            table += titulo;
            table += "</th>";
        }
        table+="</tr>";
        for(E o:list){
            table+="<tr>";
            for(Field f:campos){
                table+="<td>";
                String method="get"
                        +f
                        .getName()
                        .substring(0,1)
                        .toUpperCase()
                        +f
                                .getName()
                                .substring(1);
                //table+=method;
                try {
                    table+=e.getClass().getMethod(method, null).invoke(o, null);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
                table+="</td>";
            }
            table+="</tr>";
        }
        table+="</table>";
        return table;
    }
    
    public String getTable(List<E>list,String estilo, String linkUpdate, String linkDelete){
        String table="";
        if(list==null || list.isEmpty()) return table;
        if(estilo==null) table="<table>";  
        else table="<table "+estilo+">";
        E e=list.get(0);
        Field[] campos=e.getClass().getDeclaredFields();
        table+="<tr>";
        String titulo="";
        for(Field f:campos){
            titulo = f.getName().substring(0, 1).toUpperCase()
                    + f.getName().substring(1);
            table += "<th>";
            table += titulo;
            table += "</th>";
        }
        table+="<th>Actualizar</th>";
        table+="<th>Eliminar</th>";
        table+="</tr>";
        for(E o:list){
            table+="<tr>";
            for(Field f:campos){
                table+="<td>";
                String method="get"
                        +f
                        .getName()
                        .substring(0,1)
                        .toUpperCase()
                        +f
                                .getName()
                                .substring(1);
                //table+=method;
                try {
                    table+=e.getClass().getMethod(method, null).invoke(o, null);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
                table+="</td>";
            }
            try{
                //Enlace para actualizar registro
                 table+="<td><div class=\"iconos\"><a href='"+linkUpdate+"?id="
                        +e.getClass().getMethod("getId", null).invoke(o, null)
                        +"'><img src=\"img/update.png\" alt=\"Actualizar\"/></a></div></td>";
                //Enlace para borrar registro
                 table+="<td><div class=\"iconos\"><a href='"+linkDelete+"?id="
                        +e.getClass().getMethod("getId", null).invoke(o, null)
                        +"'><img src=\"img/delete.png\" alt=\"Eliminar\"/></a></div></td>";
            }catch(Exception ex){
                System.out.println(ex);
            }
            table+="</tr>";
        }
        table+="</table>";
        return table;
    }
}