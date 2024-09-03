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
        //que sería todo?? 
        // invocar? me pone mal
        return View();
    }

    [HttpPost] public IActionResult VerificarRespuesta (int idPregunta, int idRespuesta)
    {
        VerificarRespuesta(); //??    
    }
}
