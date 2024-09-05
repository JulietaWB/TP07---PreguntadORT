public static class Juego
{
    //Propiedades
    private static string Username {get;set; }
    private static int PuntajeActual {get;set; }
    private static int ContadorPreguntaActual {get;set; }
    private static Pregunta PreguntaActual {get;set; }
    private static int CantidadPreguntasCorrectas {get;set; }
    private static List<Pregunta> ListaPreguntas {get;set; }
    private static List<Respuesta> ListaRespuestas {get;set; }


    // Métodos
    private static void InicializarJuego()
    {
        Username="";
        PuntajeActual=0;
        ContadorPreguntaActual=1;
        CantidadPreguntasCorrectas=0;
    }

    public static List<Categoria>  ObtenerCategorias()
    {
        List <Categoria> lista = new List <Categoria>();
        lista=BD.ObtenerCategorias();

        return lista;
    }

    public static List<Dificultad>  ObtenerDificultades()
    {
        List <Dificultad> lista = new List <Dificultad>();
        lista=BD.ObtenerDificultades();

        return lista;
    }

    public static List<Pregunta> CargarPartida(string username, int dificultad, int categoria)
    {
        List <Pregunta> lista = new List <Pregunta>();
        lista=BD.ObtenerPreguntas(dificultad, categoria);
        Juego.InicializarJuego();

        return lista;
    }

    public static Pregunta ObtenerProximaPregunta()
    {
        Pregunta preg = new Pregunta();
        preg=ListaPreguntas[ContadorPreguntaActual];

        return preg;
    }

    public static bool VerificarRespuesta(int idRespuesta)
    {
        List <Respuesta> lista = new List <Respuesta>();
        lista=BD.ObtenerRespuestas(ContadorPreguntaActual);
        bool acertado=false;

        if (lista[idRespuesta].Correcta == true)
        {
            PuntajeActual+=10;
            CantidadPreguntasCorrectas++;
            acertado=true;
        }

        ContadorPreguntaActual++;
        PreguntaActual=ListaPreguntas[ContadorPreguntaActual];
        return acertado;
    }

}