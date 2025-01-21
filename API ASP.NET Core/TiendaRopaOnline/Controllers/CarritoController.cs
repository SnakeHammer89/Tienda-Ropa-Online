using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MySqlConnector;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Text.Json;
using TiendaRopaOnline.Models;

namespace TiendaRopaOnline.Controllers
{
    [Route("Api/Carrito")]
    [ApiController]
    public class CarritoController : ControllerBase
    {
        private readonly IBaseDatos _BaseDatos;

        public CarritoController(IBaseDatos baseDatos)
        {
            _BaseDatos = baseDatos;
        }

        [HttpGet]
        [Route("VerCarrito")]
        public async Task<IActionResult> VerCarrito([FromQuery] int id_Cliente)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sql = @"SELECT
                                    carrito.iD_Carrito,
                                    carrito.iD_Cliente,
                                    carrito.iD_Articulo,
                                    carrito.cantidad_Articulo,
                                    carrito.precio_Articulo,
                                    categoria.Categoria,
                                    modelo.Modelo,
                                    articulo.Url_Imagen
                                FROM carrito
                                INNER JOIN articulo ON carrito.ID_Articulo = articulo.ID_Articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN modelo ON articulo.ID_Modelo= modelo.ID_Modelo
                                WHERE iD_Cliente = @iD_Cliente";

                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<dynamic>(sql, new { iD_Cliente = id_Cliente });

                    conexion.Close();

                    return Ok(resultados);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpPost]
        [Route("InsertarAlCarrito")]
        public async Task<IActionResult> InsertarAlCarrito([FromBody] Carrito carrito)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sql = @"INSERT INTO carrito (ID_Cliente, ID_Articulo, Cantidad_Articulo, Precio_Articulo)
                        SELECT @ID_Cliente AS ID_Cliente, @ID_Articulo AS ID_Articulo, @Cantidad_Articulo AS Cantidad_Articulo, articulo.Precio AS Precio_Articulo
                        FROM articulo
                        WHERE articulo.ID_Articulo = @ID_Articulo";

                    await conexion.OpenAsync();

                    Console.WriteLine($"Datos recibidos: {JsonSerializer.Serialize(carrito)}");

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sql, new
                        {
                            ID_Cliente = carrito.iD_Cliente,
                            ID_Articulo = carrito.iD_Articulo,
                            Cantidad_Articulo = carrito.cantidad_Articulo
                        }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok(new { mensaje = "Articulo insertado correctamente al carrito", carrito });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex}");
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }
        [HttpPut]
        [Route("ModificarCantidadArticulo")]
        public async Task<IActionResult> ModificarCantidadArticulo(int idCliente, int idArticulo, int cantidad)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sql = @"UPDATE carrito SET cantidad_Articulo = @cantidad_Articulo WHERE iD_Cliente = @iD_Cliente AND iD_Articulo = @iD_Articulo";

                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sql, new { iD_Cliente = idCliente,iD_Articulo = idArticulo, cantidad_Articulo = cantidad }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok(new { mensaje = "Se ha modificado la cantidad correctamente" });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpDelete]
        [Route("EliminarDelCarrito")]
        public async Task<IActionResult> EliminarDelCarrito(int idArticulo)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sqlVaciar = @"DELETE FROM carrito WHERE iD_Articulo = @iD_Articulo";

                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sqlVaciar, new { iD_Articulo = idArticulo }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok(new { mensaje = "Articulo eliminado del carrito correctamente" });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpDelete]
        [Route("FinalizarCarrito")]
        public async Task<IActionResult> FinalizarCarrito([FromQuery] int iD_Cliente)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sqlPedido = @"INSERT INTO pedido (ID_Cliente, Fecha)
                        SELECT iD_Cliente, CURRENT_DATE AS Fecha
                        FROM carrito WHERE iD_Cliente = @iD_Cliente
                        LIMIT 1";


                    var sqlDetalles = @"INSERT INTO detalles_pedido (ID_Pedido, ID_Articulo, Cantidad, Precio_Unitario)
                        SELECT @ID_Pedido, iD_Articulo, cantidad_Articulo, precio_Articulo
                        FROM carrito WHERE iD_Cliente = @iD_Cliente";

                    var sqlVaciar = @"DELETE FROM carrito WHERE iD_Cliente = @iD_Cliente";

                    await conexion.OpenAsync();

                    Console.WriteLine($"Datos recibidos: {JsonSerializer.Serialize(iD_Cliente)}");

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sqlPedido, new { iD_Cliente = iD_Cliente }, transaction: transaccion);

                        var idPedido = await conexion.ExecuteScalarAsync<int>("SELECT LAST_INSERT_ID()", transaction: transaccion);

                        await conexion.ExecuteAsync(sqlDetalles, new { ID_Pedido = idPedido, iD_Cliente = iD_Cliente }, transaction: transaccion);

                        await conexion.ExecuteAsync(sqlVaciar, new { iD_Cliente = iD_Cliente }, transaction: transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok(new { mensaje = "Se ha finalizado el carrito correctamente" });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }
        //[HttpDelete]
        //[Route("VaciarCarrito")]
        //public async Task<IActionResult> VaciarCarrito()
        //{
        //    try
        //    {
        //        using (MySqlConnection conexion = _BaseDatos.Conexion())
        //        {
        //            var sql = @"DELETE FROM carrito;";

        //            await conexion.OpenAsync();

        //            using (var transaccion = await conexion.BeginTransactionAsync())
        //            {
        //                await conexion.ExecuteAsync(sql, transaccion);

        //                await transaccion.CommitAsync();
        //            }

        //            conexion.Close();

        //            return Ok("Se ha vaciado el carrito correctamente");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
        //    }
        //}
    }
}
