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
    private void InicializarJuego()
    {
        Username="";
        PuntajeActual=0;
        ContadorPreguntaActual=1;
        CantidadPreguntasCorrectas=0;
    }

    public List<Categoria>  ObtenerCategorias()
    {
        List <Categoria> lista = new List <Categoria>();
        lista=BD.ObtenerCategorias();

        return lista;
    }

    public List<Dificultad>  ObtenerDificultades()
    {
        List <Dificultad> lista = new List <Dificultad>();
        lista=BD.ObtenerDificultades();

        return lista;
    }

    public List<Pregunta> CargarPartida(string username, int dificultad, int categoria)
    {
        List <Pregunta> lista = new List <Pregunta>();
        lista=BD.ObtenerPreguntas(dificultad, categoria);
        Juego.InicializarJuego();

        return lista;
    }

    public Pregunta ObtenerProximaPregunta()
    {
        Pregunta pre = new Pregunta();
        List <Pregunta> lista = new List <Pregunta>();
        lista=BD.ObtenerPreguntas(dificultad, categoria)
        pre=lista[ContadorPreguntaActual];

        return pre;
    }


}