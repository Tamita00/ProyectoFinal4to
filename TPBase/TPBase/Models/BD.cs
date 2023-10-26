using System.Data.SqlClient;
using Dapper;
namespace TPBase;

public class BD{
    private static string ConnectionString = @"Server=localhost;DataBase=MiMascota;Trusted_Connection=True;";

    //.....Agregar

    public static void AgregarDueno(string Contraseña, int DNI, string Nombre, string Email){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "INSERT INTO Dueno(Contraseña, DNI, Nombre, Email) VALUES (@pContraseña, @pDNI, @pNombre, @pNombre, @pEmail)";
            db.Execute(sql, new { pContraseña = Contraseña, pDNI = DNI, pNombre = Nombre, pEmail = Email});

        }   
    }

    public static void AgregarMascota(int IdDueno, string TipoMascota, string Genero, string Nombre, string Raza, DateTime FechaNacimiento, string Foto ){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "INSERT INTO Mascota(IdDueno, TipoMascota, Genero, Nombre, Raza, FechaNacimiento, Foto) VALUES (@pIdDueno, @pTipoMascota, @pGenero, @pNombre, @pRaza, @pFechaNacimiento, @pFoto)";
            db.Execute(sql, new {pIdDueno = IdDueno, pTipoMascota = TipoMascota, pGenero = Genero, pNombre = Nombre, pRaza = Raza, pFechaNacimiento = FechaNacimiento, pFoto = Foto});

        }   
    }

    public static void AgregarAntecedentes(int IdMascota,string Lugar, DateTime Fecha){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "INSERT INTO Antecedentes(IdMascota, Lugar, Fecha) VALUES (@pIdMascota, @pLugar, @pFecha)";
            db.Execute(sql, new {pIdMascota = IdMascota, pLugar = Lugar, pFecha = Fecha});

        }   
    }

    public static void AgregarVacunas(string Tipo, DateTime FechDosis, DateTime FechaCaducidad){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "INSERT INTO Vacunas(Tipo, FechaDosis, FechaCaducidad) VALUES (@pTipo, @pFechaDosis, @pFechaCaducidad)";
            db.Execute(sql, new {pIdMascota = IdMascota, pLugar = Lugar, pFecha = Fecha});

        }   
    }
    public static void AgregarVacunas(int IdMascota, DateTime Fecha, string Lugar, string Info){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "INSERT INTO Vacunas(IdMascota, Fecha, Lugar, Info) VALUES (@pIdMascota, @pFecha, @pLugar, @pInfo)";
            db.Execute(sql, new {pIdMascota = IdMascota, pFecha = Fecha, pLugar = Lugar, pInfo = Info});

        }   
    }

//.......Mostrar

    public static List<Mascota> MostrarMascotas(int IdDueno){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT Nombre, Foto FROM Mascota WHERE IdDueno = @pIdDueno";
            usuario = db.QueryFirstOrDefault<Usuario>(sql, new { pIdDueno = IdDueno});
        }
        return usuario;
    }

//.....Cambiar
    public static void CambiarContra(string UserName, string Contraseña){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "UPDATE Usuario SET Contraseña = @pcontraseña WHERE UserName = @pUserName";
            db.Execute(sql, new { pUserName = UserName, pcontraseña = Contraseña});
        }    
    }


}