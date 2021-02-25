using Microsoft.EntityFrameworkCore;

namespace FilmesCRUDRazor.Models
{
    public class FilmeContext : DbContext
    {
        public FilmeContext(DbContextOptions<FilmeContext> options)
            : base(options)
        {
            //Default 
            // Segue esse padrão de contexto para 
            
        }

        public DbSet<Filme> Filme {get ; set;}
        // Estou criando um

    }
}