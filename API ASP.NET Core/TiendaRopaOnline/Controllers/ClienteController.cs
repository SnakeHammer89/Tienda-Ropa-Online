using Dapper;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using System;
using System.Data;
using System.Globalization;
using System.Reflection.Metadata;
using TiendaRopaOnline.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TiendaRopaOnline.Controllers
{

    [Route("Api/Clientes")]
    [ApiController]

    public class ClienteController : ControllerBase
    {

        private readonly IBaseDatos _BaseDatos;
        public ClienteController(IBaseDatos baseDatos)
        {

            _BaseDatos = baseDatos;
        }

        [HttpGet]
        [Route("MostrarClientes")]
        public async Task<IActionResult> MostrarClientes()
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = "SELECT * FROM cliente ORDER BY ID_Cliente ASC";

                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Cliente>(sql);

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
        [Route("InsertarCliente")]
        //public async Task<IActionResult> InsertarCliente(string email, string contrasenia, string nombre, string apellidos, string telefono, string direccionEnvio)
        public async Task<IActionResult> InsertarCliente([FromBody] Cliente cliente)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = "INSERT INTO cliente (Email, Contrasenia, Nombre, Apellidos, Telefono, Direccion_Envio) VALUES (@Email, @Contrasenia, @Nombre, @Apellidos, @Telefono, @Direccion_Envio)";


                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {


                        await conexion.ExecuteAsync(sql, cliente, transaccion);


                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok(new { mensaje = "Cliente insertado correctamente", cliente });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }


        [HttpGet]
        [Route("VerificarCliente")]
        public async Task<IActionResult> VerificarCliente(string email, string contrasenia)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sql = @"SELECT ID_Cliente, Email, Contrasenia, Nombre, Apellidos, Telefono, Direccion_Envio
                                FROM cliente
                                WHERE Email = @Email AND Contrasenia = @Contrasenia"; 

                    //var whereClauses = new List<string>();

                    //// Filtrar según los parámetros proporcionados
                    ////if (!string.IsNullOrEmpty(email)) whereClauses.Add("Email = @Email");
                    ////if (!string.IsNullOrEmpty(contrasenia)) whereClauses.Add("Email = @Email");
                    //if (!string.IsNullOrEmpty(nombre)) whereClauses.Add("Nombre LIKE CONCAT('%', @Nombre, '%')");
                    //if (!string.IsNullOrEmpty(apellidos)) whereClauses.Add("Apellidos LIKE CONCAT('%', @Apellidos, '%')");
                    //if (!string.IsNullOrEmpty(telefono)) whereClauses.Add("Telefono = @Telefono");
                    //if (!string.IsNullOrEmpty(direccionEnvio)) whereClauses.Add("Direccion_Envio LIKE CONCAT('%', @DireccionEnvio, '%')");

                    //if (whereClauses.Count > 0)
                    //{
                    //    sql += " WHERE Email = @Email AND Contrasenia = @Contrasenia " + string.Join(" AND ", whereClauses);
                    //}

                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Cliente>(sql, new
                    {
                        Email = email,
                        Contrasenia = contrasenia,
                        //Nombre = nombre,
                        //Apellidos = apellidos,
                        //Telefono = telefono,
                        //DireccionEnvio = direccionEnvio
                    });

                    conexion.Close();

                    return Ok(resultados);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpPut]
        [Route("ModificarCliente")]
        public async Task<IActionResult> ModificarCliente(int id, string? email, string? contraseña, string? nombre, string? apellidos, string? telefono, string? direccionEnvio)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = "UPDATE cliente SET ";

                    var setClauses = new List<string>();

                    // Add only the columns that are going to be updated
                    if (!string.IsNullOrEmpty(email)) setClauses.Add("Email = @Email");
                    if (!string.IsNullOrEmpty(contraseña)) setClauses.Add("Contraseña = @Contraseña");
                    if (!string.IsNullOrEmpty(nombre)) setClauses.Add("Nombre = @Nombre");
                    if (!string.IsNullOrEmpty(apellidos)) setClauses.Add("Apellidos = @Apellidos");
                    if (!string.IsNullOrEmpty(telefono)) setClauses.Add("Telefono = @Telefono");
                    if (!string.IsNullOrEmpty(direccionEnvio)) setClauses.Add("Direccion_Envio = @Direccion_Envio");

                    if (setClauses.Count > 0)
                    {
                        sql += string.Join(", ", setClauses);
                    }
                    else
                    {
                        // If there are no fields to update, you can handle it as a special case or throw an exception.
                        return BadRequest("No hay campos para actualizar.");
                    }

                    sql += " WHERE ID_Cliente = @ID_Cliente";
                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        // Execute the SQL query with the provided parameters
                        await conexion.ExecuteAsync(sql, new
                        {
                            Email = email,
                            Contraseña = contraseña,
                            Nombre = nombre,
                            Apellidos = apellidos,
                            Telefono = telefono,
                            Direccion_Envio = direccionEnvio,
                            ID_Cliente = id
                        }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok("Cliente modificado correctamente");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpDelete]
        [Route("EliminarCliente")]
        public async Task<IActionResult> EliminarCliente(int id)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sqlDetalles = @"DELETE detalles_pedido FROM detalles_pedido
                                        JOIN pedido ON detalles_pedido.ID_Pedido = pedido.ID_Pedido
                                        WHERE pedido.ID_Cliente = @ID_Cliente";

                    var sqlPedido = @"DELETE FROM pedido WHERE ID_Cliente = @ID_Cliente";

                    var sqlCliente = @"DELETE FROM cliente WHERE ID_Cliente = @ID_Cliente";


                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sqlDetalles, new { ID_Cliente = id }, transaccion);

                        await conexion.ExecuteAsync(sqlPedido, new { ID_Cliente = id }, transaccion);

                        await conexion.ExecuteAsync(sqlCliente, new { ID_Cliente = id }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok("Cliente eliminado correctamente");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

    }
}