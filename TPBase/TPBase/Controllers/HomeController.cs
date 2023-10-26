using Microsoft.AspNetCore.Mvc;

namespace ProyectoFinal4to.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
