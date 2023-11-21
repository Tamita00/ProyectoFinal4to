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

    public static void AgregarAntecedentes(int IdMascota,string Lugar, DateTime Fecha, string Tipo){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearAntecedente";
            db.Execute(sql, new {pIdMascota = IdMascota, pLugar = Lugar, pFecha = Fecha, pTipo = Tipo}, commandType: CommandType.StoredProcedure);

        }   
    }

    public static void AgregarVacunas(int IdMascota, string Tipo, DateTime FechDosis1, DateTime FechaCaducidad1){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_CrearVacuna";
            db.Execute(sql, new {pTipo = Tipo, pFechaDosis1 = FechaDosis1, pFechaCaducidad1 = FechaCaducidad1}, commandType: CommandType.StoredProcedure);

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

    public static Mascota MostrarMascota(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarMascota";
            return db.QueryFirstOrDefault<Mascota>(sql, new { pIdMascota = IdMascota}, commandType: CommandType.StoredProcedure);
        }
    }

    public static Dueno MostrarDueno(string email, string contrasena){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarDueno";
            return db.QueryFirstOrDefault<Dueno>(sql, new { pEmail = email, pContrasena = contrasena}, commandType: CommandType.StoredProcedure);
        }
    }

    public static int MostrarIdDueno(){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarIdDueno";
            return db.QueryFirstOrDefault<int>(sql);
        }
    }

    public static int MostrarIdMascota(){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarIdMascota";
            return db.QueryFirstOrDefault<int>(sql);
        }
    }

    public static MascotaDueno MostrarDatosPersonales(int IdMascota){
        
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_MostrarDatosPersonales";
            return db.QueryFirstOrDefault<MascotaDueno>(sql, new { pIdMascota = IdMascota}, commandType: CommandType.StoredProcedure);
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


//....Eliminar

        public static void EliminarAntecedente(int IdAntecedente){
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "sp_EliminarAntecedente";
            db.Execute(sql, new {pIdAntecedente = IdAntecedente}, commandType: CommandType.StoredProcedure);
        }
    }

}