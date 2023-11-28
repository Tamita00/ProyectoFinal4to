public class Vacuna{
    public int IdVacuna {get;set;}
    public string Tipo {get;set;}
    public DateTime fecha1 {get;set;}
    public DateTime fecha10 {get;set;}
public Vacuna(){}

public Vacuna(int pIdVacuna, string pTipo, DateTime pFechaDosis, DateTime pFechaCaducidad){
    IdVacuna=pIdVacuna;
    Tipo=pTipo;
    fecha1=pFechaDosis;;
    fecha10=pFechaCaducidad;
}
}