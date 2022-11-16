using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoTest.Models
{
    public class Pelicula
    {
        public int pel_id_pelicula { get; set; }
        public string pel_titulo { get; set; }
        public string pel_sinopsis { get; set; }
        public Clasificacion pel_clasificacion { get; set; }
        public string pel_duracion { get; set; }
        public int pel_año_publicacion { get; set; }
        public int pel_stock_cintas { get; set; }
        public string pel_pais { get; set; }
        public Decimal pel_precio { get; set; }
        public string pel_disponibilidad { get; set; }
        public string pel_portada { get; set; }
        public string pel_trailer { get; set; }

    }
}