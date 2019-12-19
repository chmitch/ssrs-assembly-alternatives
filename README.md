# Paginated Reports in PaaS (Power BI Service)

In the past, customer’s deployed SQL Server Reporting Services on their local virtual machine.  Reporting services rendered their static reports and provided analytics to the organization.  A key feature for these reports was providing custom features, functions, business logic that wasn’t native to the platform.  This was accomplished thru custom assemblies where a developer wrote .NET code, compiled it and saved it to a directly on their local server.  The justification for this was to make code reusable across all reports in large enterprise deployments.  

In the Power BI Service, we can upload Paginated Reports (formally known as, Reporting Services Reports) into the service for consumption.  A database developer will use the new Power BI Report Builder to create their paginated report (canned report) and save it to the service or their local PC (file type = .rdl).  These reports are available to end-users as long as their workspace is assigned a premium capacity.  This is a key asset in the business intelligence application.  Reporting Services has been around since SQL Server 2005 and deployed across many BI solutions.

For large migrations, a number of customers perceived “custom assemblies” as a roadblock and this is the reason for this repo.  We want to ensure everyone knows this is a supported feature just needs a bit of refactoring of their custom assemblies into Azure Functions.  With Azure Functions, we can refactor the existing code set and provide a REST API endpoint for the report to call and implements the functionality needed in the reports.  This repo has a few working examples to help provide technical guidance on how-to implement it and hopefully help you better understand the use case.

There are five reports that highlight different use cases and showcase Paginated reports + Azure functions.

1.	CallAzureFunction.rdl – Simple Hello World Example
2.	JSONConverter.rdl – Develop Paginated reports reading JSON & files & converting it into tables
3.	ScoredReviews.rdl – Score product reviews
4.	TranslateReviews.rdl – Translate text into different languages

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

