public class Pregunta
{
    private static int IdPregunta {get;set;}
    private static int IdCategoria {get;set;}
    private static int IdDificultad {get;set;}
    private static string Enunciado {get;set;}
    private static string Foto {get;set;}

    public Pregunta (int Id_Pregunta, int Id_Categoria, int Id_Dificultad, string _Enunciado, string _Foto ) { 
        IdPregunta = Id_Pregunta;
        IdCategoria = Id_Categoria;
        IdDificultad = Id_Dificultad;
        Enunciado = _Enunciado;
        Foto = _Foto; 
     }

    public Pregunta () {  }

}