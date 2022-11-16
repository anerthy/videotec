using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class SocioLogica
    {
        private static SocioLogica _instancia = null;

        public SocioLogica()
        {

        }

        public static SocioLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new SocioLogica();
                }

                return _instancia;
            }
        }

        public List<Socio> Listar()
        {

            List<Socio> rptListaSocio = new List<Socio>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_select_all_tbl_socio", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaSocio.Add(new Socio()
                        {
                            soc_codigo_socio = dr["soc_codigo_socio"].ToString(),
                            soc_cedula = dr["soc_cedula"].ToString(),
                            soc_nombre = dr["soc_nombre"].ToString(),
                            soc_apellido1 = dr["soc_apellido1"].ToString(),
                            soc_apellido2 = dr["soc_apellido2"].ToString(),
                            soc_correo = dr["soc_correo"].ToString(),
                            soc_telefono = dr["soc_telefono"].ToString(),
                            soc_codigo_postal = dr["soc_codigo_postal"].ToString(),
                            soc_direccion_exacta = dr["soc_direccion_exacta"].ToString(),
                            soc_genero = dr["soc_genero"].ToString(),
                            soc_fecha_nacimiento =dr["soc_fecha_nacimiento"].ToString(),
                            soc_foto_perfil = dr["soc_foto_perfil"].ToString()
                           
                        });
                    }
                    dr.Close();

                    return rptListaSocio;

                }
                catch (Exception ex)
                {
                    rptListaSocio = null;
                    return rptListaSocio;
                }
            }
        }


        public bool Registrar(Socio oSocio)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_insert_tbl_socio_tbl_usuario", oConexion);
                    cmd.Parameters.AddWithValue("soc_cedula", oSocio.soc_cedula);
                    cmd.Parameters.AddWithValue("soc_nombre", oSocio.soc_nombre);
                    cmd.Parameters.AddWithValue("soc_apellido1", oSocio.soc_apellido1);
                    cmd.Parameters.AddWithValue("soc_apellido2", oSocio.soc_apellido2);
                    cmd.Parameters.AddWithValue("soc_correo", oSocio.soc_correo);
                    cmd.Parameters.AddWithValue("soc_telefono", oSocio.soc_telefono);
                    cmd.Parameters.AddWithValue("soc_codigo_postal", oSocio.soc_codigo_postal);
                    cmd.Parameters.AddWithValue("soc_direccion_exacta", oSocio.soc_direccion_exacta);
                    cmd.Parameters.AddWithValue("soc_genero", oSocio.soc_genero);
                    cmd.Parameters.AddWithValue("soc_fecha_nacimiento", oSocio.soc_fecha_nacimiento);
                    cmd.Parameters.AddWithValue("soc_foto_perfil", oSocio.soc_foto_perfil);
                    cmd.Parameters.AddWithValue("user_contraseña", oSocio.user_contraseña);

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

           

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool Modificar(Socio oSocio)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_update_tbl_socio", oConexion);
                    cmd.Parameters.AddWithValue("soc_codigo_socio", oSocio.soc_codigo_socio);
                    cmd.Parameters.AddWithValue("soc_cedula", oSocio.soc_cedula);
                    cmd.Parameters.AddWithValue("soc_nombre", oSocio.soc_nombre);
                    cmd.Parameters.AddWithValue("soc_apellido1", oSocio.soc_apellido1);
                    cmd.Parameters.AddWithValue("soc_apellido2", oSocio.soc_apellido2);
                    cmd.Parameters.AddWithValue("soc_correo", oSocio.soc_correo);
                    cmd.Parameters.AddWithValue("soc_telefono", oSocio.soc_telefono);
                    cmd.Parameters.AddWithValue("soc_codigo_postal", oSocio.soc_codigo_postal);
                    cmd.Parameters.AddWithValue("soc_direccion_exacta", oSocio.soc_direccion_exacta);
                    cmd.Parameters.AddWithValue("soc_genero", oSocio.soc_genero);
                    cmd.Parameters.AddWithValue("soc_fecha_nacimiento", oSocio.soc_fecha_nacimiento);
                    cmd.Parameters.AddWithValue("soc_foto_perfil", oSocio.soc_foto_perfil);  
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();



                }
                catch (Exception ex)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public bool Eliminar(string id)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("delete from tbl_socio where @soc_codigo_socio = @id", oConexion);
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