using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using ProyectoFinal4to.Models;
namespace ProyectoFinal4to.Controllers;

public class HomeController : Controller
{
    private IWebHostEnvironment Enviroment;

    public HomeController(IWebHostEnvironment enviroment){
        Enviroment = enviroment;
    }
    public IActionResult Index()
    {
        return View();
    }

    /*REGISTRARSE*/

    public IActionResult C_Registrarse()
    {
        return View("Registrarse");
    }

    public IActionResult C_AgregarDueno(string nombre, int dni, string email, string contrasena)
    {
        BD.AgregarDueno(contrasena, dni, nombre, email);
        ViewBag.IdDueno = BD.MostrarIDDueno();
        return View("RegistrarseMascota");
    }

    public IActionResult C_AgregarMascota(int IdDueno, string Tipo, string Genero, string nombre, string raza, DateTime fechaNacimiento, IFormFile foto)
    {

        if(foto.Length > 0){
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"\wwwroot\" + foto.FileName;
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                foto.CopyToAsync(stream);
            }
        }

        BD.AgregarMascota(IdDueno, Tipo, Genero, nombre, raza, fechaNacimiento, foto.FileName);

        return View();
    }

    public IActionResult C_CrearAntecedente()
    {
        return View("CrearAntecedente");
    }

    public IActionResult C_CrearVacuna()
    {
        return View("CrearVacuna");
    }
    
    public IActionResult C_CrearNota()
    {
        return View("CrearNota");
    }

    /*INICIAR SESION*/
    
    public IActionResult C_IniciarSesion()
    {
        return View("IniciarSesion");
    }
    
    public IActionResult C_OlvideContrasena()
    {
        return View("OlvideContrasena");
    }
    
    public IActionResult C_ElegirMascota()
    {
        return View("ElegirMascota");
    }
    
    public IActionResult C_Home()
    {
        return View("Home");
    }
}
