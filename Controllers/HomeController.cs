using Microsoft.AspNetCore.Mvc;

namespace ProyectoFinal4to.Controllers;

public class HomeController : Controller
{

    public IActionResult C_Registrarse()
    {
        return View("Registrarse");
    }

    public IActionResult C_RegistrarseMascota()
    {
        return View("RegistrarseMascota");
    }

    public IActionResult Index()
    {
        return View();
    }
}
