public class Dificultad
{
    private static int IdDificultad {get;set; }
    private static string Nombre {get;set; }


    public Dificultad (int idDificultad, string nombre) 
    {
        IdDificultad = idDificultad;
        Nombre = nombre;
    }

    public Dificultad () {  }
}