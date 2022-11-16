using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class Ganancias_mesLogica
    {
        private static Ganancias_mesLogica _instancia = null;

        public Ganancias_mesLogica()
        {

        }

        public static Ganancias_mesLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new Ganancias_mesLogica();
                }

                return _instancia;
            }
        }

        public List<Ganancias_mes> Listar()
        {

            List<Ganancias_mes> rptListaGanancias_mes = new List<Ganancias_mes>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_ganancias_por_mes", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaGanancias_mes.Add(new Ganancias_mes()
                        {
                            Ganancias = dr["Ganancias"].ToString(),
                            Mes = dr["Mes"].ToString()

                        });
                    }
                    dr.Close();

                    return rptListaGanancias_mes;

                }
                catch (Exception ex)
                {
                    rptListaGanancias_mes = null;
                    return rptListaGanancias_mes;
                }
            }
        }



    }
}