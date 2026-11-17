namespace TerraParadise.Worker;

public class Worker(ILogger<Worker> logger) : BackgroundService
{
    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        logger.LogInformation("TerraParadise worker is ready; no scheduled jobs are configured.");
        await Task.Delay(Timeout.Infinite, stoppingToken);
    }
}
