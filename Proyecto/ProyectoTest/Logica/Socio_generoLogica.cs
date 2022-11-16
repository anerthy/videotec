using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class Socio_generoLogica
    {
        private static Socio_generoLogica _instancia = null;

        public Socio_generoLogica()
        {

        }

        public static Socio_generoLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new Socio_generoLogica();
                }

                return _instancia;
            }
        }

        public List<Socio_genero> Listar()
        {

            List<Socio_genero> rptListaSocio_genero = new List<Socio_genero>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_socios_por_genero", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaSocio_genero.Add(new Socio_genero()
                        {

                            Genero = dr["Genero"].ToString(),
                            Cantidad_de_socios = dr["CantidadSocios"].ToString()

                        });
                    }
                    dr.Close();

                    return rptListaSocio_genero;

                }
                catch (Exception ex)
                {
                    rptListaSocio_genero = null;
                    return rptListaSocio_genero;
                }
            }
        }


  
    }
}