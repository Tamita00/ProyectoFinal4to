public class Antecedente{
    public int IdMascota {get;set;}
    public int IdAntecedente {get;set;}
    public string Lugar {get;set;}
    public DateTime Fecha {get;set;}
    public string Info {get;set;}

public Antecedente(){}

public Antecedente(int pIdMascota, int pIdAntecedente, string pLugar, string pInfo, DateTime pFecha){
    IdMascota=pIdMascota;
    IdAntecedente=pIdAntecedente;
    Lugar=pLugar;
    Info=pInfo;;
    Fecha=pFecha;
}
}