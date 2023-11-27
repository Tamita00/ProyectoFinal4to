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

    public IActionResult C_AgregarMascotaView(int IdDueno)
    {
        ViewBag.IdDueno = IdDueno;
        return View("RegistrarseMascota");
    }

    public IActionResult C_AgregarMascota(int IdDueno, string Tipo, string Genero, string nombre, string raza, DateTime fechaNacimiento, IFormFile foto)
    {

        if(foto.Length > 0){
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"\wwwroot\img\mascotas\" + foto.FileName;
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                foto.CopyToAsync(stream);
            }
        }

        BD.AgregarMascota(IdDueno, Tipo, Genero, nombre, raza, fechaNacimiento, foto.FileName);
        int IdMascota = BD.MostrarIdMascota();
        ViewBag.DatosPersonales = BD.MostrarDatosPersonales(IdMascota);
        ViewBag.IdMascota = IdMascota;
        return View("CrearAntecedenteVacuna");
    }

[HttpPost]

    public IActionResult C_AgregarAntecedente(string pagina, int IdMascota, string Lugar, DateTime Fecha, string Info)
    {
        BD.AgregarAntecedentes(IdMascota, Lugar, Fecha, Info);
        ViewBag.DatosPersonales = BD.MostrarDatosPersonales(BD.MostrarIdMascota());
        Mascota Mascota = BD.MostrarMascota(IdMascota);
        ViewBag.Mascota = Mascota;
        ViewBag.Antecedentes = BD.MostrarAntecedentes(Mascota.IdMascota);
        return View(pagina);
    }


    public IActionResult C_CrearVacuna(string pagina, int IdMascota, string Tipo, DateTime fecha1, DateTime fecha10)
    {
        BD.AgregarVacunas(IdMascota, Tipo, fecha1, fecha10);
        ViewBag.IdMascota = BD.MostrarIdMascota();
        ViewBag.Vacunas = BD.MostrarVacunas(IdMascota);
        ViewBag.DatosPersonales = BD.MostrarDatosPersonales(BD.MostrarIdMascota());
        return View(pagina);
    }
    


    /*INICIAR SESION*/
    
    public IActionResult C_IniciarSesion()
    {

        return View("IniciarSesion");
    }

    public IActionResult C_ValidarCuenta(string email, string contrasena)
    {
        Dueno DuenoExiste= BD.MostrarDueno(email, contrasena);
        if(DuenoExiste == null) return View("IniciarSesion");
        else{
            ViewBag.Mascotas = BD.MostrarMascotas(DuenoExiste.IdDueno);
            ViewBag.IdDueno = DuenoExiste.IdDueno;
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
        ViewBag.Vacunas = BD.MostrarVacunas(IdMascota);
        return View("Vacunas");
    }
    
    public IActionResult C_DatosPersonales(int IdMascota)
    {
        ViewBag.Mascota = IdMascota;
        ViewBag.DatosPersonales = BD.MostrarDatosPersonales(IdMascota);
        return View("DatosPersonales");
    }    

    
    public IActionResult C_Agenda(int IdMascota)
    {
        ViewBag.IdMascota = IdMascota;
        ViewBag.Notas = BD.MostrarNotas(IdMascota);
        return View("Agenda");
    }    


/*ANTECEDENTE*/

    public IActionResult C_EliminarAntecedente(int IdAntecedente, int IdMascota)
    { 
        BD.EliminarAntecedente(IdAntecedente);
        ViewBag.Antecedentes = BD.MostrarAntecedentes(IdMascota);
        ViewBag.Mascota = BD.MostrarMascota(IdMascota);
        return View("Antecedente");
    }


/*AGENDA*/

public IActionResult C_EliminarNota(int IdNota, int IdMascota)
    { 
        BD.EliminarNota(IdNota);
        ViewBag.IdMascota = IdMascota;
        ViewBag.Notas = BD.MostrarNotas(IdMascota);
        return View("Agenda");
    }

    public IActionResult C_CrearNota(int IdMascota, string Lugar, DateTime Fecha, string Info)
    {   BD.AgregarNota(IdMascota, Lugar, Fecha, Info);
        ViewBag.IdMascota = IdMascota;
        ViewBag.Notas = BD.MostrarNotas(IdMascota);
        return View("Agenda");
    }

/*PERFIL*/
public IActionResult C_Perfil(int IdMascota)
    { 
        ViewBag.DatosPersonales = BD.MostrarDatosPersonales(IdMascota);
        return View("Perfil");
    }


}