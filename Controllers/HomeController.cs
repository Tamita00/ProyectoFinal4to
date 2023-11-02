using Microsoft.AspNetCore.Mvc;

namespace ProyectoFinal4to.Controllers;

public class HomeController : Controller
{

    public IActionResult Index()
    {
        return View();
    }

    /*REGISTRARSE*/

    public IActionResult C_Registrarse()
    {
        return View("Registrarse");
    }

    public IActionResult C_RegistrarseMascota()
    {
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
