using ProyectoTest.Models;
using ProyectoTest.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using System.IO;

namespace ProyectoTest.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Categoria()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Marca()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Producto()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Socio_genero()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Bitacora()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Socio_edad()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Ganancias_mes()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Peliculas_clasifi()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }
        public ActionResult Peliculas_genero()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }


        public ActionResult Pelicula()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }
        public ActionResult Clasificacion()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }

        public ActionResult Empresa()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }
        public ActionResult Socio()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }



        public ActionResult Tienda()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            return View();
        }


        


        //Empresa
        [HttpGet]
        public JsonResult ListarEmpresa()
        {
            List<Empresa> oLista = new List<Empresa>();
            oLista = EmpresaLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult GuardarEmpresa(Empresa objeto)
        {
            bool respuesta = false;
            respuesta = (objeto.emp_id_empresa == 0) ? EmpresaLogica.Instancia.Registrar(objeto) : EmpresaLogica.Instancia.Modificar(objeto);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult EliminarEmpresa(int id)
        {
            bool respuesta = false;
            respuesta = EmpresaLogica.Instancia.Eliminar(id);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        //PELICULA


        [HttpGet]
        public JsonResult ListarPelicula()
        {
            List<Pelicula> oLista = new List<Pelicula>();
            oLista = PeliculaLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }


        //[HttpGet]
        //public JsonResult ListarPelicula()
        //{
        //    List<Pelicula> oLista = new List<Pelicula>();

        //    oLista = PeliculaLogica.Instancia.Listar();
        //    oLista = (from o in oLista
        //              select new Pelicula()
        //              {

        //                  pel_id_pelicula = o.pel_id_pelicula,
        //                  pel_titulo = o.pel_titulo,
        //                  pel_sinopsis = o.pel_sinopsis,
        //                  pel_clasificacion = o.pel_clasificacion,
        //                  pel_duracion = o.pel_duracion,
        //                  pel_año_publicacion = o.pel_año_publicacion,
        //                  pel_stock_cintas = o.pel_stock_cintas,
        //                  pel_pais = o.pel_pais,
        //                  pel_precio = o.pel_precio,
        //                  pel_disponibilidad = o.pel_disponibilidad,
        //                  pel_portada = o.pel_portada,
        //                  pel_trailer = o.pel_trailer



        //              }).ToList();



        //    return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        //}

        //   [HttpPost]
        //public JsonResult GuardarPelicula(Pelicula objeto)
        //{
        //    bool respuesta = false;
        //    respuesta = (objeto.pel_id_pelicula == 0) ? PeliculaLogica.Instancia.Registrar(objeto) : PeliculaLogica.Instancia.Modificar(objeto);
        //    return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        //}


        [HttpPost]
        public JsonResult GuardarPelicula(string objeto, HttpPostedFileBase imagenArchivo)
        {

            Response oresponse = new Response() { resultado = true, mensaje = "" };

            try
            {
                Pelicula oPelicula = new Pelicula();
                oPelicula = JsonConvert.DeserializeObject<Pelicula>(objeto);

                //string GuardarEnRuta = "~/Imagenes/Productos/";
                //string physicalPath = Server.MapPath("~/Imagenes/Productos");

                //if (!Directory.Exists(physicalPath))
                //    Directory.CreateDirectory(physicalPath);

                if (oPelicula.pel_id_pelicula == "")
                {
                    string id = PeliculaLogica.Instancia.Registrar(oPelicula);
                    oPelicula.pel_id_pelicula = id;
                    oresponse.resultado = oPelicula.pel_id_pelicula == "" ? false : true;

                }
                else
                {
                    oresponse.resultado = PeliculaLogica.Instancia.Modificar(oPelicula);
                }


                //if (imagenArchivo != null && oProducto.IdProducto != 0)
                //{
                //    string extension = Path.GetExtension(imagenArchivo.FileName);
                //    GuardarEnRuta = GuardarEnRuta + oProducto.IdProducto.ToString() + extension;
                //    oProducto.RutaImagen = GuardarEnRuta;

                //    imagenArchivo.SaveAs(physicalPath + "/" + oProducto.IdProducto.ToString() + extension);

                //    oresponse.resultado = ProductoLogica.Instancia.ActualizarRutaImagen(oProducto);
                //}

            }
            catch (Exception e)
            {
                oresponse.resultado = false;
                oresponse.mensaje = e.Message;
            }

            return Json(oresponse, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarPelicula(int id)
        {
            bool respuesta = false;
            respuesta = PeliculaLogica.Instancia.Eliminar(id);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }





        [HttpGet]
        public JsonResult ListarClasificacion()
        {
            List<Clasificacion> oLista = new List<Clasificacion>();
            oLista = ClasificacionLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }
        //[HttpPost]
        //public JsonResult GuardarClasificacion(Clasificacion objeto)
        //{
        //    bool respuesta = false;
        //    respuesta = (objeto.clasf_simbolo == "") ? ClasificacionLogica.Instancia.Registrar(objeto) : ClasificacionLogica.Instancia.Modificar(objeto);
        //    return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        //}
        [HttpPost]
        public JsonResult EliminarClasificacion(int id)
        {
            bool respuesta = false;
            respuesta = ClasificacionLogica.Instancia.Eliminar(id);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }


        //SOCIO_GENERO
        [HttpGet]
        public JsonResult ListarSocio_genero()
        {
            List<Socio_genero> oLista = new List<Socio_genero>();
            oLista = Socio_generoLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }
        //BITACORA
        [HttpGet]
        public JsonResult ListarBitacora()
        {
            List<Bitacora> oLista = new List<Bitacora>();
            oLista = BitacoraLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }

        //SOCIO_EDAD
        [HttpGet]
        public JsonResult ListarSocio_edad()
        {
            List<Socio_edad> oLista = new List<Socio_edad>();
            oLista = Socio_edadLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }


        //GANANCIA_MES
        public JsonResult ListarGanancias_mes()
        {
            List<Ganancias_mes> oLista = new List<Ganancias_mes>();
            oLista = Ganancias_mesLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }


        //ListarPeliculas_clasificacion
        [HttpGet]
        public JsonResult ListarPeliculas_clasifi()
        {
            List<Peliculas_clasifi> oLista = new List<Peliculas_clasifi>();
            oLista = Peliculas_clasifiLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public JsonResult ListarPeliculas_genero()
        {
            List<Peliculas_genero> oLista = new List<Peliculas_genero>();
            oLista = Peliculas_generoLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }


        //Socio
        [HttpGet]
        public JsonResult ListarSocio()
        {
            List<Socio> oLista = new List<Socio>();
            oLista = SocioLogica.Instancia.Listar();
            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult GuardarSocio(Socio objeto)
        {
            bool respuesta = false;
            respuesta = (objeto.soc_codigo_socio == "") ? SocioLogica.Instancia.Registrar(objeto) : SocioLogica.Instancia.Modificar(objeto);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult EliminarSocio(string id)
        {
            bool respuesta = false;
            respuesta = SocioLogica.Instancia.Eliminar(id);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }




    }

    public class Response {

        public bool resultado { get; set; }
        public string mensaje { get; set; }
    }
}