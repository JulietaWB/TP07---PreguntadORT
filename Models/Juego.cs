namespace TP07.Models;
public static class Juego
{
    //Propiedades
    public string Username {get;set; }
    public int PuntajeActual {get;set; }
    private static int ContadorPreguntaActual {get;set; }
    private static Pregunta PreguntaActual {get;set; }
    private static int CantidadPreguntasCorrectas {get;set; }
    private static List<Pregunta> ListaPreguntas {get;set; }
    private static List<Respuesta> ListaRespuestas {get;set; }


    // Métodos
    public static void InicializarJuego()
    {
        Username="";
        PuntajeActual=0;
        ContadorPreguntaActual=0;
        CantidadPreguntasCorrectas=0;
    }

    public static List<Categoria>  ObtenerCategorias()
    {

        return BD.ObtenerCategorias();
    }

    public static List<Dificultad>  ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        ListaPreguntas=BD.ObtenerPreguntas(dificultad, categoria);
        Username=username;
        Juego.InicializarJuego();
    }

    public static Pregunta ObtenerProximaPregunta()
    {
        Pregunta preg = new Pregunta();
        preg=ListaPreguntas[ContadorPreguntaActual];

        return preg;
    }

    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        ListaRespuestas = BD.ObtenerRespuestas(idPregunta);
        return ListaRespuestas;
    }
    public static bool VerificarRespuesta(int idRespuesta)
    {
        bool acertado=false;

        foreach(Respuesta item in ListaRespuestas)
        {
            if (item.IdRespuesta == idRespuesta)
            {
                acertado = item.Correcta;
            }
        }

        return acertado;
    }

}