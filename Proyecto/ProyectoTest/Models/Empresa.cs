using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoTest.Models
{
    public class Empresa
    {
        public int emp_id_empresa { get; set; }
        public string emp_nombre { get; set; }
        public string emp_telefono { get; set; }

        public string emp_direccion { get; set; }
        public string emp_correo { get; set; }
        public string emp_logo { get; set; }

    }
}