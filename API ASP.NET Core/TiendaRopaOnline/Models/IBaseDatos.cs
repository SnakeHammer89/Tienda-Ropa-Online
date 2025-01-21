using MySqlConnector;
namespace TiendaRopaOnline.Models
{
    public interface IBaseDatos
    {
        MySqlConnection Conexion();
    }
}
