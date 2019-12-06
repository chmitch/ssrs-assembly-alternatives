# ssrs-assembly-alternatives
Samples demonstrating callign external web apis for report custom logic that would normally have been done in a local asembly.  This addresses custom logic for Power BI Paginated Reports

# Outline on setup process
Prerequisites...
1. You need VS2019.
1. You need sql data tools

Things to create...
1. Cognitive Services Capacity in Azure
1. Power BI Capacity in Azure
1. App Workspace in Power BI
1. Azure SQL Database
1. Azure Function App

Things to configure...
1. Publish Azure Functions
1. Assign Power BI Capacity to Power BI App Workspace
1. Edit CreateAPIConfigTable.sql to include necessary keys and URIs for Congnitive Services and Azure Function app.
1. Run both .sql scripts on Azure SQL Database.
1. Edit connection strings for .rdl files in Visual Studio project for each report.
1. Publish .rdl files to Power BI App Workspace.
1. Enter credentials for data soruce in Power BI.

