using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace ProyectoFinal4to.Controllers;

public class HomeController : Controller
{
    private IWebHostEnviroment Enviroment;

    public HomeController(IWebHostEnviroment enviroment){
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
        BD.AgregarDueno(contrasena, dni, nombre, email)
        return View("RegistrarseMascota");
    }

    public IActionResult C_AgregarMascota()
    {
        BD.AgregarMascota(string nombre, int dni, string email, IFormFile foto)

        if(foto.Length > 0){
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"\wwwroot\" + foto.FileName;
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                foto.CopyToAsync(stream);
            }
        }

        return View("RegistrarseMascota");
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
