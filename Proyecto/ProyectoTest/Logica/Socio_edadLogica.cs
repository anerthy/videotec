using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class Socio_edadLogica
    {
        private static Socio_edadLogica _instancia = null;

        public Socio_edadLogica()
        {

        }

        public static Socio_edadLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new Socio_edadLogica();
                }

                return _instancia;
            }
        }

        public List<Socio_edad> Listar()
        {

            List<Socio_edad> rptListaSocio_edad = new List<Socio_edad>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_socios_por_edad", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaSocio_edad.Add(new Socio_edad()
                        {

                            Edad = dr["Edad"].ToString(),
                            Cantidad_de_socios = dr["CantidadSocios"].ToString()

                        });
                    }
                    dr.Close();

                    return rptListaSocio_edad;

                }
                catch (Exception ex)
                {
                    rptListaSocio_edad = null;
                    return rptListaSocio_edad;
                }
            }
        }



    }
}