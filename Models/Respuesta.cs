namespace TP07.Models;
public class Respuesta
{
    public  int IdRespuesta {get;set;}
    public int IdPregunta {get;set;}
    public int Opcion {get;set;}
    public string Contenido {get;set;}
    public  bool Correcta {get;set;}
    public string Foto {get;set;}

    public Respuesta (int Id_Respuesta, int Id_Pregunta, int _Opcion, string _Contenido, bool _Correcta, string _Foto ) { 
        IdPregunta = Id_Pregunta;
        IdRespuesta = Id_Respuesta;
        Opcion = _Opcion;
        Correcta = _Correcta;
        Foto = _Foto; 
     }

    public Respuesta () {  }

    

}