using MySqlConnector;

namespace TiendaRopaOnline.Models
{
    public class BaseDatos : IBaseDatos
    {
        public MySqlConnection Conexion()
        {
            string bdNombre = "tienda_ropa_online";
            string servidor = "127.0.0.1";
            string puerto = "3306";
            string usuario = "marcos";
            string contraseña = "marcos";
            string stringCompleto = "Database=" + bdNombre + "; Data Source=" + servidor + "; Port=" + puerto + "; User Id=" + usuario + "; Password=" + contraseña + ";";

            try
            {
                MySqlConnection conexion = new MySqlConnection(stringCompleto);
                Console.WriteLine("La conexion se ha establecido con exito");
                return conexion;
            }
            catch (Exception ex)
            {
                Console.WriteLine("No se ha podido establecer la conexion a la base de datos: " + ex.Message);
                return null;
            }
        }
    }
}
