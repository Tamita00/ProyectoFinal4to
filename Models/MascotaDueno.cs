public class MascotaDueno{
    public int IdMascota {get;set;}
    public string TipoMascota {get;set;}
    public string Genero {get;set;}
    public string Nombre {get;set;}
    public string Raza {get;set;}
    public DateTime FechaNacimeinto {get;set;}
    public string Foto {get;set;}
    
    public int IdDueno {get;set;}
    public int DNI {get;set;}
    public string NombreD {get;set;}
    public string Email {get;set;}
    public string Contraseña {get;set;}

public MascotaDueno(){}

public MascotaDueno(int pIdMascota,  string pTipoMascota, string pGenero, string pNombre, string pRaza, DateTime pFechaNacimeinto, string pFoto, int pIdDueno, int pDNI, string pNombreD, string pEmail, string pContraseña){
    IdMascota=pIdMascota;
    TipoMascota=pTipoMascota;
    Genero=pGenero;
    Nombre=pNombre;
    Raza=pRaza;
    FechaNacimeinto=pFechaNacimeinto;
    Foto=pFoto;

    IdDueno=pIdDueno;
    DNI=pDNI;
    NombreD =pNombreD;
    Email=pEmail;
    Contraseña=pContraseña;
}
}