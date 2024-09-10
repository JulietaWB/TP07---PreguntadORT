namespace TP07.Models;
public class Categoria
{
    private  int IdCategoria {get;set; }
    private  string Nombre {get;set; }
    private  string Foto {get;set; }

    public Categoria (int idCategoria, string nombre, string foto) 
    {
        IdCategoria = idCategoria;
        Nombre = nombre;
        string Foto = foto;
    }

    public Categoria () {  }
}

