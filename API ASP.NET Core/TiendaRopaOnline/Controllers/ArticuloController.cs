using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MySqlConnector;
using System.Data;
using System.Drawing;
using System.Globalization;
using TiendaRopaOnline.Models;

namespace TiendaRopaOnline.Controllers
{
    [Route("Api/Articulos")]
    [ApiController]
    public class ArticuloController : ControllerBase
    {
        private readonly IBaseDatos _BaseDatos;

        public ArticuloController(IBaseDatos baseDatos)
        {
            _BaseDatos = baseDatos;
        }

        [HttpGet]
        [Route("MostrarArticulos")]
        public async Task<IActionResult> MostrarArticulos()
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sql = @"SELECT
                                    articulo.ID_Articulo,
                                    categoria.Categoria,
                                    color.Color,
                                    talla.Talla,
                                    modelo.Modelo,
                                    articulo.Precio,
                                    articulo.Stock,
                                    articulo.Url_Imagen
                                FROM articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN color ON articulo.ID_Color = color.ID_Color
                                INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                                INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo";


                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Articulo>(sql);

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
        [Route("MostrarArticulosPorID")]
        public async Task<IActionResult> MostrarArticulosPorID(int idArticulo)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {
                    var sql = @"SELECT
                                    articulo.ID_Articulo,
                                    categoria.Categoria,
                                    color.Color,
                                    talla.Talla,
                                    modelo.Modelo,
                                    articulo.Precio,
                                    articulo.Stock,
                                    articulo.Url_Imagen
                                FROM articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN color ON articulo.ID_Color = color.ID_Color
                                INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                                INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo
                                WHERE ID_Articulo = @ID_Articulo";


                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Articulo>(sql, new {ID_Articulo = idArticulo});

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
        [Route("BuscarArticulo")]
        public async Task<IActionResult> BuscarArticulo(string? categoria, string? color, string? talla, string? modelo)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    // var sql = @"SELECT  articulo.ID_Articulo,
                    //                 categoria.Categoria,
                    //                 color.Color,
                    //                 talla.Talla,
                    //                 modelo.Modelo,
                    //                 articulo.Precio,
                    //                 articulo.Stock,
                    //                 articulo.Url_Imagen
                    //             FROM articulo
                    //             INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                    //             INNER JOIN color ON articulo.ID_Color = color.ID_Color
                    //             INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                    //             INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo
                    //             WHERE Categoria = @Categoria AND Color = @Color AND Talla = @Talla AND Modelo = @Modelo";

                    var sql = @"SELECT  articulo.ID_Articulo,
                                    categoria.Categoria,
                                    color.Color,
                                    talla.Talla,
                                    modelo.Modelo,
                                    articulo.Precio,
                                    articulo.Stock,
                                    articulo.Url_Imagen
                                FROM articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN color ON articulo.ID_Color = color.ID_Color
                                INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                                INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo";


                    var setClauses = new List<string>();

                    // Add only the columns that are going to be updated
                    if (!string.IsNullOrEmpty(categoria)) setClauses.Add("Categoria = @Categoria");
                    if (!string.IsNullOrEmpty(color)) setClauses.Add("Color = @Color");
                    if (!string.IsNullOrEmpty(modelo)) setClauses.Add("Modelo = @Modelo");
                    if (!string.IsNullOrEmpty(talla)) setClauses.Add("Talla = @Talla");



                    if (setClauses.Count > 0)
                    {
                        sql += " WHERE " + string.Join(" AND ", setClauses);
                    }
                    else
                    {
                        // If there are no fields to update, you can handle it as a special case or throw an exception.
                        return BadRequest("No hay campos para actualizar.");
                    }

                    

                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Articulo>(sql, new
                    {
                        Categoria = categoria,
                        Color = color,
                        Talla = talla,
                        Modelo = modelo
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

        [HttpGet]
        [Route("BuscarArticulosPorCategoria")]
        public async Task<IActionResult> BuscarArticulosPorCategoria(string categoria)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = @"SELECT  articulo.ID_Articulo,
                                    categoria.Categoria,
                                    color.Color,
                                    talla.Talla,
                                    modelo.Modelo,
                                    articulo.Precio,
                                    articulo.Stock,
                                    articulo.Url_Imagen
                                FROM articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN color ON articulo.ID_Color = color.ID_Color
                                INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                                INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo
                                WHERE Categoria = @Categoria";


                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Articulo>(sql, new { Categoria = categoria });

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
        [Route("BuscarArticulosPorColor")]
        public async Task<IActionResult> BuscarArticulosPorColor(string color)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = @"SELECT  articulo.ID_Articulo,
                                    categoria.Categoria,
                                    color.Color,
                                    talla.Talla,
                                    modelo.Modelo,
                                    articulo.Precio,
                                    articulo.Stock,
                                    articulo.Url_Imagen
                                FROM articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN color ON articulo.ID_Color = color.ID_Color
                                INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                                INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo
                                WHERE Color = @Color";


                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Articulo>(sql, new { Color = color });

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
        [Route("BuscarArticulosPorTalla")]
        public async Task<IActionResult> BuscarArticulosPorTalla(string talla)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = @"SELECT  articulo.ID_Articulo,
                                    categoria.Categoria,
                                    color.Color,
                                    talla.Talla,
                                    modelo.Modelo,
                                    articulo.Precio,
                                    articulo.Stock,
                                    articulo.Url_Imagen
                                FROM articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN color ON articulo.ID_Color = color.ID_Color
                                INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                                INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo
                                WHERE Talla = @Talla";


                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Articulo>(sql, new { Talla = talla });

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
        [Route("BuscarArticulosPorModelo")]
        public async Task<IActionResult> BuscarArticulosPorModelo(string modelo)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = @"SELECT  articulo.ID_Articulo,
                                    categoria.Categoria,
                                    color.Color,
                                    talla.Talla,
                                    modelo.Modelo,
                                    articulo.Precio,
                                    articulo.Stock,
                                    articulo.Url_Imagen
                                FROM articulo
                                INNER JOIN categoria ON articulo.ID_Categoria = categoria.ID_Categoria
                                INNER JOIN color ON articulo.ID_Color = color.ID_Color
                                INNER JOIN talla ON articulo.ID_Talla = talla.ID_Talla
                                INNER JOIN modelo ON articulo.ID_Modelo = modelo.ID_Modelo
                                WHERE Modelo= @Modelo";


                    await conexion.OpenAsync();

                    var resultados = await conexion.QueryAsync<Articulo>(sql, new { Modelo = modelo });

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
        [Route("InsertarArticulo")]
        public async Task<IActionResult> InsertarArticulo(int categoria, int color, int talla, int modelo, float precio, int stock, string url)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = "INSERT INTO articulo (Categoria, Color, Talla, Modelo, Precio, Stock, Url_Imagen) VALUES (@Categoria, @Color, @Talla, @Modelo, @Precio, @Stock, @Url_Imagen)";


                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sql, new
                        {
                            Categoria = categoria,
                            Color = color,
                            Talla = talla,
                            Modelo = modelo,
                            Precio = precio,
                            Stock = stock,
                            Url_Imagen = url
                        }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok("Articulo insertado correctamente");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpPut]
        [Route("ModificarStock")]
        //public async Task<IActionResult> ModificarArticulo(int id, string categoria, string color, string talla, string modelo, float precio, int stock)
        public async Task<IActionResult> ModificarStock(int id, int stock)

        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = "UPDATE articulo SET Stock = @Stock WHERE ID_Articulo = @ID_Articulo";


                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sql, new { ID_Articulo = id, Stock = stock }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok("Stock modificado correctamente");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }

        [HttpDelete]
        [Route("EliminarArticulo")]
        public async Task<IActionResult> EliminarArticulo(int id)
        {
            try
            {
                using (MySqlConnection conexion = _BaseDatos.Conexion())
                {

                    var sql = "DELETE FROM articulo WHERE ID_Articulo = @ID_Articulo";


                    await conexion.OpenAsync();

                    using (var transaccion = await conexion.BeginTransactionAsync())
                    {
                        await conexion.ExecuteAsync(sql, new { ID_Articulo = id }, transaccion);

                        await transaccion.CommitAsync();
                    }

                    conexion.Close();

                    return Ok("Articulo eliminado correctamente");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno en el servidor: {ex.Message}");
            }
        }
    }
}
