public class Dificultad
{
    private  int IdDificultad {get;set; }
    private  string Nombre {get;set; }


    public Dificultad (int idDificultad, string nombre) 
    {
        IdDificultad = idDificultad;
        Nombre = nombre;
    }

    public Dificultad () {  }
}