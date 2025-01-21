namespace TiendaRopaOnline.Models
{
    public class Cliente
    {
        public int ID_Cliente { get; set; }
        public string?  email { get; set; }
        public string? Contrasenia { get; set; }
        public string? Nombre { get; set; }
        public string? Apellidos { get; set; }
        public string? Telefono { get; set; }
        public string? Direccion_Envio { get; set; }
    }
}
