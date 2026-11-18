# Dependencias entre proyectos

| Proyecto | Referencias |
|---|---|
| TerraParadise.Domain | Ninguna |
| TerraParadise.Application | Domain |
| TerraParadise.Data | Ninguna referencia a proyectos; contiene el modelo de persistencia generado por EF Core |
| TerraParadise.Infrastructure | Application, Domain, Data |
| TerraParadise.Api | Application, Infrastructure |
| TerraParadise.Worker | Application, Infrastructure |
| Domain.Tests | Domain |
| Application.Tests | Application |
| Infrastructure.Tests | Infrastructure |
| Api.Tests | API |
| TerraParadise.Web | Independiente (Angular) |

Las referencias entre los proyectos .NET se verifican en `TerraParadise.sln`; las pruebas de Domain y Application comprueban que no se invierta la dirección arquitectónica.
