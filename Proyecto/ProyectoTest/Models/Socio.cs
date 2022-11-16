using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoTest.Models
{
    public class Socio
    {
        public string soc_codigo_socio { get; set; }
        public string soc_cedula { get; set; }
        public string soc_nombre { get; set; }
        public string soc_apellido1 { get; set; }
        public string soc_apellido2 { get; set; }
        public string soc_correo { get; set; }
        public string soc_telefono { get; set; }
        public string soc_codigo_postal { get; set; }
        public string soc_direccion_exacta { get; set; }
        public string soc_genero { get; set; }
        public string soc_fecha_nacimiento { get; set; }
        public string soc_foto_perfil { get; set; }
        public string user_contraseña { get; set; }
    }
}