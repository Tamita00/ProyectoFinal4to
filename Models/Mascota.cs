public class Mascota{
    public int IdMascota {get;set;}
    public int IdDueno {get;set;}
    public string TipoMascota {get;set;}
    public string Genero {get;set;}
    public string Nombre {get;set;}
    public string Raza {get;set;}
    public DateTime FechaNacimeinto {get;set;}
    public string Foto {get;set;}

public Mascota(){}

public Mascota(int pIdMascota, int pIdDueno, string pTipoMascota, string pGenero, string pNombre, string pRaza, DateTime pFechaNacimeinto, string pFoto){
    IdMascota=pIdMascota;
    IdDueno=pIdDueno;
    TipoMascota=pTipoMascota;
    Genero=pGenero;
    Nombre=pNombre;
    Raza=pRaza;
    FechaNacimeinto=pFechaNacimeinto;
    Foto=pFoto;
}
}