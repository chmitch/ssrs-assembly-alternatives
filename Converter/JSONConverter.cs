using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace JSONConverter
{
    public static class Converter
    {
        [FunctionName("Converter")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            string json = req.Query["json"];

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);
            json = json ?? data?.json;

            Attributes attributes = JsonConvert.DeserializeObject<Attributes>(json);
            string result = (attributes.source == null ? "" : attributes.source) + "|" + (attributes.author == null ? "" : attributes.author) + "|" + (attributes.CreatedDate == null ? "" : attributes.CreatedDate.ToString());

            return json != null
                //? (ActionResult)new OkObjectResult($"Hello, {name}")
                ? (ActionResult)new OkObjectResult(result)
                : new BadRequestObjectResult("Please pass a name on the query string or in the request body");
        }
    }

    public class Attributes
    {
        public string source { get; set; }
        public string author { get; set; }
        public DateTime? CreatedDate { get; set; }
        //public List<string> Roles { get; set; }
    }
}
