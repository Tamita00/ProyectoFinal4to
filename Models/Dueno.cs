public class Dueno{
    public int IdDueno {get;set;}
    public int DNI {get;set;}
    public string Nombre {get;set;}
    public string Email {get;set;}
    public string Contraseña {get;set;}
public Dueno(){}

public Dueno(int pIdDueno, int pDNI, string pNombre, string pEmail, string pContraseña){
    IdDueno=pIdDueno;
    DNI=pDNI;
    Nombre=pNombre;
    Email=pEmail;
    Contraseña=pContraseña;
}
}