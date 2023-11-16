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
        ViewBag.IdDueno = BD.MostrarIdDueno();
        return View("RegistrarseMascota");
    }

    public IActionResult C_AgregarMascota(int IdDueno, string Tipo, string Genero, string nombre, string raza, DateTime fechaNacimiento, IFormFile foto)
    {

        if(foto.Length > 0){
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"\wwwroot\img\" + foto.FileName;
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                foto.CopyToAsync(stream);
            }
        }

        BD.AgregarMascota(IdDueno, Tipo, Genero, nombre, raza, fechaNacimiento, foto.FileName);
        
        ViewBag.DatosPersonales = BD.MostrarDatosPersonales(BD.MostrarIdMascota());
        ViewBag.IdMascota = BD.MostrarIdMascota();
        return View("CrearAntecedenteVacuna");
    }

[HttpPost]

    public IActionResult C_AgregarAntecedente(int IdMascota, string Lugar, DateTime Fecha, string Tipo)
    {
        BD.AgregarAntecedentes(IdMascota, Lugar, Fecha, Tipo);
        ViewBag.DatosPersonales = BD.MostrarDatosPersonales(BD.MostrarIdMascota());
        ViewBag.IdMascota = BD.MostrarIdMascota();
        return View("CrearAntecedenteVacuna");
    }

    public IActionResult C_CrearVacuna(int IdMascota, string Tipo, DateTime fecha1, DateTime fecha10, DateTime fecha2, DateTime fecha20, DateTime fecha3, DateTime fecha30)
    {
        BD.AgregarVacunas(IdMascota, Tipo, fecha1, fecha10, fecha2, fecha20, fecha3, fecha30);
        ViewBag.IdMascota = BD.MostrarIdMascota();
        return View("CrearAntecedenteVacuna");
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

    public IActionResult C_ValidarCuenta(string email, string contrasena)
    {
        if(BD.MostrarDueno(email, contrasena) == null) return View("IniciarSesion");
        else{
            Dueno Dueno = BD.MostrarDueno(email,contrasena);
            ViewBag.Mascotas = BD.MostrarMascotas(Dueno.IdDueno);
            return View("ElegirMascota");
        } 
    }
    
    public IActionResult C_OlvideContrasena()
    {
        return View("OlvideContrasena");
    }

    public IActionResult C_CambiarContrasena(string email, string contrasena)
    {
        BD.CambiarContra(email, contrasena);

        return View("IniciarSesion");
    }
    

/*INICIO*/


    public IActionResult C_Inicio(int IdMascota)
    {
        ViewBag.Mascota = BD.MostrarMascota(IdMascota);
        return View("Inicio");
    }

    public IActionResult C_Antecedente(int IdMascota)
    {
        ViewBag.Antecedentes = BD.MostrarAntecedentes(IdMascota);
        ViewBag.Mascota = BD.MostrarMascota(IdMascota);
        return View("Antecedente");
    }
    
    public IActionResult C_Vacunas(int IdMascota)
    {
        return View("Vacunas");
    }
    
    public IActionResult C_DatosPersonales(int IdMascota)
    {
        return View("DatosPersonales");
    }    
}