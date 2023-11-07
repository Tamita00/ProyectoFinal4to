using System.Data.SqlClient;
using Dapper;
namespace TPBase;

public class BD{
    private static string ConnectionString = @"Server=localhost;DataBase=MiMascota;Trusted_Connection=True;";

    //.....Agregar

    public static void AgregarDueno(string Contraseña, int DNI, string Nombre, string Email){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearDueno pContraseña, pDNI, pNombre, pEmail";
            db.Execute(sql, new { pContraseña = Contraseña, pDNI = DNI, pNombre = Nombre, pEmail = Email});

        }   
    }

    public static void AgregarMascota(int IdDueno, string TipoMascota, string Genero, string Nombre, string Raza, DateTime FechaNacimiento, string Foto ){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearMascota pIdDueno, pTipoMascota, pGenero, pNombre, pRaza, pFechaNacimiento, pFoto";
            db.Execute(sql, new {pIdDueno = IdDueno, pTipoMascota = TipoMascota, pGenero = Genero, pNombre = Nombre, pRaza = Raza, pFechaNacimiento = FechaNacimiento, pFoto = Foto});

        }   
    }

    public static void AgregarAntecedentes(int IdMascota,string Lugar, DateTime Fecha, string Info){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearAntecedente pIdMascota, pLugar, pFecha, pInfo";
            db.Execute(sql, new {pIdMascota = IdMascota, pLugar = Lugar, pFecha = Fecha, pInfo = Info});

        }   
    }

    public static void AgregarVacunas(string Tipo, DateTime FechDosis, DateTime FechaCaducidad){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearVacuna pTipo, pFechaDosis, pFechaCaducidad";
            db.Execute(sql, new {pTipo = Tipo, pFechaCaducidad = FechaCaducidad, pFechDosis = FechDosis});

        }   
    }

    public static void AgregarNota(string Lugar, DateTime Fecha, string Info){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearNota pLugar, pInfo, pFecha";
            db.Execute(sql, new {pLugar = Lugar, pInfo = Info, pFecha = Fecha});

        }   
    }

//.......Mostrar

    public static List<Mascota> MostrarMascotas(int IdDueno){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarMascotas pIdDueno";
            return db.Query<Mascota>(sql, new { pIdDueno = IdDueno}).ToList();
        }
    }

    public static int MostrarIDDueno(){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarIdDueno";
            return db.QueryFirstOrDifult<int>(sql);
        }
    }

    public static List<MascotaDueno> MostrarDatosPersonales(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarDatosPersonales pIdMascota";
            return db.Query<MascotaDueno>(sql, new { pIdMascota = IdMascota}).ToList();
        }
    }

    public static List<Antecedente> MostrarAntecedentes(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarAntecedentes pIdMascota";
            return db.Query<Antecedente>(sql, new { pIdMascota = IdMascota}).ToList();
        }
    }

    public static List<Vacuna> MostrarVacunas(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarVacunas pIdMascota";
            return db.Query<Vacuna>(sql, new { pIdMascota = IdMascota}).ToList();
        }
    }

    public static List<Vacuna> MostrarVacunaEspecifica(int IdMascota, int IdVacuna){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarVacunaEspecifica pIdMascota pIdVacuna";
            return db.Query<Vacuna>(sql, new { pIdMascota = IdMascota, pIdVacuna = IdVacuna}).ToList();
        }
    }

//.....Cambiar
    public static void CambiarContra(string Email, string Contraseña){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CambiarContrasena pEmail pContraseña";
            db.Execute(sql, new { pEmail = Email, pContraseña = Contraseña});
        }    
    }


}