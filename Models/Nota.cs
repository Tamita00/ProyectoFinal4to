public class Nota{
    public int IdMascota {get;set;}
    public int IdNota {get;set;}
    public string Lugar {get;set;}
    public string Info {get;set;}
    public DateTime FechaDosis {get;set;}
public Nota(){}

public Nota(int pIdMascota, int pIdNota, string pLugar, string pInfo, DateTime pFechaDosis){
    IdMascota=pIdMascota;
    IdNota=pIdNota;
    Lugar=pLugar;
    Info=pInfo;
    FechaDosis=pFechaDosis;
}
}