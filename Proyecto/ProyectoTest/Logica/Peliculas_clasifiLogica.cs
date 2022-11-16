using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class Peliculas_clasifiLogica
    {
        private static Peliculas_clasifiLogica _instancia = null;

        public Peliculas_clasifiLogica()
        {

        }

        public static Peliculas_clasifiLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new Peliculas_clasifiLogica();
                }

                return _instancia;
            }
        }

        public List<Peliculas_clasifi> Listar()
        {

            List<Peliculas_clasifi> rptListaPeliculas_clasifi = new List<Peliculas_clasifi>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_num_peliculas_clasificacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaPeliculas_clasifi.Add(new Peliculas_clasifi()
                        {

                            Clasificacion = dr["Clasificacion"].ToString(),
                            CantidadPeliculas = dr["CantidadPeliculas"].ToString()

                        });
                    }
                    dr.Close();

                    return rptListaPeliculas_clasifi;

                }
                catch (Exception ex)
                {
                    rptListaPeliculas_clasifi = null;
                    return rptListaPeliculas_clasifi;
                }
            }
        }



    }
}