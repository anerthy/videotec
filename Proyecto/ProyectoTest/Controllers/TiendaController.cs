using ProyectoTest.Logica;
using ProyectoTest.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ProyectoTest.Controllers
{
    public class TiendaController : Controller
    {
        private static Usuario oUsuario;
        //VISTA
        public ActionResult Index()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");
            else
                oUsuario = (Usuario)Session["Usuario"];

            return View();
        }

        //VISTA
       


        //VISTA
        public ActionResult Pelicula(string idpelicula = "")
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");
            else
                oUsuario = (Usuario)Session["Usuario"];

            Pelicula oPelicula = new Pelicula();
            List<Pelicula> oLista = new List<Pelicula>();

            oLista = PeliculaLogica.Instancia.Listar();
            oPelicula = (from o in oLista
                         where o.pel_id_pelicula == idpelicula
                         select new Pelicula()
                         {

                             pel_id_pelicula = o.pel_id_pelicula,
                             pel_titulo = o.pel_titulo,
                             pel_sinopsis = o.pel_sinopsis,
                             pel_clasificacion = o.pel_clasificacion,
                             pel_duracion = o.pel_duracion,
                             pel_año_publicacion = o.pel_año_publicacion,
                             pel_stock_cintas = o.pel_stock_cintas,
                             pel_pais = o.pel_pais,
                             pel_precio = o.pel_precio,
                             pel_disponibilidad = o.pel_disponibilidad,
                             pel_portada = o.pel_portada,
                             pel_trailer = o.pel_trailer
                         }).FirstOrDefault();

            return View(oPelicula);
        }





        //VISTA
        public ActionResult Carrito()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");
            else
                oUsuario = (Usuario)Session["Usuario"];

            return View();
        }

        //VISTA
        public ActionResult Compras()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");
            else
                oUsuario = (Usuario)Session["Usuario"];

            return View();
        }






  


        //ListarPeliculas


        [HttpPost]
        public JsonResult ListarPelicula(string clasfsimbolo = "")
        {
            List<Pelicula> oLista = new List<Pelicula>();

            oLista = PeliculaLogica.Instancia.Listar();
            oLista = (from o in oLista
                      select new Pelicula()
                      {


                          pel_id_pelicula = o.pel_id_pelicula,
                          pel_titulo = o.pel_titulo,
                          pel_sinopsis = o.pel_sinopsis,
                          pel_clasificacion = o.pel_clasificacion,
                          pel_duracion = o.pel_duracion,
                          pel_año_publicacion = o.pel_año_publicacion,
                          pel_stock_cintas = o.pel_stock_cintas,
                          pel_pais = o.pel_pais,
                          pel_precio = o.pel_precio,
                          pel_disponibilidad = o.pel_disponibilidad,
                          pel_portada = o.pel_portada,
                          pel_trailer = o.pel_trailer
                         
                      }).ToList();

            if (clasfsimbolo != "")
            {
                oLista = oLista.Where(x => x.pel_clasificacion.clasf_simbolo == clasfsimbolo).ToList();
            }

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }



       

        public ActionResult CerrarSesion() {
            FormsAuthentication.SignOut();
            Session["Usuario"] = null;
            return RedirectToAction("Index", "Login");
        }

        [HttpPost]
        public JsonResult ObtenerDepartamento()
        {
            List<Departamento> oLista = new List<Departamento>();
            oLista = UbigeoLogica.Instancia.ObtenerDepartamento();
            return Json(new { lista = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ObtenerProvincia(string _IdDepartamento)
        {
            List<Provincia> oLista = new List<Provincia>();
            oLista = UbigeoLogica.Instancia.ObtenerProvincia(_IdDepartamento);
            return Json(new { lista = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ObtenerDistrito(string _IdProvincia,string _IdDepartamento)
        {
            List<Distrito> oLista = new List<Distrito>();
            oLista = UbigeoLogica.Instancia.ObtenerDistrito(_IdProvincia,_IdDepartamento);
            return Json(new { lista = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RegistrarCompra(Compra oCompra)
        {
            bool respuesta = false;

            oCompra.IdUsuario = oUsuario.IdUsuario;
            respuesta = CompraLogica.Instancia.Registrar(oCompra);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        //

    }
}