using System.Data.SqlClient;
using System.Data;
using Dapper;
namespace ProyectoFinal4to;

public static class BD{
    private static string ConnectionString = @"Server=localhost;DataBase=MiMascota;Trusted_Connection=True;";

    //.....Agregar

    public static void AgregarDueno(string Contraseña, int DNI, string Nombre, string Email){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearDueno";
            db.Execute(sql, new { pContraseña = Contraseña, pDNI = DNI, pNombre = Nombre, pEmail = Email}, commandType: CommandType.StoredProcedure);

        }   
    }

    public static void AgregarMascota(int IdDueno, string TipoMascota, string Genero, string Nombre, string Raza, DateTime FechaNacimiento, string Foto ){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearMascota";
            db.Execute(sql, new {pIdDueno = IdDueno, pTipoMascota = TipoMascota, pGenero = Genero, pNombre = Nombre, pRaza = Raza, pFechaNacimiento = FechaNacimiento, pFoto = Foto}, commandType: CommandType.StoredProcedure);

        }   
    }

    public static void AgregarAntecedentes(int IdMascota,string Lugar, DateTime Fecha, string Info){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearAntecedente";
            db.Execute(sql, new {pIdMascota = IdMascota, pLugar = Lugar, pFecha = Fecha, pInfo = Info}, commandType: CommandType.StoredProcedure);

        }   
    }

    public static void AgregarVacunas(string Tipo, DateTime FechDosis, DateTime FechaCaducidad){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearVacuna";
            db.Execute(sql, new {pTipo = Tipo, pFechaCaducidad = FechaCaducidad, pFechDosis = FechDosis}, commandType: CommandType.StoredProcedure);

        }   
    }

    public static void AgregarNota(string Lugar, DateTime Fecha, string Info){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearNota";
            db.Execute(sql, new {pLugar = Lugar, pInfo = Info, pFecha = Fecha}, commandType: CommandType.StoredProcedure);

        }   
    }

//.......Mostrar

    public static List<Mascota> MostrarMascotas(int IdDueno){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarMascotas";
            return db.Query<Mascota>(sql, new { pIdDueno = IdDueno}, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Dueno> MostrarDueno(string email, string contrasena){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarDueno";
            return db.Query<Dueno>(sql, new { pEmail = email, pContrasena = contrasena}, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static int MostrarIDDueno(){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarIdDueno";
            return db.QueryFirstOrDefault<int>(sql);
        }
    }

    public static List<MascotaDueno> MostrarDatosPersonales(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarDatosPersonales";
            return db.Query<MascotaDueno>(sql, new { pIdMascota = IdMascota}, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Antecedente> MostrarAntecedentes(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarAntecedentes";
            return db.Query<Antecedente>(sql, new { pIdMascota = IdMascota}, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Vacuna> MostrarVacunas(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarVacunas";
            return db.Query<Vacuna>(sql, new { pIdMascota = IdMascota}, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Vacuna> MostrarVacunaEspecifica(int IdMascota, int IdVacuna){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarVacunaEspecifica";
            return db.Query<Vacuna>(sql, new { pIdMascota = IdMascota, pIdVacuna = IdVacuna}, commandType: CommandType.StoredProcedure).ToList();
        }
    }

//.....Cambiar
    public static void CambiarContra(string Email, string Contraseña){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CambiarContrasena";
            db.Execute(sql, new { pEmail = Email, pContraseña = Contraseña}, commandType: CommandType.StoredProcedure);
        }    
    }


}