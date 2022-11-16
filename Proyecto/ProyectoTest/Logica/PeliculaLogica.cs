using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class PeliculaLogica
    {
        private static PeliculaLogica _instancia = null;

        public PeliculaLogica()
        {

        }

        public static PeliculaLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new PeliculaLogica();
                }

                return _instancia;
            }
        }

        public List<Pelicula> Listar()
        {

            List<Pelicula> rptListaPelicula = new List<Pelicula>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenerPelicula", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaPelicula.Add(new Pelicula()
                        {

                            pel_id_pelicula = dr["pel_id_pelicula"].ToString(),
                            pel_titulo = dr["pel_titulo"].ToString(),
                            pel_sinopsis = dr["pel_sinopsis"].ToString(),
                            pel_clasificacion = new Clasificacion() { clasf_simbolo = (dr["pel_clasificacion"].ToString()), clasf_nombre = dr["clasf_nombre"].ToString() },
                            pel_duracion = dr["pel_duracion"].ToString(),
                            pel_año_publicacion = Convert.ToInt32(dr["pel_año_publicacion"].ToString()),
                            pel_stock_cintas = Convert.ToInt32(dr["pel_stock_cintas"].ToString()),
                            pel_pais = dr["pel_pais"].ToString(),
                            pel_precio = Convert.ToDecimal(dr["pel_precio"].ToString(), new CultureInfo("es-PE")),
                            pel_disponibilidad = dr["pel_disponibilidad"].ToString(),
                            pel_portada = dr["pel_portada"].ToString(),
                            pel_trailer = dr["pel_trailer"].ToString()

                                            
                        });
                    }
                    dr.Close();

                    return rptListaPelicula;

                }
                catch (Exception ex)
                {
                    rptListaPelicula = null;
                    return rptListaPelicula;
                }
            }
        }



        public string Registrar(Pelicula oPelicula)
        {
            string respuesta = "";
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_registrarPelicula", oConexion);
                    cmd.Parameters.AddWithValue("pel_titulo", oPelicula.pel_titulo);
                    cmd.Parameters.AddWithValue("pel_sinopsis", oPelicula.pel_sinopsis);
                    cmd.Parameters.AddWithValue("clasf_simbolo", oPelicula.pel_clasificacion.clasf_simbolo);
                    cmd.Parameters.AddWithValue("pel_duracion", oPelicula.pel_duracion);
                    cmd.Parameters.AddWithValue("pel_año_publicacion", oPelicula.pel_año_publicacion);
                    //cmd.Parameters.AddWithValue("pel_stock_cintas", oPelicula.pel_stock_cintas);
                    cmd.Parameters.AddWithValue("pel_pais", oPelicula.pel_pais);
                    cmd.Parameters.AddWithValue("pel_precio", oPelicula.pel_precio);
                    //cmd.Parameters.AddWithValue("pel_disponibilidad", oPelicula.pel_disponibilidad);
                    cmd.Parameters.AddWithValue("pel_portada", oPelicula.pel_portada);
                    cmd.Parameters.AddWithValue("pel_trailer", oPelicula.pel_trailer);
                    //cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = ((string)cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = "";
                }
            }
            return respuesta;
        }

        public bool Modificar(Pelicula oPelicula)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_update_tbl_pelicula", oConexion);
                    cmd.Parameters.AddWithValue("pel_titulo", oPelicula.pel_titulo);
                    cmd.Parameters.AddWithValue("pel_sinopsis", oPelicula.pel_sinopsis);
                    cmd.Parameters.AddWithValue("clasf_simbolo", oPelicula.pel_clasificacion.clasf_simbolo);
                    cmd.Parameters.AddWithValue("pel_duracion", oPelicula.pel_duracion);
                    cmd.Parameters.AddWithValue("pel_año_publicacion", oPelicula.pel_año_publicacion);
                    cmd.Parameters.AddWithValue("pel_stock_cintas", oPelicula.pel_stock_cintas);
                    cmd.Parameters.AddWithValue("pel_pais", oPelicula.pel_pais);
                    cmd.Parameters.AddWithValue("pel_precio", oPelicula.pel_precio);
                    cmd.Parameters.AddWithValue("pel_disponibilidad", oPelicula.pel_disponibilidad);
                    cmd.Parameters.AddWithValue("pel_portada", oPelicula.pel_portada);
                    cmd.Parameters.AddWithValue("pel_trailer", oPelicula.pel_trailer);
                    //cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    //respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }
        

        //public bool ActualizarRutaImagen(Pelicula oPelicula)
        //{
        //    bool respuesta = true;
        //    using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
        //    {
        //        try
        //        {
        //            SqlCommand cmd = new SqlCommand("sp_actualizarRutaImagen", oConexion);



        //            cmd.Parameters.AddWithValue("IdProducto", oProducto.IdProducto);
        //            cmd.Parameters.AddWithValue("RutaImagen", oProducto.RutaImagen);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            oConexion.Open();
        //            cmd.ExecuteNonQuery();
        //        }
        //        catch (Exception ex)
        //        {
        //            respuesta = false;
        //        }
        //    }
        //    return respuesta;
        //}

        public bool Eliminar(int id)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("delete from tbl_pelicula where pel_id_pelicula = @id", oConexion);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.CommandType = CommandType.Text;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = true;

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

    }
}