
namespace TP07.Models;
public class Pregunta
{
    public  int IdPregunta {get;set;}
    public  int IdCategoria {get;set;}
    public  int IdDificultad {get;set;}
    public  string Enunciado {get;set;}
    public  string Foto {get;set;}

    public Pregunta (int Id_Pregunta, int Id_Categoria, int Id_Dificultad, string _Enunciado, string _Foto ) { 
        IdPregunta = Id_Pregunta;
        IdCategoria = Id_Categoria;
        IdDificultad = Id_Dificultad;
        Enunciado = _Enunciado;
        Foto = _Foto; 
     }

    public Pregunta () {  }

}