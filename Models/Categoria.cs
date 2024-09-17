namespace TP07.Models;
public class Categoria
{
    public int IdCategoría {get;set; }
    public string Nombre {get;set; }
    public string Foto {get;set; }

    public Categoria (int idCategoria, string nombre, string foto) 
    {
        IdCategoría = idCategoria;
        Nombre = nombre;
        string Foto = foto;
    }

    public Categoria () {  }
}

