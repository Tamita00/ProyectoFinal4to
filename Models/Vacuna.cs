public class Vacuna{
    public int IdVacuna {get;set;}
    public string Tipo {get;set;}
    public DateTime FechaDosis {get;set;}
    public DateTime FechaCaducidad {get;set;}
public Vacuna(){}

public Vacuna(int pIdVacuna, string pTipo, DateTime pFechaDosis, DateTime pFechaCaducidad){
    IdVacuna=pIdVacuna;
    Tipo=pTipo;
    FechaDosis=pFechaDosis;;
    FechaCaducidad=pFechaCaducidad;
}
}