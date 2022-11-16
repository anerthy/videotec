using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class BitacoraLogica
    {
        private static BitacoraLogica _instancia = null;

        public BitacoraLogica()
        {

        }

        public static BitacoraLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new BitacoraLogica();
                }

                return _instancia;
            }
        }

        public List<Bitacora> Listar()
        {

            List<Bitacora> rptListaBitacora = new List<Bitacora>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_bitacora", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaBitacora.Add(new Bitacora()
                        {

                            BitacoraID = Convert.ToInt32(dr["BitacoraID"].ToString()),
                            Usuario = dr["Usuario"].ToString(),
                            Tabla = dr["Tabla"].ToString(),
                            RegistroID = dr["RegistroID"].ToString(),
                            Accion = dr["Accion"].ToString(),
                            FechaAccion = dr["FechaAccion"].ToString()

                        });
                    }
                    dr.Close();

                    return rptListaBitacora;

                }
                catch (Exception ex)
                {
                    rptListaBitacora = null;
                    return rptListaBitacora;
                }
            }
        }



    }
}