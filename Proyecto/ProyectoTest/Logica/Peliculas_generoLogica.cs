using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class Peliculas_generoLogica
    {
        private static Peliculas_generoLogica _instancia = null;

        public Peliculas_generoLogica()
        {

        }

        public static Peliculas_generoLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new Peliculas_generoLogica();
                }

                return _instancia;
            }
        }

        public List<Peliculas_genero> Listar()
        {

            List<Peliculas_genero> rptListaPeliculas_genero = new List<Peliculas_genero>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_num_peliculas_por_genero", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaPeliculas_genero.Add(new Peliculas_genero()
                        {

                            Genero = dr["Genero"].ToString(),
                            CantidadPeliculas = dr["CantidadPeliculas"].ToString()

                        });
                    }
                    dr.Close();

                    return rptListaPeliculas_genero;

                }
                catch (Exception ex)
                {
                    rptListaPeliculas_genero = null;
                    return rptListaPeliculas_genero;
                }
            }
        }



    }
}