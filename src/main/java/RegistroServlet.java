import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener los datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fechaNacimiento = request.getParameter("fecha_nacimiento");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        
        // Crear un nuevo libro de Excel
        XSSFWorkbook libro = new XSSFWorkbook();
        
        // Crear una nueva hoja en el libro
        XSSFSheet hoja = libro.createSheet("Registro");
        
        // Crear una nueva fila en la hoja
        XSSFRow fila = hoja.createRow(0);
        
        // Crear celdas en la fila y escribir los datos del formulario en ellas
        XSSFCell celdaNombre = fila.createCell(0);
        celdaNombre.setCellValue(nombre);
        
        XSSFCell celdaApellido = fila.createCell(1);
        celdaApellido.setCellValue(apellido);
        
        XSSFCell celdaFechaNacimiento = fila.createCell(2);
        celdaFechaNacimiento.setCellValue(fechaNacimiento);
        
        XSSFCell celdaTelefono = fila.createCell(3);
        celdaTelefono.setCellValue(telefono);
        
        XSSFCell celdaDireccion = fila.createCell(4);
        celdaDireccion.setCellValue(direccion);
        
        // Guardar el libro de Excel en un archivo en el servidor
        FileOutputStream archivo = new FileOutputStream(new File("registro.xlsx"));
        libro.write(archivo);
        archivo.close();
        System.out.println("El archivo se ha creado correctamente en el servidor.");

        
        // Redirigir al usuario a una página de confirmación
        response.sendRedirect("confirmacion.jsp");
    }
}
