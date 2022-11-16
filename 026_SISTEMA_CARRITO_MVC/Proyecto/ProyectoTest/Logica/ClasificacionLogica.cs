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
    public class ClasificacionLogica
    {
        private static ClasificacionLogica _instancia = null;

        public ClasificacionLogica()
        {

        }

        public static ClasificacionLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new ClasificacionLogica();
                }

                return _instancia;
            }
        }

        public List<Clasificacion> Listar()
        {

            List<Clasificacion> rptListaClasificacion = new List<Clasificacion>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_listar_clasificaciones", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaClasificacion.Add(new Clasificacion()
                        {

                            clasf_simbolo = dr["clasf_simbolo"].ToString(),
                            clasf_nombre = dr["clasf_nombre"].ToString(),
                            clasf_significado = dr["clasf_significado"].ToString(),


                        });
                    }
                    dr.Close();

                    return rptListaClasificacion;

                }
                catch (Exception ex)
                {
                    rptListaClasificacion = null;
                    return rptListaClasificacion;
                }
            }
        }



        public int Registrar(Clasificacion oClasificacion)
        {
            int respuesta = 0;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_insert_tbl_clasificacion", oConexion);
                    cmd.Parameters.AddWithValue("clasf_simbolo", oClasificacion.clasf_simbolo);
                    cmd.Parameters.AddWithValue("clasf_nombre", oClasificacion.clasf_nombre);
                    cmd.Parameters.AddWithValue("clasf_significado", oClasificacion.clasf_significado);
                    //cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToInt32(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = 0;
                }
            }
            return respuesta;
        }

        public bool Modificar(Clasificacion oClasificacion)
        {
            bool respuesta = false;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_update_tbl_clasificacion", oConexion);
                    cmd.Parameters.AddWithValue("clasf_simbolo", oClasificacion.clasf_simbolo);
                    cmd.Parameters.AddWithValue("clasf_nombre", oClasificacion.clasf_nombre);
                    cmd.Parameters.AddWithValue("clasf_significado", oClasificacion.clasf_significado);

                    //cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }


        //public bool ActualizarRutaImagen(Clasificacion oClasificacion)
        //{
        //    bool respuesta = true;
        //    using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
        //    {
        //        try
        //        {
        //            SqlCommand cmd = new SqlCommand("sp_actualizarLogo", oConexion);
        //            cmd.Parameters.AddWithValue("emp_id_Clasificacion", oClasificacion.emp_id_Clasificacion);
        //            cmd.Parameters.AddWithValue("emp_logo", oClasificacion.emp_logo);
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
                    SqlCommand cmd = new SqlCommand("delete from tbl_clasificacion where clasf_simbolo = @id", oConexion);
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