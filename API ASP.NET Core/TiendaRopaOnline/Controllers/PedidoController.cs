using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using TiendaRopaOnline.Models;

namespace TiendaRopaOnline.Controllers
{
    [Route("Api/Pedidos")]
    [ApiController]
    public class PedidoController : ControllerBase
    {
        private readonly IBaseDatos _BaseDatos;

        public PedidoController(IBaseDatos baseDatos)
        {
            _BaseDatos = baseDatos;
        }

        [HttpGet]
        [Route("MostrarPedidos")]
        public async Task<IActionResult> MostrarPedidos(string email)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sql = @"SELECT pedido.ID_Cliente, pedido.ID_Pedido, cliente.Nombre, pedido.Fecha
                        FROM pedido
                        INNER JOIN cliente ON pedido.ID_Cliente = cliente.ID_Cliente
                        WHERE cliente.Email = @Email";
                    


                    await conexion.OpenAsync();

                    Console.WriteLine($"Datos recibidos: {email}");

                    var resultados = await conexion.QueryAsync<dynamic>(sql, new { email = email });

                    conexion.Close();

                    return Ok(resultados);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpGet]
        [Route("MostrarDetallesPedido")]
        public async Task<IActionResult> MostrarDetallesPedido(string email)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    
                    var sql = @"SELECT detalles_pedido.ID_Detalle, pedido.ID_Cliente, pedido.ID_Pedido, cliente.Nombre, pedido.Fecha, detalles_pedido.ID_Articulo, detalles_pedido.Cantidad, detalles_pedido.Precio_Unitario
                        FROM((pedido
                        INNER JOIN cliente ON pedido.ID_Cliente = cliente.ID_Cliente)
                        INNER JOIN detalles_pedido ON pedido.ID_Pedido = detalles_pedido.ID_Pedido)
                        WHERE cliente.Email = @Email";

                        
                    


                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Pedido>(sql, new { email = email});

                    conexion.Close();

                    return Ok(resultados);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }
    }
}

//