using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07.Models;

namespace TP07.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        Juego.InicializarJuego();
        return View();
    }

    
    
    public IActionResult ConfigurarJuego()
    {
        ViewBag.categorias= BD.ObtenerCategorias();
        ViewBag.dificultades= BD.ObtenerDificultades();

        return View();

    }

    
    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        
        return RedirectToAction("Jugar");
    }

    
    public IActionResult Jugar()
    {
        Pregunta preg = Juego.ObtenerProximaPregunta();
        int id=preg.IdPregunta;

        if (preg is null)
        {
            return View("Fin");
        } 
        else
        {
            ViewBag.ListaRespuestas = Juego.ObtenerProximasRespuestas(id);
            ViewBag.Pregunta= preg;
            ViewBag.Username = Juego.Username;
            Viewbag.Puntos=Juego.PuntajeActual;
            return View("Juego");
        }
    }

    [HttpPost] public IActionResult VerificarRespuesta (int idPregunta, int idRespuesta)
    {
        ViewBag.acertado=Juego.VerificarRespuesta(idRespuesta);
        return View("Respuesta");
    }
}
