using System.Collections.Generic;
using System.Threading.Tasks; // Trabalhar com forma Síncrona
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FilmesCRUDRazor.Models;
using System;


namespace FilmesCRUDRazor.Controlers
{
    [ApiController] // Controler para Razer diferente para API
    [Route("v1/filmes")] // v1 indica versionamento

    public class CategoryControler : ControllerBase
    {
        [HttpGet]
        [Route("")]
        public async Task < ActionResult < List < Filme > > > Get ([FromServices] FilmeContext context)
        {
            var filmes = await context.Filme.ToListAsync();
            return filmes;
        }

        [Route("")]
        [HttpPost]
        public async Task< ActionResult < Filme > > Post(
            [FromServices] FilmeContext context,
            [FromBody] Filme model)
        {
            context.Filme.Add(model);
            await context.SaveChangesAsync();
            return model;
        }
    }
}