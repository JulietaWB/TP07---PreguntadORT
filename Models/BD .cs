using System.Data.SqlClient;
using Dapper;
namespace TP07.Models;
public static class BD{

    private static string connectionString = @"Server=localhost; DataBase = JJOO; Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias()
    {
        List <Categoria> lista = new List <Categoria>();
        string sql = "SELECT * from Categorias)";
        using (SqlConnection db =  new SqlConnection (connectionString)) 
        { 
            lista= db.Query<Categoria>(sql).ToList();    
        }

        return lista;
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        List <Dificultad> lista = new List <Dificultad>();
        string sql = "SELECT * from Dificultad)";
        using (SqlConnection db =  new SqlConnection (connectionString)) 
        { 
            lista= db.Query<Dificultad>(sql).ToList();    
        }

        return lista;
    }

    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        List <Pregunta> lista = new List <Pregunta>();
        string sql;

        if (dificultad == -1)
        {sql = "SELECT * from Preguntas where IdCategoria = @cat";}
        else if (categoria == -1)
        {sql = "SELECT * from Preguntas where IdDificultad= @dif";}
        else if (categoria == -1 && dificultad == -1)
        {sql = "SELECT * from Preguntas";}
        else
        {sql = "SELECT * from Preguntas where IdDificultad= @dif AND IdCategoria = @cat";}

        using (SqlConnection db =  new SqlConnection (connectionString)) 
        { 
            lista= db.Query<Pregunta>(sql, new {dif = dificultad, cat = categoria}).ToList();    
        }

        return lista;
    }

    public static List<Respuesta> ObtenerRespuestas(int idPregunta)
    {
        List <Respuesta> lista = new List <Respuesta>();
        string sql = "SELECT * from Respuestas where IdPregunta= @id)";
        using (SqlConnection db =  new SqlConnection (connectionString)) 
        { 
            lista= db.Query<Respuesta>(sql, new {id = idPregunta}).ToList();    
        }

        return lista;
    }

}

