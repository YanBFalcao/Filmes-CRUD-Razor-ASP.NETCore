[1mdiff --git a/FilmesCRUDRazor.csproj b/FilmesCRUDRazor.csproj[m
[1mindex cbe855a..8796078 100644[m
[1m--- a/FilmesCRUDRazor.csproj[m
[1m+++ b/FilmesCRUDRazor.csproj[m
[36m@@ -6,6 +6,7 @@[m
 [m
   <ItemGroup>[m
     <PackageReference Include="Microsoft.EntityFrameworkCore" Version="5.0.3" />[m
[32m+[m[32m    <PackageReference Include="Microsoft.EntityFrameworkCore.InMemory" Version="5.0.3" />[m
     <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="5.0.3" />[m
     <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlserver" Version="5.0.3" />[m
     <PackageReference Include="Microsoft.VisualStudio.Web.CodeGeneration.Design" Version="5.0.2" />[m
[1mdiff --git a/Models/FilmeContext.cs b/Models/FilmeContext.cs[m
[1mindex 2cc3936..64b6f3a 100644[m
[1m--- a/Models/FilmeContext.cs[m
[1m+++ b/Models/FilmeContext.cs[m
[36m@@ -7,9 +7,7 @@[m [mnamespace FilmesCRUDRazor.Models[m
         public FilmeContext(DbContextOptions<FilmeContext> options)[m
             : base(options)[m
         {[m
[31m-            //Default [m
[31m-            // Segue esse padrão de contexto para [m
[31m-            [m
[32m+[m[41m [m
         }[m
 [m
         public DbSet<Filme> Filme {get ; set;}[m
[1mdiff --git a/Models/Filmes.cs b/Models/Filmes.cs[m
[1mindex 5b0043b..fbe6efd 100644[m
[1m--- a/Models/Filmes.cs[m
[1m+++ b/Models/Filmes.cs[m
[36m@@ -1,4 +1,5 @@[m
 using System;[m
[32m+[m[32musing Microsoft.EntityFrameworkCore;[m
 [m
 namespace FilmesCRUDRazor.Models[m
 {[m
[36m@@ -9,5 +10,7 @@[m [mnamespace FilmesCRUDRazor.Models[m
         public DateTime DataLancamento { get; set; }[m
         public string Genero { get; set; }[m
         public decimal Preco { get; set; }[m
[32m+[m[32m        public Filme filmesLista { get; set; }[m
[32m+[m
     }[m
 } [m
\ No newline at end of file[m
[1mdiff --git a/Startup.cs b/Startup.cs[m
[1mindex bcca59d..398ffe4 100644[m
[1m--- a/Startup.cs[m
[1m+++ b/Startup.cs[m
[36m@@ -28,9 +28,14 @@[m [mnamespace FilmesCRUDRazor[m
         public void ConfigureServices(IServiceCollection services)[m
         {[m
             services.AddRazorPages();[m
[32m+[m[32m            services.AddControllers();[m
 [m
[31m-            services.AddDbContext<FilmeContext>(options => options.[m
[31m-            UseSqlServer(Configuration.GetConnectionString("FilmeContext")));[m
[32m+[m[32m            services.AddDbContext<FilmeContext>(opt => opt.UseInMemoryDatabase("FilmeContext"));[m
[32m+[m
[32m+[m[32m            // services.AddScoped<DataContext, DataContext>();[m
[32m+[m
[32m+[m[32m            //services.AddDbContext<FilmeContext>(options => options.[m
[32m+[m[32m            //UseSqlServer(Configuration.GetConnectionString("FilmeContext")));[m
 [m
         }[m
 [m
[36m@@ -51,9 +56,9 @@[m [mnamespace FilmesCRUDRazor[m
             app.UseHttpsRedirection();[m
             app.UseStaticFiles();[m
 [m
[31m-            app.UseRouting();[m
[32m+[m[32m            app.UseRouting(); // Esquema de Rotas[m
 [m
[31m-            app.UseAuthorization();[m
[32m+[m[32m            app.UseAuthorization();[m[41m [m
 [m
             app.UseEndpoints(endpoints =>[m
             {[m
[1mdiff --git a/appsettings.json b/appsettings.json[m
[1mindex 2212541..251054e 100644[m
[1m--- a/appsettings.json[m
[1m+++ b/appsettings.json[m
[36m@@ -1,15 +1,11 @@[m
 {[m
[32m+[m[32m  "ConnectionStrings": {[m
[32m+[m[32m    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=NerdStoreDb;Trusted_Connection=True;MultipleActiveResultSets=true"[m
[32m+[m[32m  },[m
   "Logging": {[m
[31m-    "IncludeScopes": false,[m
[31m-    "LogLevel":[m
[31m-    {[m
[31m-      "Default": "Information",[m
[31m-      "Microsoft": "Warning",[m
[31m-      "Microsoft.Hosting.Lifetime": "Information"[m
[32m+[m[32m    "LogLevel": {[m
[32m+[m[32m      "Default": "Warning"[m
     }[m
   },[m
[31m-  "ConnectionStrings": [m
[31m-  {[m
[31m-    "FilmeContext": "Data Source=FilmeCrud.db"[m
[31m-  }[m
[32m+[m[32m  "AllowedHosts": "*"[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/bin/Debug/net5.0/FilmesCRUDRazor.Views.dll b/bin/Debug/net5.0/FilmesCRUDRazor.Views.dll[m
[1mindex 3e5ae81..7f03a5b 100644[m
Binary files a/bin/Debug/net5.0/FilmesCRUDRazor.Views.dll and b/bin/Debug/net5.0/FilmesCRUDRazor.Views.dll differ
[1mdiff --git a/bin/Debug/net5.0/FilmesCRUDRazor.Views.pdb b/bin/Debug/net5.0/FilmesCRUDRazor.Views.pdb[m
[1mindex 6660703..b14ff20 100644[m
Binary files a/bin/Debug/net5.0/FilmesCRUDRazor.Views.pdb and b/bin/Debug/net5.0/FilmesCRUDRazor.Views.pdb differ
[1mdiff --git a/bin/Debug/net5.0/FilmesCRUDRazor.deps.json b/bin/Debug/net5.0/FilmesCRUDRazor.deps.json[m
[1mindex 296960b..ea62c9c 100644[m
[1m--- a/bin/Debug/net5.0/FilmesCRUDRazor.deps.json[m
[1m+++ b/bin/Debug/net5.0/FilmesCRUDRazor.deps.json[m
[36m@@ -26,7 +26,9 @@[m
       "FilmesCRUDRazor/1.0.0": {[m
         "dependencies": {[m
           "Microsoft.EntityFrameworkCore": "5.0.3",[m
[32m+[m[32m          "Microsoft.EntityFrameworkCore.InMemory": "5.0.3",[m
           "Microsoft.EntityFrameworkCore.Sqlite": "5.0.3",[m
[32m+[m[32m          "Microsoft.EntityFrameworkCore.SqlServer": "5.0.3",[m
           "Microsoft.VisualStudio.Web.CodeGeneration.Design": "5.0.2",[m
           "Microsoft.AspNetCore.Antiforgery": "5.0.0.0",[m
           "Microsoft.AspNetCore.Authentication.Abstractions": "5.0.0.0",[m
[36m@@ -105,7 +107,7 @@[m
           "Microsoft.AspNetCore.StaticFiles": "5.0.0.0",[m
           "Microsoft.AspNetCore.WebSockets": "5.0.0.0",[m
           "Microsoft.AspNetCore.WebUtilities": "5.0.0.0",[m
[31m-          "Microsoft.CSharp": "5.0.0.0",[m
[32m+[m[32m          "Microsoft.CSharp.Reference": "5.0.0.0",[m
           "Microsoft.Extensions.Caching.Abstractions.Reference": "5.0.0.0",[m
           "Microsoft.Extensions.Caching.Memory.Reference": "5.0.0.0",[m
           "Microsoft.Extensions.Configuration.Abstractions.Reference": "5.0.0.0",[m
[36m@@ -153,7 +155,7 @@[m
           "Microsoft.VisualBasic.Core": "10.0.6.0",[m
           "Microsoft.VisualBasic": "10.0.0.0",[m
           "Microsoft.Win32.Primitives.Reference": "5.0.0.0",[m
[31m-          "Microsoft.Win32.Registry": "5.0.0.0",[m
[32m+[m[32m          "Microsoft.Win32.Registry.Reference": "5.0.0.0",[m
           "mscorlib": "4.0.0.0",[m
           "netstandard": "2.1.0.0",[m
           "System.AppContext.Reference": "5.0.0.0",[m
[36m@@ -161,14 +163,14 @@[m
           "System.Collections.Concurrent.Reference": "5.0.0.0",[m
           "System.Collections.Reference": "5.0.0.0",[m
           "System.Collections.Immutable.Reference": "5.0.0.0",[m
[31m-          "System.Collections.NonGeneric": "5.0.0.0",[m
[31m-          "System.Collections.Specialized": "5.0.0.0",[m
[32m+[m[32m          "System.Collections.NonGeneric.Reference": "5.0.0.0",[m
[32m+[m[32m          "System.Collections.Specialized.Reference": "5.0.0.0",[m
           "System.ComponentModel.Annotations.Reference": "5.0.0.0",[m
           "System.ComponentModel.DataAnnotations": "4.0.0.0",[m
[31m-          "System.ComponentModel": "5.0.0.0",[m
[32m+[m[32m          "System.ComponentModel.Reference": "5.0.0.0",[m
           "System.ComponentModel.EventBasedAsync": "5.0.0.0",[m
[31m-          "System.ComponentModel.Primitives": "5.0.0.0",[m
[31m-          "System.ComponentModel.TypeConverter": "5.0.0.0",[m
[32m+[m[32m          "System.ComponentModel.Primitives.Reference": "5.0.0.0",[m
[32m+[m[32m          "System.ComponentModel.TypeConverter.Reference": "5.0.0.0",[m
           "System.Configuration": "4.0.0.0",[m
           "System.Console.Reference": "5.0.0.0",[m
           "System.Core": "4.0.0.0",[m
[36m@@ -217,7 +219,7 @@[m
           "System.Net.Http.Json": "5.0.0.0",[m
           "System.Net.HttpListener": "5.0.0.0",[m
           "System.Net.Mail": "5.0.0.0",[m
[31m-          "System.Net.NameResolution": "5.0.0.0",[m
[32m+[m[32m          "System.Net.NameResolution.Reference": "5.0.0.0",[m
           "System.Net.NetworkInformation": "5.0.0.0",[m
           "System.Net.Ping": "5.0.0.0",[m
           "System.Net.Primitives.Reference": "5.0.0.0",[m
[36m@@ -256,11 +258,11 @@[m
           "System.Runtime.Loader": "5.0.0.0",[m
           "System.Runtime.Numerics.Reference": "5.0.0.0",[m
           "System.Runtime.Serialization": "4.0.0.0",[m
[31m-          "System.Runtime.Serialization.Formatters": "5.0.0.0",[m
[31m-          "System.Runtime.Serialization.Json": "5.0.0.0",[m
[31m-          "System.Runtime.Serialization.Primitives": "5.0.0.0",[m
[32m+[m[32m          "System.Runtime.Serialization.Formatters.Reference": "5.0.0.0",[m
[32m+[m[32m          "System.Runtime.Serialization.Json.Reference": "5.0.0.0",[m
[32m+[m[32m          "System.Runtime.Serialization.Primitives.Reference": "5.0.0.0",[m
           "System.Runtime.Serialization.Xml": "5.0.0.0",[m
[31m-          "System.Security.AccessControl": "5.0.0.0",[m
[32m+[m[32m          "System.Security.AccessControl.Reference": "5.0.0.0",[m
           "System.Security.Claims": "5.0.0.0",[m
           "System.Security.Cryptography.Algorithms.Reference": "5.0.0.0",[m
           "System.Security.Cryptography.Cng.Reference": "5.0.0.0",[m
[36m@@ -270,10 +272,10 @@[m
           "System.Security.Cryptography.X509Certificates.Reference": "5.0.0.0",[m
           "System.Security.Cryptography.Xml": "5.0.0.0",[m
           "System.Security": "4.0.0.0",[m
[31m-          "System.Security.Permissions": "5.0.0.0",[m
[32m+[m[32m          "System.Security.Permissions.Reference": "5.0.0.0",[m
           "System.Security.Principal": "5.0.0.0",[m
[31m-          "System.Security.Principal.Windows": "5.0.0.0",[m
[31m-          "System.Security.SecureString": "5.0.0.0",[m
[32m+[m[32m          "System.Security.Principal.Windows.Reference": "5.0.0.0",[m
[32m+[m[32m          "System.Security.SecureString.Reference": "5.0.0.0",[m
           "System.ServiceModel.Web": "4.0.0.0",[m
           "System.ServiceProcess": "4.0.0.0",[m
           "System.Text.Encoding.CodePages.Reference": "5.0.0.0",[m
[36m@@ -298,14 +300,14 @@[m
           "System.Web": "4.0.0.0",[m
           "System.Web.HttpUtility": "5.0.0.0",[m
           "System.Windows": "4.0.0.0",[m
[31m-          "System.Windows.Extensions": "5.0.0.0",[m
[32m+[m[32m          "System.Windows.Extensions.Reference": "5.0.0.0",[m
           "System.Xml": "4.0.0.0",[m
           "System.Xml.Linq": "4.0.0.0",[m
           "System.Xml.ReaderWriter.Reference": "5.0.0.0",[m
           "System.Xml.Serialization": "4.0.0.0",[m
           "System.Xml.XDocument.Reference": "5.0.0.0",[m
[31m-          "System.Xml.XmlDocument": "5.0.0.0",[m
[31m-          "System.Xml.XmlSerializer": "5.0.0.0",[m
[32m+[m[32m          "System.Xml.XmlDocument.Reference": "5.0.0.0",[m
[32m+[m[32m          "System.Xml.XmlSerializer.Reference": "5.0.0.0",[m
           "System.Xml.XPath": "5.0.0.0",[m
           "System.Xml.XPath.XDocument": "5.0.0.0",[m
           "WindowsBase": "4.0.0.0"[m
[36m@@ -374,7 +376,7 @@[m
           "System.Memory": "4.5.4",[m
           "System.Reflection.Metadata": "5.0.0",[m
           "System.Runtime.CompilerServices.Unsafe": "4.7.1",[m
[31m-          "System.Text.Encoding.CodePages": "4.5.1",[m
[32m+[m[32m          "System.Text.Encoding.CodePages": "4.7.0",[m
           "System.Threading.Tasks.Extensions": "4.5.4"[m
         },[m
         "runtime": {[m
[36m@@ -614,6 +616,88 @@[m
           "lib/netcoreapp3.1/Microsoft.CodeAnalysis.Workspaces.dll": {}[m
         }[m
       },[m
[32m+[m[32m      "Microsoft.CSharp/4.5.0": {},[m
[32m+[m[32m      "Microsoft.Data.SqlClient/2.0.1": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.Data.SqlClient.SNI.runtime": "2.0.1",[m
[32m+[m[32m          "Microsoft.Identity.Client": "4.14.0",[m
[32m+[m[32m          "Microsoft.IdentityModel.JsonWebTokens": "5.6.0",[m
[32m+[m[32m          "Microsoft.IdentityModel.Protocols.OpenIdConnect": "5.6.0",[m
[32m+[m[32m          "Microsoft.Win32.Registry": "4.7.0",[m
[32m+[m[32m          "System.Configuration.ConfigurationManager": "4.7.0",[m
[32m+[m[32m          "System.Diagnostics.DiagnosticSource": "5.0.1",[m
[32m+[m[32m          "System.Runtime.Caching": "4.7.0",[m
[32m+[m[32m          "System.Security.Principal.Windows": "4.7.0",[m
[32m+[m[32m          "System.Text.Encoding.CodePages": "4.7.0"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netcoreapp3.1/Microsoft.Data.SqlClient.dll": {[m
[32m+[m[32m            "assemblyVersion": "2.0.20168.4",[m
[32m+[m[32m            "fileVersion": "2.0.20168.4"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtimeTargets": {[m
[32m+[m[32m          "runtimes/unix/lib/netcoreapp3.1/Microsoft.Data.SqlClient.dll": {[m
[32m+[m[32m            "rid": "unix",[m
[32m+[m[32m            "assetType": "runtime",[m
[32m+[m[32m            "assemblyVersion": "2.0.20168.4",[m
[32m+[m[32m            "fileVersion": "2.0.20168.4"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win/lib/netcoreapp3.1/Microsoft.Data.SqlClient.dll": {[m
[32m+[m[32m            "rid": "win",[m
[32m+[m[32m            "assetType": "runtime",[m
[32m+[m[32m            "assemblyVersion": "2.0.20168.4",[m
[32m+[m[32m            "fileVersion": "2.0.20168.4"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "ref/netcoreapp3.1/Microsoft.Data.SqlClient.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.Data.SqlClient.SNI.runtime/2.0.1": {[m
[32m+[m[32m        "runtimeTargets": {[m
[32m+[m[32m          "runtimes/win-arm/native/Microsoft.Data.SqlClient.SNI.dll": {[m
[32m+[m[32m            "rid": "win-arm",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "2.0.1.0"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win-arm/native/Microsoft.Data.SqlClient.SNI.pdb": {[m
[32m+[m[32m            "rid": "win-arm",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "0.0.0.0"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win-arm64/native/Microsoft.Data.SqlClient.SNI.dll": {[m
[32m+[m[32m            "rid": "win-arm64",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "2.0.1.0"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win-arm64/native/Microsoft.Data.SqlClient.SNI.pdb": {[m
[32m+[m[32m            "rid": "win-arm64",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "0.0.0.0"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win-x64/native/Microsoft.Data.SqlClient.SNI.dll": {[m
[32m+[m[32m            "rid": "win-x64",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "2.0.1.0"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win-x64/native/Microsoft.Data.SqlClient.SNI.pdb": {[m
[32m+[m[32m            "rid": "win-x64",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "0.0.0.0"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win-x86/native/Microsoft.Data.SqlClient.SNI.dll": {[m
[32m+[m[32m            "rid": "win-x86",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "2.0.1.0"[m
[32m+[m[32m          },[m
[32m+[m[32m          "runtimes/win-x86/native/Microsoft.Data.SqlClient.SNI.pdb": {[m
[32m+[m[32m            "rid": "win-x86",[m
[32m+[m[32m            "assetType": "native",[m
[32m+[m[32m            "fileVersion": "0.0.0.0"[m
[32m+[m[32m          }[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "Microsoft.Data.Sqlite.Core/5.0.3": {[m
         "dependencies": {[m
           "SQLitePCLRaw.core": "2.0.4"[m
[36m@@ -672,6 +756,20 @@[m
         }[m
       },[m
       "Microsoft.EntityFrameworkCore.Analyzers/5.0.3": {},[m
[32m+[m[32m      "Microsoft.EntityFrameworkCore.InMemory/5.0.3": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.EntityFrameworkCore": "5.0.3"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.1/Microsoft.EntityFrameworkCore.InMemory.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.0.3.0",[m
[32m+[m[32m            "fileVersion": "5.0.321.6417"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.1/Microsoft.EntityFrameworkCore.InMemory.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "Microsoft.EntityFrameworkCore.Relational/5.0.3": {[m
         "dependencies": {[m
           "Microsoft.EntityFrameworkCore": "5.0.3",[m
[36m@@ -710,6 +808,21 @@[m
           "lib/netstandard2.1/Microsoft.EntityFrameworkCore.Sqlite.dll": {}[m
         }[m
       },[m
[32m+[m[32m      "Microsoft.EntityFrameworkCore.SqlServer/5.0.3": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.Data.SqlClient": "2.0.1",[m
[32m+[m[32m          "Microsoft.EntityFrameworkCore.Relational": "5.0.3"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.1/Microsoft.EntityFrameworkCore.SqlServer.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.0.3.0",[m
[32m+[m[32m            "fileVersion": "5.0.321.6417"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.1/Microsoft.EntityFrameworkCore.SqlServer.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "Microsoft.Extensions.Caching.Abstractions/5.0.0": {[m
         "dependencies": {[m
           "Microsoft.Extensions.Primitives": "5.0.0"[m
[36m@@ -771,8 +884,100 @@[m
         }[m
       },[m
       "Microsoft.Extensions.Primitives/5.0.0": {},[m
[31m-      "Microsoft.NETCore.Platforms/2.1.2": {},[m
[31m-      "Microsoft.NETCore.Targets/1.1.0": {},[m
[32m+[m[32m      "Microsoft.Identity.Client/4.14.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.CSharp": "4.5.0",[m
[32m+[m[32m          "System.ComponentModel.TypeConverter": "4.3.0",[m
[32m+[m[32m          "System.Net.NameResolution": "4.3.0",[m
[32m+[m[32m          "System.Private.Uri": "4.3.2",[m
[32m+[m[32m          "System.Runtime.Serialization.Formatters": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Serialization.Json": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Serialization.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Security.SecureString": "4.3.0",[m
[32m+[m[32m          "System.Xml.XDocument": "4.3.0"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netcoreapp2.1/Microsoft.Identity.Client.dll": {[m
[32m+[m[32m            "assemblyVersion": "4.14.0.0",[m
[32m+[m[32m            "fileVersion": "4.14.0.0"[m
[32m+[m[32m          }[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.IdentityModel.JsonWebTokens/5.6.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.IdentityModel.Tokens": "5.6.0",[m
[32m+[m[32m          "Newtonsoft.Json": "11.0.2"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.JsonWebTokens.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.6.0.0",[m
[32m+[m[32m            "fileVersion": "5.6.0.61018"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.JsonWebTokens.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.IdentityModel.Logging/5.6.0": {[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Logging.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.6.0.0",[m
[32m+[m[32m            "fileVersion": "5.6.0.61018"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Logging.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.IdentityModel.Protocols/5.6.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.IdentityModel.Logging": "5.6.0",[m
[32m+[m[32m          "Microsoft.IdentityModel.Tokens": "5.6.0"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Protocols.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.6.0.0",[m
[32m+[m[32m            "fileVersion": "5.6.0.61018"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Protocols.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.IdentityModel.Protocols.OpenIdConnect/5.6.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.IdentityModel.Protocols": "5.6.0",[m
[32m+[m[32m          "Newtonsoft.Json": "11.0.2",[m
[32m+[m[32m          "System.IdentityModel.Tokens.Jwt": "5.6.0"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Protocols.OpenIdConnect.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.6.0.0",[m
[32m+[m[32m            "fileVersion": "5.6.0.61018"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Protocols.OpenIdConnect.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.IdentityModel.Tokens/5.6.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.IdentityModel.Logging": "5.6.0",[m
[32m+[m[32m          "Newtonsoft.Json": "11.0.2",[m
[32m+[m[32m          "System.Security.Cryptography.Cng": "4.5.0"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Tokens.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.6.0.0",[m
[32m+[m[32m            "fileVersion": "5.6.0.61018"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.0/Microsoft.IdentityModel.Tokens.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.NETCore.Platforms/3.1.0": {},[m
[32m+[m[32m      "Microsoft.NETCore.Targets/1.1.3": {},[m
       "Microsoft.VisualStudio.Web.CodeGeneration/5.0.2": {[m
         "dependencies": {[m
           "Microsoft.Extensions.DependencyInjection": "5.0.1",[m
[36m@@ -909,14 +1114,25 @@[m
       },[m
       "Microsoft.Win32.Primitives/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "Microsoft.Win32.Registry/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Security.AccessControl": "4.7.0",[m
[32m+[m[32m          "System.Security.Principal.Windows": "4.7.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "Microsoft.Win32.SystemEvents/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "NETStandard.Library/1.6.1": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
           "Microsoft.Win32.Primitives": "4.3.0",[m
           "System.AppContext": "4.3.0",[m
           "System.Collections": "4.3.0",[m
[36m@@ -978,20 +1194,20 @@[m
       "runtime.fedora.24-x64.runtime.native.System.Security.Cryptography.OpenSsl/4.3.0": {},[m
       "runtime.native.System/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0"[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3"[m
         }[m
       },[m
       "runtime.native.System.IO.Compression/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0"[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3"[m
         }[m
       },[m
       "runtime.native.System.Net.Http/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0"[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3"[m
         }[m
       },[m
       "runtime.native.System.Security.Cryptography.Apple/4.3.0": {[m
[36m@@ -1155,8 +1371,8 @@[m
       },[m
       "System.Collections/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
[36m@@ -1179,11 +1395,63 @@[m
           "lib/netstandard2.0/System.Collections.Immutable.dll": {}[m
         }[m
       },[m
[32m+[m[32m      "System.Collections.NonGeneric/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Diagnostics.Debug": "4.3.0",[m
[32m+[m[32m          "System.Globalization": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Threading": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Collections.Specialized/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Collections.NonGeneric": "4.3.0",[m
[32m+[m[32m          "System.Globalization": "4.3.0",[m
[32m+[m[32m          "System.Globalization.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Threading": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.ComponentModel/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Runtime": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.ComponentModel.Annotations/5.0.0": {[m
         "compile": {[m
           "ref/netstandard2.1/System.ComponentModel.Annotations.dll": {}[m
         }[m
       },[m
[32m+[m[32m      "System.ComponentModel.Primitives/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.ComponentModel": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.ComponentModel.TypeConverter/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Collections": "4.3.0",[m
[32m+[m[32m          "System.Collections.NonGeneric": "4.3.0",[m
[32m+[m[32m          "System.Collections.Specialized": "4.3.0",[m
[32m+[m[32m          "System.ComponentModel": "4.3.0",[m
[32m+[m[32m          "System.ComponentModel.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Globalization": "4.3.0",[m
[32m+[m[32m          "System.Linq": "4.3.0",[m
[32m+[m[32m          "System.Reflection": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Reflection.TypeExtensions": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Threading": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Composition/1.0.31": {[m
         "dependencies": {[m
           "System.Composition.AttributedModel": "1.0.31",[m
[36m@@ -1307,10 +1575,22 @@[m
           "lib/netstandard1.0/System.Composition.TypedParts.dll": {}[m
         }[m
       },[m
[32m+[m[32m      "System.Configuration.ConfigurationManager/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Security.Cryptography.ProtectedData": "4.7.0",[m
[32m+[m[32m          "System.Security.Permissions": "4.7.0"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/System.Configuration.ConfigurationManager.dll": {[m
[32m+[m[32m            "assemblyVersion": "4.0.3.0",[m
[32m+[m[32m            "fileVersion": "4.700.19.56404"[m
[32m+[m[32m          }[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Console/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.IO": "4.3.0",[m
           "System.Runtime": "4.3.0",[m
           "System.Text.Encoding": "4.3.0"[m
[36m@@ -1318,8 +1598,8 @@[m
       },[m
       "System.Diagnostics.Debug/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
[36m@@ -1336,36 +1616,42 @@[m
       },[m
       "System.Diagnostics.Tools/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
       "System.Diagnostics.Tracing/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Drawing.Common/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.Win32.SystemEvents": "4.7.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Globalization/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
       "System.Globalization.Calendars/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Globalization": "4.3.0",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
       "System.Globalization.Extensions/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
           "System.Globalization": "4.3.0",[m
           "System.Resources.ResourceManager": "4.3.0",[m
           "System.Runtime": "4.3.0",[m
[36m@@ -1373,10 +1659,26 @@[m
           "System.Runtime.InteropServices": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.IdentityModel.Tokens.Jwt/5.6.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.IdentityModel.JsonWebTokens": "5.6.0",[m
[32m+[m[32m          "Microsoft.IdentityModel.Tokens": "5.6.0",[m
[32m+[m[32m          "Newtonsoft.Json": "11.0.2"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/System.IdentityModel.Tokens.Jwt.dll": {[m
[32m+[m[32m            "assemblyVersion": "5.6.0.0",[m
[32m+[m[32m            "fileVersion": "5.6.0.61018"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.0/System.IdentityModel.Tokens.Jwt.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.IO/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0",[m
           "System.Text.Encoding": "4.3.0",[m
           "System.Threading.Tasks": "4.3.0"[m
[36m@@ -1384,7 +1686,7 @@[m
       },[m
       "System.IO.Compression/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
           "System.Buffers": "4.3.0",[m
           "System.Collections": "4.3.0",[m
           "System.Diagnostics.Debug": "4.3.0",[m
[36m@@ -1416,8 +1718,8 @@[m
       },[m
       "System.IO.FileSystem/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.IO": "4.3.0",[m
           "System.IO.FileSystem.Primitives": "4.3.0",[m
           "System.Runtime": "4.3.0",[m
[36m@@ -1464,7 +1766,7 @@[m
       "System.Memory/4.5.4": {},[m
       "System.Net.Http/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
           "System.Collections": "4.3.0",[m
           "System.Diagnostics.Debug": "4.3.0",[m
           "System.Diagnostics.DiagnosticSource": "5.0.1",[m
[36m@@ -1492,18 +1794,36 @@[m
           "runtime.native.System.Security.Cryptography.OpenSsl": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Net.NameResolution/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "System.Collections": "4.3.0",[m
[32m+[m[32m          "System.Diagnostics.Tracing": "4.3.0",[m
[32m+[m[32m          "System.Globalization": "4.3.0",[m
[32m+[m[32m          "System.Net.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Handles": "4.3.0",[m
[32m+[m[32m          "System.Runtime.InteropServices": "4.3.0",[m
[32m+[m[32m          "System.Security.Principal.Windows": "4.7.0",[m
[32m+[m[32m          "System.Threading": "4.3.0",[m
[32m+[m[32m          "System.Threading.Tasks": "4.3.0",[m
[32m+[m[32m          "runtime.native.System": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Net.Primitives/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0",[m
           "System.Runtime.Handles": "4.3.0"[m
         }[m
       },[m
       "System.Net.Sockets/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.IO": "4.3.0",[m
           "System.Net.Primitives": "4.3.0",[m
           "System.Runtime": "4.3.0",[m
[36m@@ -1519,10 +1839,45 @@[m
           "System.Threading": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Private.DataContractSerialization/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Collections": "4.3.0",[m
[32m+[m[32m          "System.Collections.Concurrent": "4.3.0",[m
[32m+[m[32m          "System.Diagnostics.Debug": "4.3.0",[m
[32m+[m[32m          "System.Globalization": "4.3.0",[m
[32m+[m[32m          "System.IO": "4.3.0",[m
[32m+[m[32m          "System.Linq": "4.3.0",[m
[32m+[m[32m          "System.Reflection": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Emit.ILGeneration": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Emit.Lightweight": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Reflection.TypeExtensions": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Serialization.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Text.Encoding": "4.3.0",[m
[32m+[m[32m          "System.Text.Encoding.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Text.RegularExpressions": "4.3.0",[m
[32m+[m[32m          "System.Threading": "4.3.0",[m
[32m+[m[32m          "System.Threading.Tasks": "4.3.0",[m
[32m+[m[32m          "System.Xml.ReaderWriter": "4.3.0",[m
[32m+[m[32m          "System.Xml.XDocument": "4.3.0",[m
[32m+[m[32m          "System.Xml.XmlDocument": "4.3.0",[m
[32m+[m[32m          "System.Xml.XmlSerializer": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Private.Uri/4.3.2": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Reflection/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.IO": "4.3.0",[m
           "System.Reflection.Primitives": "4.3.0",[m
           "System.Runtime": "4.3.0"[m
[36m@@ -1554,8 +1909,8 @@[m
       },[m
       "System.Reflection.Extensions/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Reflection": "4.3.0",[m
           "System.Runtime": "4.3.0"[m
         }[m
[36m@@ -1567,8 +1922,8 @@[m
       },[m
       "System.Reflection.Primitives/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
[36m@@ -1580,8 +1935,8 @@[m
       },[m
       "System.Resources.ResourceManager/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Globalization": "4.3.0",[m
           "System.Reflection": "4.3.0",[m
           "System.Runtime": "4.3.0"[m
[36m@@ -1589,29 +1944,48 @@[m
       },[m
       "System.Runtime/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0"[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Runtime.Caching/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Configuration.ConfigurationManager": "4.7.0"[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/System.Runtime.Caching.dll": {[m
[32m+[m[32m            "assemblyVersion": "4.0.1.0",[m
[32m+[m[32m            "fileVersion": "4.700.19.56404"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtimeTargets": {[m
[32m+[m[32m          "runtimes/win/lib/netstandard2.0/System.Runtime.Caching.dll": {[m
[32m+[m[32m            "rid": "win",[m
[32m+[m[32m            "assetType": "runtime",[m
[32m+[m[32m            "assemblyVersion": "4.0.1.0",[m
[32m+[m[32m            "fileVersion": "4.700.19.56404"[m
[32m+[m[32m          }[m
         }[m
       },[m
       "System.Runtime.CompilerServices.Unsafe/4.7.1": {},[m
       "System.Runtime.Extensions/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
       "System.Runtime.Handles/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
       "System.Runtime.InteropServices/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Reflection": "4.3.0",[m
           "System.Reflection.Primitives": "4.3.0",[m
           "System.Runtime": "4.3.0",[m
[36m@@ -1637,42 +2011,56 @@[m
           "System.Runtime.Extensions": "4.3.0"[m
         }[m
       },[m
[31m-      "System.Security.Cryptography.Algorithms/4.3.0": {[m
[32m+[m[32m      "System.Runtime.Serialization.Formatters/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
           "System.Collections": "4.3.0",[m
[31m-          "System.IO": "4.3.0",[m
[32m+[m[32m          "System.Reflection": "4.3.0",[m
           "System.Resources.ResourceManager": "4.3.0",[m
           "System.Runtime": "4.3.0",[m
[31m-          "System.Runtime.Extensions": "4.3.0",[m
[31m-          "System.Runtime.Handles": "4.3.0",[m
[31m-          "System.Runtime.InteropServices": "4.3.0",[m
[31m-          "System.Runtime.Numerics": "4.3.0",[m
[31m-          "System.Security.Cryptography.Encoding": "4.3.0",[m
[31m-          "System.Security.Cryptography.Primitives": "4.3.0",[m
[31m-          "System.Text.Encoding": "4.3.0",[m
[31m-          "runtime.native.System.Security.Cryptography.Apple": "4.3.0",[m
[31m-          "runtime.native.System.Security.Cryptography.OpenSsl": "4.3.0"[m
[32m+[m[32m          "System.Runtime.Serialization.Primitives": "4.3.0"[m
         }[m
       },[m
[31m-      "System.Security.Cryptography.Cng/4.3.0": {[m
[32m+[m[32m      "System.Runtime.Serialization.Json/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "System.IO": "4.3.0",[m
[32m+[m[32m          "System.Private.DataContractSerialization": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Runtime.Serialization.Primitives/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Security.AccessControl/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "System.Security.Principal.Windows": "4.7.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Security.Cryptography.Algorithms/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "System.Collections": "4.3.0",[m
           "System.IO": "4.3.0",[m
           "System.Resources.ResourceManager": "4.3.0",[m
           "System.Runtime": "4.3.0",[m
           "System.Runtime.Extensions": "4.3.0",[m
           "System.Runtime.Handles": "4.3.0",[m
           "System.Runtime.InteropServices": "4.3.0",[m
[31m-          "System.Security.Cryptography.Algorithms": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Numerics": "4.3.0",[m
           "System.Security.Cryptography.Encoding": "4.3.0",[m
           "System.Security.Cryptography.Primitives": "4.3.0",[m
[31m-          "System.Text.Encoding": "4.3.0"[m
[32m+[m[32m          "System.Text.Encoding": "4.3.0",[m
[32m+[m[32m          "runtime.native.System.Security.Cryptography.Apple": "4.3.0",[m
[32m+[m[32m          "runtime.native.System.Security.Cryptography.OpenSsl": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Security.Cryptography.Cng/4.5.0": {},[m
       "System.Security.Cryptography.Csp/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
           "System.IO": "4.3.0",[m
           "System.Reflection": "4.3.0",[m
           "System.Resources.ResourceManager": "4.3.0",[m
[36m@@ -1689,7 +2077,7 @@[m
       },[m
       "System.Security.Cryptography.Encoding/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
           "System.Collections": "4.3.0",[m
           "System.Collections.Concurrent": "4.3.0",[m
           "System.Linq": "4.3.0",[m
[36m@@ -1731,9 +2119,25 @@[m
           "System.Threading.Tasks": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Security.Cryptography.ProtectedData/4.7.0": {[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.0/System.Security.Cryptography.ProtectedData.dll": {[m
[32m+[m[32m            "assemblyVersion": "4.0.5.0",[m
[32m+[m[32m            "fileVersion": "4.700.19.56404"[m
[32m+[m[32m          }[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtimeTargets": {[m
[32m+[m[32m          "runtimes/win/lib/netstandard2.0/System.Security.Cryptography.ProtectedData.dll": {[m
[32m+[m[32m            "rid": "win",[m
[32m+[m[32m            "assetType": "runtime",[m
[32m+[m[32m            "assemblyVersion": "4.0.5.0",[m
[32m+[m[32m            "fileVersion": "4.700.19.56404"[m
[32m+[m[32m          }[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Security.Cryptography.X509Certificates/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
           "System.Collections": "4.3.0",[m
           "System.Diagnostics.Debug": "4.3.0",[m
           "System.Globalization": "4.3.0",[m
[36m@@ -1748,7 +2152,7 @@[m
           "System.Runtime.InteropServices": "4.3.0",[m
           "System.Runtime.Numerics": "4.3.0",[m
           "System.Security.Cryptography.Algorithms": "4.3.0",[m
[31m-          "System.Security.Cryptography.Cng": "4.3.0",[m
[32m+[m[32m          "System.Security.Cryptography.Cng": "4.5.0",[m
           "System.Security.Cryptography.Csp": "4.3.0",[m
           "System.Security.Cryptography.Encoding": "4.3.0",[m
           "System.Security.Cryptography.OpenSsl": "4.3.0",[m
[36m@@ -1760,23 +2164,41 @@[m
           "runtime.native.System.Security.Cryptography.OpenSsl": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Security.Permissions/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Security.AccessControl": "4.7.0",[m
[32m+[m[32m          "System.Windows.Extensions": "4.7.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Security.Principal.Windows/4.7.0": {},[m
[32m+[m[32m      "System.Security.SecureString/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Handles": "4.3.0",[m
[32m+[m[32m          "System.Runtime.InteropServices": "4.3.0",[m
[32m+[m[32m          "System.Security.Cryptography.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Text.Encoding": "4.3.0",[m
[32m+[m[32m          "System.Threading": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Text.Encoding/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
[31m-      "System.Text.Encoding.CodePages/4.5.1": {[m
[32m+[m[32m      "System.Text.Encoding.CodePages/4.7.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "System.Runtime.CompilerServices.Unsafe": "4.7.1"[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0"[m
         }[m
       },[m
       "System.Text.Encoding.Extensions/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0",[m
           "System.Text.Encoding": "4.3.0"[m
         }[m
[36m@@ -1795,19 +2217,24 @@[m
       },[m
       "System.Threading.Tasks/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
       "System.Threading.Tasks.Extensions/4.5.4": {},[m
       "System.Threading.Timer/4.3.0": {[m
         "dependencies": {[m
[31m-          "Microsoft.NETCore.Platforms": "2.1.2",[m
[31m-          "Microsoft.NETCore.Targets": "1.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Platforms": "3.1.0",[m
[32m+[m[32m          "Microsoft.NETCore.Targets": "1.1.3",[m
           "System.Runtime": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Windows.Extensions/4.7.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Drawing.Common": "4.7.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "System.Xml.ReaderWriter/4.3.0": {[m
         "dependencies": {[m
           "System.Collections": "4.3.0",[m
[36m@@ -1843,6 +2270,41 @@[m
           "System.Xml.ReaderWriter": "4.3.0"[m
         }[m
       },[m
[32m+[m[32m      "System.Xml.XmlDocument/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Collections": "4.3.0",[m
[32m+[m[32m          "System.Diagnostics.Debug": "4.3.0",[m
[32m+[m[32m          "System.Globalization": "4.3.0",[m
[32m+[m[32m          "System.IO": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Text.Encoding": "4.3.0",[m
[32m+[m[32m          "System.Threading": "4.3.0",[m
[32m+[m[32m          "System.Xml.ReaderWriter": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "System.Xml.XmlSerializer/4.3.0": {[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "System.Collections": "4.3.0",[m
[32m+[m[32m          "System.Globalization": "4.3.0",[m
[32m+[m[32m          "System.IO": "4.3.0",[m
[32m+[m[32m          "System.Linq": "4.3.0",[m
[32m+[m[32m          "System.Reflection": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Emit": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Emit.ILGeneration": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Reflection.Primitives": "4.3.0",[m
[32m+[m[32m          "System.Reflection.TypeExtensions": "4.3.0",[m
[32m+[m[32m          "System.Resources.ResourceManager": "4.3.0",[m
[32m+[m[32m          "System.Runtime": "4.3.0",[m
[32m+[m[32m          "System.Runtime.Extensions": "4.3.0",[m
[32m+[m[32m          "System.Text.RegularExpressions": "4.3.0",[m
[32m+[m[32m          "System.Threading": "4.3.0",[m
[32m+[m[32m          "System.Xml.ReaderWriter": "4.3.0",[m
[32m+[m[32m          "System.Xml.XmlDocument": "4.3.0"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "Microsoft.AspNetCore.Antiforgery/5.0.0.0": {[m
         "compile": {[m
           "Microsoft.AspNetCore.Antiforgery.dll": {}[m
[36m@@ -2305,7 +2767,7 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "Microsoft.CSharp/5.0.0.0": {[m
[32m+[m[32m      "Microsoft.CSharp.Reference/5.0.0.0": {[m
         "compile": {[m
           "Microsoft.CSharp.dll": {}[m
         },[m
[36m@@ -2593,7 +3055,7 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "Microsoft.Win32.Registry/5.0.0.0": {[m
[32m+[m[32m      "Microsoft.Win32.Registry.Reference/5.0.0.0": {[m
         "compile": {[m
           "Microsoft.Win32.Registry.dll": {}[m
         },[m
[36m@@ -2641,13 +3103,13 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Collections.NonGeneric/5.0.0.0": {[m
[32m+[m[32m      "System.Collections.NonGeneric.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Collections.NonGeneric.dll": {}[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Collections.Specialized/5.0.0.0": {[m
[32m+[m[32m      "System.Collections.Specialized.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Collections.Specialized.dll": {}[m
         },[m
[36m@@ -2665,7 +3127,7 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.ComponentModel/5.0.0.0": {[m
[32m+[m[32m      "System.ComponentModel.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.ComponentModel.dll": {}[m
         },[m
[36m@@ -2677,13 +3139,13 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.ComponentModel.Primitives/5.0.0.0": {[m
[32m+[m[32m      "System.ComponentModel.Primitives.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.ComponentModel.Primitives.dll": {}[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.ComponentModel.TypeConverter/5.0.0.0": {[m
[32m+[m[32m      "System.ComponentModel.TypeConverter.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.ComponentModel.TypeConverter.dll": {}[m
         },[m
[36m@@ -2977,7 +3439,7 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Net.NameResolution/5.0.0.0": {[m
[32m+[m[32m      "System.Net.NameResolution.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Net.NameResolution.dll": {}[m
         },[m
[36m@@ -3211,19 +3673,19 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Runtime.Serialization.Formatters/5.0.0.0": {[m
[32m+[m[32m      "System.Runtime.Serialization.Formatters.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Runtime.Serialization.Formatters.dll": {}[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Runtime.Serialization.Json/5.0.0.0": {[m
[32m+[m[32m      "System.Runtime.Serialization.Json.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Runtime.Serialization.Json.dll": {}[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Runtime.Serialization.Primitives/5.0.0.0": {[m
[32m+[m[32m      "System.Runtime.Serialization.Primitives.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Runtime.Serialization.Primitives.dll": {}[m
         },[m
[36m@@ -3235,7 +3697,7 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Security.AccessControl/5.0.0.0": {[m
[32m+[m[32m      "System.Security.AccessControl.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Security.AccessControl.dll": {}[m
         },[m
[36m@@ -3295,7 +3757,7 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Security.Permissions/5.0.0.0": {[m
[32m+[m[32m      "System.Security.Permissions.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Security.Permissions.dll": {}[m
         },[m
[36m@@ -3307,13 +3769,13 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Security.Principal.Windows/5.0.0.0": {[m
[32m+[m[32m      "System.Security.Principal.Windows.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Security.Principal.Windows.dll": {}[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Security.SecureString/5.0.0.0": {[m
[32m+[m[32m      "System.Security.SecureString.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Security.SecureString.dll": {}[m
         },[m
[36m@@ -3463,7 +3925,7 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Windows.Extensions/5.0.0.0": {[m
[32m+[m[32m      "System.Windows.Extensions.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Windows.Extensions.dll": {}[m
         },[m
[36m@@ -3499,13 +3961,13 @@[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Xml.XmlDocument/5.0.0.0": {[m
[32m+[m[32m      "System.Xml.XmlDocument.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Xml.XmlDocument.dll": {}[m
         },[m
         "compileOnly": true[m
       },[m
[31m-      "System.Xml.XmlSerializer/5.0.0.0": {[m
[32m+[m[32m      "System.Xml.XmlSerializer.Reference/5.0.0.0": {[m
         "compile": {[m
           "System.Xml.XmlSerializer.dll": {}[m
         },[m
[36m@@ -3621,6 +4083,27 @@[m
       "path": "microsoft.codeanalysis.workspaces.common/3.8.0",[m
       "hashPath": "microsoft.codeanalysis.workspaces.common.3.8.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "Microsoft.CSharp/4.5.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-kaj6Wb4qoMuH3HySFJhxwQfe8R/sJsNJnANrvv8WdFPMoNbKY5htfNscv+LHCu5ipz+49m2e+WQXpLXr9XYemQ==",[m
[32m+[m[32m      "path": "microsoft.csharp/4.5.0",[m
[32m+[m[32m      "hashPath": "microsoft.csharp.4.5.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.Data.SqlClient/2.0.1": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-cff+ug/XZnGmX6DFgLY92t7G9W3i8r23w5Qnuby41l9rS+X+f7Y51hV5glvIrmsu3tIcnxbR+Z4CQ2zGhksIJw==",[m
[32m+[m[32m      "path": "microsoft.data.sqlclient/2.0.1",[m
[32m+[m[32m      "hashPath": "microsoft.data.sqlclient.2.0.1.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.Data.SqlClient.SNI.runtime/2.0.1": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-MalWSIMdwLZoNXxjmFmeRrFgaUXbEADkYNGm6HM33pculFv8gKt53s1Frs+kTfVPWMYjocd4gqwz92KrkcLfXA==",[m
[32m+[m[32m      "path": "microsoft.data.sqlclient.sni.runtime/2.0.1",[m
[32m+[m[32m      "hashPath": "microsoft.data.sqlclient.sni.runtime.2.0.1.nupkg.sha512"[m
[32m+[m[32m    },[m
     "Microsoft.Data.Sqlite.Core/5.0.3": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -3656,6 +4139,13 @@[m
       "path": "microsoft.entityframeworkcore.analyzers/5.0.3",[m
       "hashPath": "microsoft.entityframeworkcore.analyzers.5.0.3.nupkg.sha512"[m
     },[m
[32m+[m[32m    "Microsoft.EntityFrameworkCore.InMemory/5.0.3": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-TWNs01wuxmtYS8tThmOW2YPXjZEMUiStFWYw/vCIYfru+wlgQa/OAQxQjIJyFpRgy6ORj3KSqZkXbkjjHRv7MQ==",[m
[32m+[m[32m      "path": "microsoft.entityframeworkcore.inmemory/5.0.3",[m
[32m+[m[32m      "hashPath": "microsoft.entityframeworkcore.inmemory.5.0.3.nupkg.sha512"[m
[32m+[m[32m    },[m
     "Microsoft.EntityFrameworkCore.Relational/5.0.3": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -3677,6 +4167,13 @@[m
       "path": "microsoft.entityframeworkcore.sqlite.core/5.0.3",[m
       "hashPath": "microsoft.entityframeworkcore.sqlite.core.5.0.3.nupkg.sha512"[m
     },[m
[32m+[m[32m    "Microsoft.EntityFrameworkCore.SqlServer/5.0.3": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-T0cU7999ffojbqEVF7nTp7IoSHrzo748BQRMSmmlmKC+uluQbV18GhtLLu3aOA5Egmja8gFEuN9+QZdViA0Dfw==",[m
[32m+[m[32m      "path": "microsoft.entityframeworkcore.sqlserver/5.0.3",[m
[32m+[m[32m      "hashPath": "microsoft.entityframeworkcore.sqlserver.5.0.3.nupkg.sha512"[m
[32m+[m[32m    },[m
     "Microsoft.Extensions.Caching.Abstractions/5.0.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -3747,19 +4244,61 @@[m
       "path": "microsoft.extensions.primitives/5.0.0",[m
       "hashPath": "microsoft.extensions.primitives.5.0.0.nupkg.sha512"[m
     },[m
[31m-    "Microsoft.NETCore.Platforms/2.1.2": {[m
[32m+[m[32m    "Microsoft.Identity.Client/4.14.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-Etqux6Zuuv1yEN4UwKbAn6EZv0Rooc+vM4N9z7gxmeT7dyoKlXIRN44DQPzD9LV1CW0KsTVqH+2B42p1NKqPlQ==",[m
[32m+[m[32m      "path": "microsoft.identity.client/4.14.0",[m
[32m+[m[32m      "hashPath": "microsoft.identity.client.4.14.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.IdentityModel.JsonWebTokens/5.6.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-0q0U1W+gX1jmfmv7uU7GXFGB518atmSwucxsVwPGpuaGS3jwd2tUi+Gau+ezxR6oAFEBFKG9lz/fxRZzGMeDXg==",[m
[32m+[m[32m      "path": "microsoft.identitymodel.jsonwebtokens/5.6.0",[m
[32m+[m[32m      "hashPath": "microsoft.identitymodel.jsonwebtokens.5.6.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.IdentityModel.Logging/5.6.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-zEDrfEVW5x5w2hbTV94WwAcWvtue5hNTXYqoPh3ypF6U8csm09JazEYy+VPp2RtczkyMfcsvWY9Fea17e+isYQ==",[m
[32m+[m[32m      "path": "microsoft.identitymodel.logging/5.6.0",[m
[32m+[m[32m      "hashPath": "microsoft.identitymodel.logging.5.6.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.IdentityModel.Protocols/5.6.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-ei7YqYx0pIFL6JjK8ZnPK0MXZRWUNHtJPUl3KqSvj9+2f5CMa6GRSEC+BMDHr17tP6yujYUg0IQOcKzmC7qN5g==",[m
[32m+[m[32m      "path": "microsoft.identitymodel.protocols/5.6.0",[m
[32m+[m[32m      "hashPath": "microsoft.identitymodel.protocols.5.6.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.IdentityModel.Protocols.OpenIdConnect/5.6.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-yh3n+uXiwpBy/5+t67tYcmRxb9kwQdaKRyG/DNipRMF37bg5Jr0vENOo1BQz6OySMl5WIK544SzPjtr7/KkucA==",[m
[32m+[m[32m      "path": "microsoft.identitymodel.protocols.openidconnect/5.6.0",[m
[32m+[m[32m      "hashPath": "microsoft.identitymodel.protocols.openidconnect.5.6.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.IdentityModel.Tokens/5.6.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[31m-      "sha512": "sha512-mOJy3M0UN+LUG21dLGMxaWZEP6xYpQEpLuvuEQBaownaX4YuhH6NmNUlN9si+vNkAS6dwJ//N1O4DmLf2CikVg==",[m
[31m-      "path": "microsoft.netcore.platforms/2.1.2",[m
[31m-      "hashPath": "microsoft.netcore.platforms.2.1.2.nupkg.sha512"[m
[32m+[m[32m      "sha512": "sha512-C3OqR3QfBQ7wcC7yAsdMQqay87OsV6yWPYG/Ai3n7dvmWIGkouQhXoVxRP0xz3cAFL4hxZBXyw4aLTC421PaMg==",[m
[32m+[m[32m      "path": "microsoft.identitymodel.tokens/5.6.0",[m
[32m+[m[32m      "hashPath": "microsoft.identitymodel.tokens.5.6.0.nupkg.sha512"[m
     },[m
[31m-    "Microsoft.NETCore.Targets/1.1.0": {[m
[32m+[m[32m    "Microsoft.NETCore.Platforms/3.1.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[31m-      "sha512": "sha512-aOZA3BWfz9RXjpzt0sRJJMjAscAUm3Hoa4UWAfceV9UTYxgwZ1lZt5nO2myFf+/jetYQo4uTP7zS8sJY67BBxg==",[m
[31m-      "path": "microsoft.netcore.targets/1.1.0",[m
[31m-      "hashPath": "microsoft.netcore.targets.1.1.0.nupkg.sha512"[m
[32m+[m[32m      "sha512": "sha512-z7aeg8oHln2CuNulfhiLYxCVMPEwBl3rzicjvIX+4sUuCwvXw5oXQEtbiU2c0z4qYL5L3Kmx0mMA/+t/SbY67w==",[m
[32m+[m[32m      "path": "microsoft.netcore.platforms/3.1.0",[m
[32m+[m[32m      "hashPath": "microsoft.netcore.platforms.3.1.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.NETCore.Targets/1.1.3": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-3Wrmi0kJDzClwAC+iBdUBpEKmEle8FQNsCs77fkiOIw/9oYA07bL1EZNX0kQ2OMN3xpwvl0vAtOCYY3ndDNlhQ==",[m
[32m+[m[32m      "path": "microsoft.netcore.targets/1.1.3",[m
[32m+[m[32m      "hashPath": "microsoft.netcore.targets.1.1.3.nupkg.sha512"[m
     },[m
     "Microsoft.VisualStudio.Web.CodeGeneration/5.0.2": {[m
       "type": "package",[m
[36m@@ -3824,6 +4363,20 @@[m
       "path": "microsoft.win32.primitives/4.3.0",[m
       "hashPath": "microsoft.win32.primitives.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "Microsoft.Win32.Registry/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-KSrRMb5vNi0CWSGG1++id2ZOs/1QhRqROt+qgbEAdQuGjGrFcl4AOl4/exGPUYz2wUnU42nvJqon1T3U0kPXLA==",[m
[32m+[m[32m      "path": "microsoft.win32.registry/4.7.0",[m
[32m+[m[32m      "hashPath": "microsoft.win32.registry.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "Microsoft.Win32.SystemEvents/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-mtVirZr++rq+XCDITMUdnETD59XoeMxSpLRIII7JRI6Yj0LEDiO1pPn0ktlnIj12Ix8bfvQqQDMMIF9wC98oCA==",[m
[32m+[m[32m      "path": "microsoft.win32.systemevents/4.7.0",[m
[32m+[m[32m      "hashPath": "microsoft.win32.systemevents.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "NETStandard.Library/1.6.1": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4013,6 +4566,27 @@[m
       "path": "system.collections.immutable/5.0.0",[m
       "hashPath": "system.collections.immutable.5.0.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Collections.NonGeneric/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-prtjIEMhGUnQq6RnPEYLpFt8AtLbp9yq2zxOSrY7KJJZrw25Fi97IzBqY7iqssbM61Ek5b8f3MG/sG1N2sN5KA==",[m
[32m+[m[32m      "path": "system.collections.nongeneric/4.3.0",[m
[32m+[m[32m      "hashPath": "system.collections.nongeneric.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Collections.Specialized/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-Epx8PoVZR0iuOnJJDzp7pWvdfMMOAvpUo95pC4ScH2mJuXkKA2Y4aR3cG9qt2klHgSons1WFh4kcGW7cSXvrxg==",[m
[32m+[m[32m      "path": "system.collections.specialized/4.3.0",[m
[32m+[m[32m      "hashPath": "system.collections.specialized.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.ComponentModel/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-VyGn1jGRZVfxnh8EdvDCi71v3bMXrsu8aYJOwoV7SNDLVhiEqwP86pPMyRGsDsxhXAm2b3o9OIqeETfN5qfezw==",[m
[32m+[m[32m      "path": "system.componentmodel/4.3.0",[m
[32m+[m[32m      "hashPath": "system.componentmodel.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.ComponentModel.Annotations/5.0.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4020,6 +4594,20 @@[m
       "path": "system.componentmodel.annotations/5.0.0",[m
       "hashPath": "system.componentmodel.annotations.5.0.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.ComponentModel.Primitives/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-j8GUkCpM8V4d4vhLIIoBLGey2Z5bCkMVNjEZseyAlm4n5arcsJOeI3zkUP+zvZgzsbLTYh4lYeP/ZD/gdIAPrw==",[m
[32m+[m[32m      "path": "system.componentmodel.primitives/4.3.0",[m
[32m+[m[32m      "hashPath": "system.componentmodel.primitives.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.ComponentModel.TypeConverter/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-16pQ6P+EdhcXzPiEK4kbA953Fu0MNG2ovxTZU81/qsCd1zPRsKc3uif5NgvllCY598k6bI0KUyKW8fanlfaDQg==",[m
[32m+[m[32m      "path": "system.componentmodel.typeconverter/4.3.0",[m
[32m+[m[32m      "hashPath": "system.componentmodel.typeconverter.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Composition/1.0.31": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4062,6 +4650,13 @@[m
       "path": "system.composition.typedparts/1.0.31",[m
       "hashPath": "system.composition.typedparts.1.0.31.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Configuration.ConfigurationManager/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-/anOTeSZCNNI2zDilogWrZ8pNqCmYbzGNexUnNhjW8k0sHqEZ2nHJBp147jBV3hGYswu5lINpNg1vxR7bnqvVA==",[m
[32m+[m[32m      "path": "system.configuration.configurationmanager/4.7.0",[m
[32m+[m[32m      "hashPath": "system.configuration.configurationmanager.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Console/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4097,6 +4692,13 @@[m
       "path": "system.diagnostics.tracing/4.3.0",[m
       "hashPath": "system.diagnostics.tracing.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Drawing.Common/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-v+XbyYHaZjDfn0ENmJEV1VYLgGgCTx1gnfOBcppowbpOAriglYgGCvFCPr2EEZyBvXlpxbEsTwkOlInl107ahA==",[m
[32m+[m[32m      "path": "system.drawing.common/4.7.0",[m
[32m+[m[32m      "hashPath": "system.drawing.common.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Globalization/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4118,6 +4720,13 @@[m
       "path": "system.globalization.extensions/4.3.0",[m
       "hashPath": "system.globalization.extensions.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.IdentityModel.Tokens.Jwt/5.6.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-KMvPpX4exs2fe7Upq5zHMSR4yupc+jy8WG8yjucZL0XvT+r/T0hRvLIe9fP/SeN8/UVxFYBRAkRI5k1zbRGqmA==",[m
[32m+[m[32m      "path": "system.identitymodel.tokens.jwt/5.6.0",[m
[32m+[m[32m      "hashPath": "system.identitymodel.tokens.jwt.5.6.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.IO/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4181,6 +4790,13 @@[m
       "path": "system.net.http/4.3.0",[m
       "hashPath": "system.net.http.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Net.NameResolution/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-AFYl08R7MrsrEjqpQWTZWBadqXyTzNDaWpMqyxhb0d6sGhV6xMDKueuBXlLL30gz+DIRY6MpdgnHWlCh5wmq9w==",[m
[32m+[m[32m      "path": "system.net.nameresolution/4.3.0",[m
[32m+[m[32m      "hashPath": "system.net.nameresolution.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Net.Primitives/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4202,6 +4818,20 @@[m
       "path": "system.objectmodel/4.3.0",[m
       "hashPath": "system.objectmodel.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Private.DataContractSerialization/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-yDaJ2x3mMmjdZEDB4IbezSnCsnjQ4BxinKhRAaP6kEgL6Bb6jANWphs5SzyD8imqeC/3FxgsuXT6ykkiH1uUmA==",[m
[32m+[m[32m      "path": "system.private.datacontractserialization/4.3.0",[m
[32m+[m[32m      "hashPath": "system.private.datacontractserialization.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Private.Uri/4.3.2": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-o1+7RJnu3Ik3PazR7Z7tJhjPdE000Eq2KGLLWhqJJKXj04wrS8lwb1OFtDF9jzXXADhUuZNJZlPc98uwwqmpFA==",[m
[32m+[m[32m      "path": "system.private.uri/4.3.2",[m
[32m+[m[32m      "hashPath": "system.private.uri.4.3.2.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Reflection/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4272,6 +4902,13 @@[m
       "path": "system.runtime/4.3.0",[m
       "hashPath": "system.runtime.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Runtime.Caching/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-NdvNRjTPxYvIEhXQszT9L9vJhdQoX6AQ0AlhjTU+5NqFQVuacJTfhPVAvtGWNA2OJCqRiR/okBcZgMwI6MqcZg==",[m
[32m+[m[32m      "path": "system.runtime.caching/4.7.0",[m
[32m+[m[32m      "hashPath": "system.runtime.caching.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Runtime.CompilerServices.Unsafe/4.7.1": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4314,6 +4951,34 @@[m
       "path": "system.runtime.numerics/4.3.0",[m
       "hashPath": "system.runtime.numerics.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Runtime.Serialization.Formatters/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-KT591AkTNFOTbhZlaeMVvfax3RqhH1EJlcwF50Wm7sfnBLuHiOeZRRKrr1ns3NESkM20KPZ5Ol/ueMq5vg4QoQ==",[m
[32m+[m[32m      "path": "system.runtime.serialization.formatters/4.3.0",[m
[32m+[m[32m      "hashPath": "system.runtime.serialization.formatters.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Runtime.Serialization.Json/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-CpVfOH0M/uZ5PH+M9+Gu56K0j9lJw3M+PKRegTkcrY/stOIvRUeonggxNrfBYLA5WOHL2j15KNJuTuld3x4o9w==",[m
[32m+[m[32m      "path": "system.runtime.serialization.json/4.3.0",[m
[32m+[m[32m      "hashPath": "system.runtime.serialization.json.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Runtime.Serialization.Primitives/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-Wz+0KOukJGAlXjtKr+5Xpuxf8+c8739RI1C+A2BoQZT+wMCCoMDDdO8/4IRHfaVINqL78GO8dW8G2lW/e45Mcw==",[m
[32m+[m[32m      "path": "system.runtime.serialization.primitives/4.3.0",[m
[32m+[m[32m      "hashPath": "system.runtime.serialization.primitives.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Security.AccessControl/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-JECvTt5aFF3WT3gHpfofL2MNNP6v84sxtXxpqhLBCcDRzqsPBmHhQ6shv4DwwN2tRlzsUxtb3G9M3763rbXKDg==",[m
[32m+[m[32m      "path": "system.security.accesscontrol/4.7.0",[m
[32m+[m[32m      "hashPath": "system.security.accesscontrol.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Security.Cryptography.Algorithms/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4321,12 +4986,12 @@[m
       "path": "system.security.cryptography.algorithms/4.3.0",[m
       "hashPath": "system.security.cryptography.algorithms.4.3.0.nupkg.sha512"[m
     },[m
[31m-    "System.Security.Cryptography.Cng/4.3.0": {[m
[32m+[m[32m    "System.Security.Cryptography.Cng/4.5.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[31m-      "sha512": "sha512-03idZOqFlsKRL4W+LuCpJ6dBYDUWReug6lZjBa3uJWnk5sPCUXckocevTaUA8iT/MFSrY/2HXkOt753xQ/cf8g==",[m
[31m-      "path": "system.security.cryptography.cng/4.3.0",[m
[31m-      "hashPath": "system.security.cryptography.cng.4.3.0.nupkg.sha512"[m
[32m+[m[32m      "sha512": "sha512-WG3r7EyjUe9CMPFSs6bty5doUqT+q9pbI80hlNzo2SkPkZ4VTuZkGWjpp77JB8+uaL4DFPRdBsAY+DX3dBK92A==",[m
[32m+[m[32m      "path": "system.security.cryptography.cng/4.5.0",[m
[32m+[m[32m      "hashPath": "system.security.cryptography.cng.4.5.0.nupkg.sha512"[m
     },[m
     "System.Security.Cryptography.Csp/4.3.0": {[m
       "type": "package",[m
[36m@@ -4356,6 +5021,13 @@[m
       "path": "system.security.cryptography.primitives/4.3.0",[m
       "hashPath": "system.security.cryptography.primitives.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Security.Cryptography.ProtectedData/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-ehYW0m9ptxpGWvE4zgqongBVWpSDU/JCFD4K7krxkQwSz/sFQjEXCUqpvencjy6DYDbn7Ig09R8GFffu8TtneQ==",[m
[32m+[m[32m      "path": "system.security.cryptography.protecteddata/4.7.0",[m
[32m+[m[32m      "hashPath": "system.security.cryptography.protecteddata.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Security.Cryptography.X509Certificates/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4363,6 +5035,27 @@[m
       "path": "system.security.cryptography.x509certificates/4.3.0",[m
       "hashPath": "system.security.cryptography.x509certificates.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Security.Permissions/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-dkOV6YYVBnYRa15/yv004eCGRBVADXw8qRbbNiCn/XpdJSUXkkUeIvdvFHkvnko4CdKMqG8yRHC4ox83LSlMsQ==",[m
[32m+[m[32m      "path": "system.security.permissions/4.7.0",[m
[32m+[m[32m      "hashPath": "system.security.permissions.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Security.Principal.Windows/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-ojD0PX0XhneCsUbAZVKdb7h/70vyYMDYs85lwEI+LngEONe/17A0cFaRFqZU+sOEidcVswYWikYOQ9PPfjlbtQ==",[m
[32m+[m[32m      "path": "system.security.principal.windows/4.7.0",[m
[32m+[m[32m      "hashPath": "system.security.principal.windows.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Security.SecureString/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-PnXp38O9q/2Oe4iZHMH60kinScv6QiiL2XH54Pj2t0Y6c2zKPEiAZsM/M3wBOHLNTBDFP0zfy13WN2M0qFz5jg==",[m
[32m+[m[32m      "path": "system.security.securestring/4.3.0",[m
[32m+[m[32m      "hashPath": "system.security.securestring.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Text.Encoding/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4370,12 +5063,12 @@[m
       "path": "system.text.encoding/4.3.0",[m
       "hashPath": "system.text.encoding.4.3.0.nupkg.sha512"[m
     },[m
[31m-    "System.Text.Encoding.CodePages/4.5.1": {[m
[32m+[m[32m    "System.Text.Encoding.CodePages/4.7.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[31m-      "sha512": "sha512-4J2JQXbftjPMppIHJ7IC+VXQ9XfEagN92vZZNoG12i+zReYlim5dMoXFC1Zzg7tsnKDM7JPo5bYfFK4Jheq44w==",[m
[31m-      "path": "system.text.encoding.codepages/4.5.1",[m
[31m-      "hashPath": "system.text.encoding.codepages.4.5.1.nupkg.sha512"[m
[32m+[m[32m      "sha512": "sha512-aeu4FlaUTemuT1qOd1MyU4T516QR4Fy+9yDbwWMPHOHy7U8FD6SgTzdZFO7gHcfAPHtECqInbwklVvUK4RHcNg==",[m
[32m+[m[32m      "path": "system.text.encoding.codepages/4.7.0",[m
[32m+[m[32m      "hashPath": "system.text.encoding.codepages.4.7.0.nupkg.sha512"[m
     },[m
     "System.Text.Encoding.Extensions/4.3.0": {[m
       "type": "package",[m
[36m@@ -4426,6 +5119,13 @@[m
       "path": "system.threading.timer/4.3.0",[m
       "hashPath": "system.threading.timer.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Windows.Extensions/4.7.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-CeWTdRNfRaSh0pm2gDTJFwVaXfTq6Xwv/sA887iwPTneW7oMtMlpvDIO+U60+3GWTB7Aom6oQwv5VZVUhQRdPQ==",[m
[32m+[m[32m      "path": "system.windows.extensions/4.7.0",[m
[32m+[m[32m      "hashPath": "system.windows.extensions.4.7.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "System.Xml.ReaderWriter/4.3.0": {[m
       "type": "package",[m
       "serviceable": true,[m
[36m@@ -4440,6 +5140,20 @@[m
       "path": "system.xml.xdocument/4.3.0",[m
       "hashPath": "system.xml.xdocument.4.3.0.nupkg.sha512"[m
     },[m
[32m+[m[32m    "System.Xml.XmlDocument/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-lJ8AxvkX7GQxpC6GFCeBj8ThYVyQczx2+f/cWHJU8tjS7YfI6Cv6bon70jVEgs2CiFbmmM8b9j1oZVx0dSI2Ww==",[m
[32m+[m[32m      "path": "system.xml.xmldocument/4.3.0",[m
[32m+[m[32m      "hashPath": "system.xml.xmldocument.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
[32m+[m[32m    "System.Xml.XmlSerializer/4.3.0": {[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "serviceable": true,[m
[32m+[m[32m      "sha512": "sha512-MYoTCP7EZ98RrANESW05J5ZwskKDoN0AuZ06ZflnowE50LTpbR5yRg3tHckTVm5j/m47stuGgCrCHWePyHS70Q==",[m
[32m+[m[32m      "path": "system.xml.xmlserializer/4.3.0",[m
[32m+[m[32m      "hashPath": "system.xml.xmlserializer.4.3.0.nupkg.sha512"[m
[32m+[m[32m    },[m
     "Microsoft.AspNetCore.Antiforgery/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
[36m@@ -4825,7 +5539,7 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "Microsoft.CSharp/5.0.0.0": {[m
[32m+[m[32m    "Microsoft.CSharp.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5065,7 +5779,7 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "Microsoft.Win32.Registry/5.0.0.0": {[m
[32m+[m[32m    "Microsoft.Win32.Registry.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5105,12 +5819,12 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Collections.NonGeneric/5.0.0.0": {[m
[32m+[m[32m    "System.Collections.NonGeneric.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Collections.Specialized/5.0.0.0": {[m
[32m+[m[32m    "System.Collections.Specialized.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5125,7 +5839,7 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.ComponentModel/5.0.0.0": {[m
[32m+[m[32m    "System.ComponentModel.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5135,12 +5849,12 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.ComponentModel.Primitives/5.0.0.0": {[m
[32m+[m[32m    "System.ComponentModel.Primitives.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.ComponentModel.TypeConverter/5.0.0.0": {[m
[32m+[m[32m    "System.ComponentModel.TypeConverter.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5385,7 +6099,7 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Net.NameResolution/5.0.0.0": {[m
[32m+[m[32m    "System.Net.NameResolution.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5580,17 +6294,17 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Runtime.Serialization.Formatters/5.0.0.0": {[m
[32m+[m[32m    "System.Runtime.Serialization.Formatters.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Runtime.Serialization.Json/5.0.0.0": {[m
[32m+[m[32m    "System.Runtime.Serialization.Json.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Runtime.Serialization.Primitives/5.0.0.0": {[m
[32m+[m[32m    "System.Runtime.Serialization.Primitives.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5600,7 +6314,7 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Security.AccessControl/5.0.0.0": {[m
[32m+[m[32m    "System.Security.AccessControl.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5650,7 +6364,7 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Security.Permissions/5.0.0.0": {[m
[32m+[m[32m    "System.Security.Permissions.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5660,12 +6374,12 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Security.Principal.Windows/5.0.0.0": {[m
[32m+[m[32m    "System.Security.Principal.Windows.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Security.SecureString/5.0.0.0": {[m
[32m+[m[32m    "System.Security.SecureString.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5790,7 +6504,7 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Windows.Extensions/5.0.0.0": {[m
[32m+[m[32m    "System.Windows.Extensions.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[36m@@ -5820,12 +6534,12 @@[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Xml.XmlDocument/5.0.0.0": {[m
[32m+[m[32m    "System.Xml.XmlDocument.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
     },[m
[31m-    "System.Xml.XmlSerializer/5.0.0.0": {[m
[32m+[m[32m    "System.Xml.XmlSerializer.Reference/5.0.0.0": {[m
       "type": "referenceassembly",[m
       "serviceable": false,[m
       "sha512": ""[m
[1mdiff --git a/bin/Debug/net5.0/FilmesCRUDRazor.dll b/bin/Debug/net5.0/FilmesCRUDRazor.dll[m
[1mindex 0aed020..461b69c 100644[m
Binary files a/bin/Debug/net5.0/FilmesCRUDRazor.dll and b/bin/Debug/net5.0/FilmesCRUDRazor.dll differ
[1mdiff --git a/bin/Debug/net5.0/FilmesCRUDRazor.pdb b/bin/Debug/net5.0/FilmesCRUDRazor.pdb[m
[1mindex ba7bb7d..7c0ed89 100644[m
Binary files a/bin/Debug/net5.0/FilmesCRUDRazor.pdb and b/bin/Debug/net5.0/FilmesCRUDRazor.pdb differ
[1mdiff --git a/bin/Debug/net5.0/appsettings.json b/bin/Debug/net5.0/appsettings.json[m
[1mindex e886dbf..251054e 100644[m
[1m--- a/bin/Debug/net5.0/appsettings.json[m
[1m+++ b/bin/Debug/net5.0/appsettings.json[m
[36m@@ -1,17 +1,11 @@[m
 {[m
[31m-  "Logging":[m
[31m-  {[m
[31m-      "IncludeScopes": false,[m
[31m-      "LogLevel": [m
[31m-      {[m
[31m-        "Default": "Information",[m
[31m-        "Microsoft": "Warning",[m
[31m-        "Microsoft.Hosting.Lifetime": "Information"[m
[31m-      }[m
[32m+[m[32m  "ConnectionStrings": {[m
[32m+[m[32m    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=NerdStoreDb;Trusted_Connection=True;MultipleActiveResultSets=true"[m
   },[m
[31m-  [m
[31m-  "ConnectionStrings": [m
[31m-  {[m
[31m-    "FilmeContext": "Data Source=FilmeCrud.db"[m
[31m-  }[m
[31m-}[m
[32m+[m[32m  "Logging": {[m
[32m+[m[32m    "LogLevel": {[m
[32m+[m[32m      "Default": "Warning"[m
[32m+[m[32m    }[m
[32m+[m[32m  },[m
[32m+[m[32m  "AllowedHosts": "*"[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/bin/Debug/net5.0/ref/FilmesCRUDRazor.dll b/bin/Debug/net5.0/ref/FilmesCRUDRazor.dll[m
[1mindex 19819f4..62bab31 100644[m
Binary files a/bin/Debug/net5.0/ref/FilmesCRUDRazor.dll and b/bin/Debug/net5.0/ref/FilmesCRUDRazor.dll differ
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.Views.dll b/obj/Debug/net5.0/FilmesCRUDRazor.Views.dll[m
[1mindex 3e5ae81..7f03a5b 100644[m
Binary files a/obj/Debug/net5.0/FilmesCRUDRazor.Views.dll and b/obj/Debug/net5.0/FilmesCRUDRazor.Views.dll differ
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.Views.pdb b/obj/Debug/net5.0/FilmesCRUDRazor.Views.pdb[m
[1mindex 6660703..b14ff20 100644[m
Binary files a/obj/Debug/net5.0/FilmesCRUDRazor.Views.pdb and b/obj/Debug/net5.0/FilmesCRUDRazor.Views.pdb differ
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.assets.cache b/obj/Debug/net5.0/FilmesCRUDRazor.assets.cache[m
[1mindex d0baafe..f87952a 100644[m
Binary files a/obj/Debug/net5.0/FilmesCRUDRazor.assets.cache and b/obj/Debug/net5.0/FilmesCRUDRazor.assets.cache differ
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.csproj.CoreCompileInputs.cache b/obj/Debug/net5.0/FilmesCRUDRazor.csproj.CoreCompileInputs.cache[m
[1mindex 7424ba8..b23817e 100644[m
[1m--- a/obj/Debug/net5.0/FilmesCRUDRazor.csproj.CoreCompileInputs.cache[m
[1m+++ b/obj/Debug/net5.0/FilmesCRUDRazor.csproj.CoreCompileInputs.cache[m
[36m@@ -1 +1 @@[m
[31m-56a5e87852bbafcbb0aff4ec273a50c7cfb45991[m
[32m+[m[32m8d9e14d197395a68ea42d09afb2a53e395063080[m
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.csproj.FileListAbsolute.txt b/obj/Debug/net5.0/FilmesCRUDRazor.csproj.FileListAbsolute.txt[m
[1mindex 1a3aef1..e379e94 100644[m
[1m--- a/obj/Debug/net5.0/FilmesCRUDRazor.csproj.FileListAbsolute.txt[m
[1m+++ b/obj/Debug/net5.0/FilmesCRUDRazor.csproj.FileListAbsolute.txt[m
[36m@@ -140,3 +140,28 @@[m [mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-ar[m
 C:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-arm64\native\e_sqlite3.dll[m
 C:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-x64\native\e_sqlite3.dll[m
 C:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-x86\native\e_sqlite3.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.Data.SqlClient.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.EntityFrameworkCore.InMemory.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.EntityFrameworkCore.SqlServer.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.Identity.Client.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.IdentityModel.JsonWebTokens.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.IdentityModel.Logging.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.IdentityModel.Protocols.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.IdentityModel.Protocols.OpenIdConnect.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\Microsoft.IdentityModel.Tokens.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\System.Configuration.ConfigurationManager.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\System.IdentityModel.Tokens.Jwt.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\System.Runtime.Caching.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\System.Security.Cryptography.ProtectedData.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\unix\lib\netcoreapp3.1\Microsoft.Data.SqlClient.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win\lib\netcoreapp3.1\Microsoft.Data.SqlClient.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-arm\native\Microsoft.Data.SqlClient.SNI.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-arm\native\Microsoft.Data.SqlClient.SNI.pdb[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-arm64\native\Microsoft.Data.SqlClient.SNI.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-arm64\native\Microsoft.Data.SqlClient.SNI.pdb[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-x64\native\Microsoft.Data.SqlClient.SNI.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-x64\native\Microsoft.Data.SqlClient.SNI.pdb[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-x86\native\Microsoft.Data.SqlClient.SNI.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win-x86\native\Microsoft.Data.SqlClient.SNI.pdb[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win\lib\netstandard2.0\System.Runtime.Caching.dll[m
[32m+[m[32mC:\Users\yan-w\source\repos\src\FilmesCRUDRazor\bin\Debug\net5.0\runtimes\win\lib\netstandard2.0\System.Security.Cryptography.ProtectedData.dll[m
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.csprojAssemblyReference.cache b/obj/Debug/net5.0/FilmesCRUDRazor.csprojAssemblyReference.cache[m
[1mindex fd50fae..d3d28e5 100644[m
Binary files a/obj/Debug/net5.0/FilmesCRUDRazor.csprojAssemblyReference.cache and b/obj/Debug/net5.0/FilmesCRUDRazor.csprojAssemblyReference.cache differ
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.dll b/obj/Debug/net5.0/FilmesCRUDRazor.dll[m
[1mindex 0aed020..461b69c 100644[m
Binary files a/obj/Debug/net5.0/FilmesCRUDRazor.dll and b/obj/Debug/net5.0/FilmesCRUDRazor.dll differ
[1mdiff --git a/obj/Debug/net5.0/FilmesCRUDRazor.pdb b/obj/Debug/net5.0/FilmesCRUDRazor.pdb[m
[1mindex ba7bb7d..7c0ed89 100644[m
Binary files a/obj/Debug/net5.0/FilmesCRUDRazor.pdb and b/obj/Debug/net5.0/FilmesCRUDRazor.pdb differ
[1mdiff --git a/obj/Debug/net5.0/ref/FilmesCRUDRazor.dll b/obj/Debug/net5.0/ref/FilmesCRUDRazor.dll[m
[1mindex 19819f4..62bab31 100644[m
Binary files a/obj/Debug/net5.0/ref/FilmesCRUDRazor.dll and b/obj/Debug/net5.0/ref/FilmesCRUDRazor.dll differ
[1mdiff --git a/obj/FilmesCRUDRazor.csproj.nuget.dgspec.json b/obj/FilmesCRUDRazor.csproj.nuget.dgspec.json[m
[1mindex ba29998..4576104 100644[m
[1m--- a/obj/FilmesCRUDRazor.csproj.nuget.dgspec.json[m
[1m+++ b/obj/FilmesCRUDRazor.csproj.nuget.dgspec.json[m
[36m@@ -44,6 +44,10 @@[m
               "target": "Package",[m
               "version": "[5.0.3, )"[m
             },[m
[32m+[m[32m            "Microsoft.EntityFrameworkCore.InMemory": {[m
[32m+[m[32m              "target": "Package",[m
[32m+[m[32m              "version": "[5.0.3, )"[m
[32m+[m[32m            },[m
             "Microsoft.EntityFrameworkCore.Sqlite": {[m
               "target": "Package",[m
               "version": "[5.0.3, )"[m
[1mdiff --git a/obj/project.assets.json b/obj/project.assets.json[m
[1mindex acbdda6..6837713 100644[m
[1m--- a/obj/project.assets.json[m
[1m+++ b/obj/project.assets.json[m
[36m@@ -447,6 +447,18 @@[m
           "lib/netstandard2.0/_._": {}[m
         }[m
       },[m
[32m+[m[32m      "Microsoft.EntityFrameworkCore.InMemory/5.0.3": {[m
[32m+[m[32m        "type": "package",[m
[32m+[m[32m        "dependencies": {[m
[32m+[m[32m          "Microsoft.EntityFrameworkCore": "5.0.3"[m
[32m+[m[32m        },[m
[32m+[m[32m        "compile": {[m
[32m+[m[32m          "lib/netstandard2.1/Microsoft.EntityFrameworkCore.InMemory.dll": {}[m
[32m+[m[32m        },[m
[32m+[m[32m        "runtime": {[m
[32m+[m[32m          "lib/netstandard2.1/Microsoft.EntityFrameworkCore.InMemory.dll": {}[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
       "Microsoft.EntityFrameworkCore.Relational/5.0.3": {[m
         "type": "package",[m
         "dependencies": {[m
[36m@@ -3365,6 +3377,20 @@[m
         "microsoft.entityframeworkcore.analyzers.nuspec"[m
       ][m
     },[m
[32m+[m[32m    "Microsoft.EntityFrameworkCore.InMemory/5.0.3": {[m
[32m+[m[32m      "sha512": "TWNs01wuxmtYS8tThmOW2YPXjZEMUiStFWYw/vCIYfru+wlgQa/OAQxQjIJyFpRgy6ORj3KSqZkXbkjjHRv7MQ==",[m
[32m+[m[32m      "type": "package",[m
[32m+[m[32m      "path": "microsoft.entityframeworkcore.inmemory/5.0.3",[m
[32m+[m[32m      "files": [[m
[32m+[m[32m        ".nupkg.metadata",[m
[32m+[m[32m        ".signature.p7s",[m
[32m+[m[32m        "Icon.png",[m
[32m+[m[32m        "lib/netstandard2.1/Microsoft.EntityFrameworkCore.InMemory.dll",[m
[32m+[m[32m        "lib/netstandard2.1/Microsoft.EntityFrameworkCore.InMemory.xml",[m
[32m+[m[32m        "microsoft.entityframeworkcore.inmemory.5.0.3.nupkg.sha512",[m
[32m+[m[32m        "microsoft.entityframeworkcore.inmemory.nuspec"[m
[32m+[m[32m      ][m
[32m+[m[32m    },[m
     "Microsoft.EntityFrameworkCore.Relational/5.0.3": {[m
       "sha512": "fiWf3OWsm5/8z+J3DiSMyNz2OkBjr6IvoJ/DzC6XgArDu17sHvTG3mdUC07cEUIo4n5XV5gthgdLalt/ALD6bw==",[m
       "type": "package",[m
[36m@@ -8970,6 +8996,7 @@[m
   "projectFileDependencyGroups": {[m
     "net5.0": [[m
       "Microsoft.EntityFrameworkCore >= 5.0.3",[m
[32m+[m[32m      "Microsoft.EntityFrameworkCore.InMemory >= 5.0.3",[m
       "Microsoft.EntityFrameworkCore.Sqlite >= 5.0.3",[m
       "Microsoft.EntityFrameworkCore.Sqlserver >= 5.0.3",[m
       "Microsoft.VisualStudio.Web.CodeGeneration.Design >= 5.0.2"[m
[36m@@ -9018,6 +9045,10 @@[m
             "target": "Package",[m
             "version": "[5.0.3, )"[m
           },[m
[32m+[m[32m          "Microsoft.EntityFrameworkCore.InMemory": {[m
[32m+[m[32m            "target": "Package",[m
[32m+[m[32m            "version": "[5.0.3, )"[m
[32m+[m[32m          },[m
           "Microsoft.EntityFrameworkCore.Sqlite": {[m
             "target": "Package",[m
             "version": "[5.0.3, )"[m
[1mdiff --git a/obj/project.nuget.cache b/obj/project.nuget.cache[m
[1mindex 20ae1c1..6f1e367 100644[m
[1m--- a/obj/project.nuget.cache[m
[1m+++ b/obj/project.nuget.cache[m
[36m@@ -1,6 +1,6 @@[m
 {[m
   "version": 2,[m
[31m-  "dgSpecHash": "bBqk6+xz/afCQOYe6oXx1OjOW2813YxQ/q3twdPGjeQfx+qZPJXZS6jSqlSoyNSRA/bspo7VYojAEC79P56RTg==",[m
[32m+[m[32m  "dgSpecHash": "bvlXtZToujGRJt1bSclJFIBSBfDU1CX9W2SeFGXP0XnyjmPRxxFHfxCZGFNOTgY6hCxHhWnrf/611crrTCvgtw==",[m
   "success": true,[m
   "projectFilePath": "C:\\Users\\yan-w\\source\\repos\\src\\FilmesCRUDRazor\\FilmesCRUDRazor.csproj",[m
   "expectedPackageFiles": [[m
[36m@@ -24,6 +24,7 @@[m
     "C:\\Users\\yan-w\\.nuget\\packages\\microsoft.entityframeworkcore\\5.0.3\\microsoft.entityframeworkcore.5.0.3.nupkg.sha512",[m
     "C:\\Users\\yan-w\\.nuget\\packages\\microsoft.entityframeworkcore.abstractions\\5.0.3\\microsoft.entityframeworkcore.abstractions.5.0.3.nupkg.sha512",[m
     "C:\\Users\\yan-w\\.nuget\\packages\\microsoft.entityframeworkcore.analyzers\\5.0.3\\microsoft.entityframeworkcore.analyzers.5.0.3.nupkg.sha512",[m
[32m+[m[32m    "C:\\Users\\yan-w\\.nuget\\packages\\microsoft.entityframeworkcore.inmemory\\5.0.3\\microsoft.entityframeworkcore.inmemory.5.0.3.nupkg.sha512",[m
     "C:\\Users\\yan-w\\.nuget\\packages\\microsoft.entityframeworkcore.relational\\5.0.3\\microsoft.entityframeworkcore.relational.5.0.3.nupkg.sha512",[m
     "C:\\Users\\yan-w\\.nuget\\packages\\microsoft.entityframeworkcore.sqlite\\5.0.3\\microsoft.entityframeworkcore.sqlite.5.0.3.nupkg.sha512",[m
     "C:\\Users\\yan-w\\.nuget\\packages\\microsoft.entityframeworkcore.sqlite.core\\5.0.3\\microsoft.entityframeworkcore.sqlite.core.5.0.3.nupkg.sha512",[m
