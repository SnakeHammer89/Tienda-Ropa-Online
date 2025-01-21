namespace TiendaRopaOnline.Models
{
    public class Carrito
    {
        public int iD_Carrito { get; set; }
        public int iD_Cliente { get; set; }
        public int iD_Articulo { get; set; }
        public int cantidad_Articulo { get; set; }
        public float precio_Articulo { get; set; }
    }
}
