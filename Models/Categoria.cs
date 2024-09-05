public class Categoria
{
    private static int IdCategoria {get;set; }
    private static string Nombre {get;set; }
    private static string Foto {get;set; }

    public Dificultad (int idCategoria, string nombre, string foto) 
    {
        IdCategoria = idCategoria;
        Nombre = nombre;
        string Foto = foto;
    }

    public Dificultad () {  }
}

