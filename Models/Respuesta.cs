public class Respuesta
{
    private static int IdRespuesta {get;set;}
    private static int IdPregunta {get;set;}
    private static int Opcion {get;set;}
    private static string Contenido {get;set;}
    private static bool Correcta {get;set;}
    private static string Foto {get;set;}

        public Respuesta (int Id_Respuesta, int Id_Pregunta, int _Opcion, string _Contenido, bool _Correcta, string _Foto ) { 
        IdPregunta = Id_Pregunta;
        IdRespuesta = Id_Respuesta;
        Opcion = _Opcion;
        Correcta = _Correcta;
        Foto = _Foto; 
     }

    public Respuesta () {  }

    

}