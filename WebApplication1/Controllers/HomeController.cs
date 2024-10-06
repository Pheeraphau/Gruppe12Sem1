using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        // Logger
        private readonly ILogger<HomeController> _logger;

        // Definerer en liste som en in-memory lagring for posisjoner
        private static List<PositionModel> positions = new List<PositionModel>();

        // Definerer en liste for in-memory lagring av AreaChange
        private static List<AreaChange> changes = new List<AreaChange>();

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        // GET-metode som h�ndterer foresp�rselen og viser "CorrectMap" view
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        // GET-metode som h�ndterer foresp�rselen og viser "CorrectMap" view
        [HttpGet]
        public IActionResult Privacy()
        {
            return View();
        }

        // GET-metode som h�ndterer foresp�rselen og viser "CorrectMap" view
        [HttpGet]
        public IActionResult CorrectMap()
        {
            return View();
        }

        // POST-metode som h�ndterer POST foresp�rsler og mottar data fra brukeren
        // Dataene blir ogs� vist p� en oversiktsside etter lagring
        [HttpPost]
        public IActionResult CorrectMap(PositionModel model)
        {
            // Sjekker om modellen er gyldig
            if (ModelState.IsValid)
            {
                // Legger ny posisjon til "positions" listen
                positions.Add(model);

                // Viser oversiktsview etter at data har blitt registrert
                return View("CorrectionOverview", positions);
            }

            return View();
        }

        // GET-metode som viser oversikt over alle registrerte posisjoner
        [HttpGet]
        public IActionResult CorrectionOverview()
        {
            return View(positions);
        }

        // GET-metode som h�ndterer foresp�rselen og viser "RegisterAreaChange" view
        [HttpGet]
        public IActionResult RegisterAreaChange()
        {
            return View();
        }

        // POST-metode som h�ndterer registrering av en ny endring (AreaChange)
        [HttpPost]
        public IActionResult RegisterAreaChange(string geoJson, string description)
        {
            var newChange = new AreaChange
            {
                Id = Guid.NewGuid().ToString(),
                GeoJson = geoJson,
                Description = description
            };

            // Lagre den nye endringen i den statiske in-memory listen
            changes.Add(newChange);

            // Omdirigerer til oversikten over endringer
            return RedirectToAction("AreaChangeOverview");
        }

        // GET-metode som viser oversikten over registrerte endringer
        [HttpGet]
        public IActionResult AreaChangeOverview()
        {
            return View(changes);
        }
    }
}

