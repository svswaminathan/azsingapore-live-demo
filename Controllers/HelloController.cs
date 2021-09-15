using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace azsingapore_live_demo.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HelloController : ControllerBase
    {
        private readonly ILogger<HelloController> logger;
        public HelloController(ILogger<HelloController> _logger)
        {
            logger = _logger;
        }
        
        [HttpGet]
        public string SayHello(string message)
        {
            logger.LogInformation($"Received args - message : {message}");
            return $"Hello {message} from {Environment.MachineName}";
        }
    }
}