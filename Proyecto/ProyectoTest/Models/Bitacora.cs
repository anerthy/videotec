using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoTest.Models
{
    public class Bitacora
    {
        public int BitacoraID { get; set; }
        public string Usuario { get; set; }
        public string Tabla { get; set; }
        public string RegistroID { get; set; }
        public string Accion { get; set; }
        public string FechaAccion { get; set; }
    }
}