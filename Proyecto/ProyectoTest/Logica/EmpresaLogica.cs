using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoTest.Logica
{
    public class EmpresaLogica
    {
        private static EmpresaLogica _instancia = null;

        public EmpresaLogica()
        {

        }

        public static EmpresaLogica Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new EmpresaLogica();
                }

                return _instancia;
            }
        }

        public List<Empresa> Listar()
        {

            List<Empresa> rptListaEmpresa = new List<Empresa>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("sp_select_all_tbl_empresa", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaEmpresa.Add(new Empresa()
                        {

                            emp_id_empresa = Convert.ToInt32(dr["emp_id_empresa"].ToString()),
                            emp_nombre = dr["emp_nombre"].ToString(),
                            emp_telefono = dr["emp_telefono"].ToString(),
                            emp_direccion = dr["emp_direccion"].ToString(),
                            emp_correo = dr["emp_correo"].ToString(),
                            emp_logo = dr["emp_logo"].ToString(),
                        });
                    }
                    dr.Close();

                    return rptListaEmpresa;

                }
                catch (Exception ex)
                {
                    rptListaEmpresa = null;
                    return rptListaEmpresa;
                }
            }
        }


        public bool Registrar(Empresa oEmpresa)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_insert_tbl_empresa", oConexion);
                    cmd.Parameters.AddWithValue("emp_nombre", oEmpresa.emp_nombre);
                    cmd.Parameters.AddWithValue("emp_telefono", oEmpresa.emp_telefono);
                    cmd.Parameters.AddWithValue("emp_direccion", oEmpresa.emp_direccion);
                    cmd.Parameters.AddWithValue("emp_correo", oEmpresa.emp_correo);
                    cmd.Parameters.AddWithValue("emp_logo", oEmpresa.emp_logo);
 
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

        public bool Modificar(Empresa oEmpresa)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("sp_update_tbl_empresa", oConexion);
                    cmd.Parameters.AddWithValue("emp_id_empresa", oEmpresa.emp_id_empresa);
                    cmd.Parameters.AddWithValue("emp_nombre", oEmpresa.emp_nombre);
                    cmd.Parameters.AddWithValue("emp_telefono", oEmpresa.emp_telefono);
                    cmd.Parameters.AddWithValue("emp_direccion", oEmpresa.emp_direccion);
                    cmd.Parameters.AddWithValue("emp_correo", oEmpresa.emp_correo);
                    cmd.Parameters.AddWithValue("emp_logo", oEmpresa.emp_logo);
  
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

        public bool Eliminar(int id)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("delete from tbl_empresa where emp_id_empresa = @id", oConexion);
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