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
        return View();
    }

    
    
    public IActionResult  ConfigurarJuego()
    {
        ViewBag.categoria= BD.ObtenerCategorias();
        ViewBag.categoria= BD.ObtenerDificultades();
        return View();
        
    }

    
    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        return RedirectToAction("Jugar");
    }

    
    public IActionResult Jugar()
    {
        Pregunta preg = Juego.ObtenerProximaPregunta();

        if (preg is null)
        {
            return View("Fin");
        } 
        else
        {
            
            ViewBag.ListaRespuestas = Juego.ObtenerProximasRespuestas(preg.IdPregunta);
            return View("Juego");
        }
    }

    [HttpPost] public IActionResult VerificarRespuesta (int idPregunta, int idRespuesta)
    {
        ViewBag.acertado=Juego.VerificarRespuesta(idRespuesta);
        return View("Respuesta");
    }
}
