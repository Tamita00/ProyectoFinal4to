public class Nota{
    public int IdMascota {get;set;}
    public int IdNota {get;set;}
    public string Lugar {get;set;}
    public string Info {get;set;}
    public DateTime Fecha {get;set;}
public Nota(){}

public Nota(int pIdMascota, int pIdNota, string pLugar, string pInfo, DateTime pFecha){
    IdMascota=pIdMascota;
    IdNota=pIdNota;
    Lugar=pLugar;
    Info=pInfo;
    Fecha=pFecha;
}
}