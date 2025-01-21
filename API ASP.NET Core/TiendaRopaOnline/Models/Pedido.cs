using MySqlConnector;

namespace TiendaRopaOnline.Models
{
    public class Pedido
    {
        public int ID_Pedido { get; set; }
        public int ID_Cliente { get; set; }
        public int ID_Detalle { get; set; }       
        public DateTime Fecha { get; set; }
        public int ID_Articulo { get; set; }
        public int Cantidad { get; set; }
        public float Precio_Unitario { get; set; }       
    }

}
