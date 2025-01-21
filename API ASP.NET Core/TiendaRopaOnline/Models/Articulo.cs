using System.Globalization;

namespace TiendaRopaOnline.Models
{
    public class Articulo
    {
        public int ID_Articulo { get; set; }
        public string? Categoria { get; set; }
        public string? Color { get; set; }
        public string? Talla { get; set; }
        public string? Modelo { get; set; }
        public float Precio { get; set; }
        public int Stock { get; set; }
        public string Url_Imagen { get; set; }
    }
}
