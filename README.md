# Paginated Reports in Power BI Service (PaaS)

In the past, customers deployed SQL Server Reporting Services on their local virtual machine (IaaS).  Reporting services rendered their static reports and provided analytics to the organization.  A key feature for these reports was providing custom features, functions, business logic that wasn’t native to the platform.  This was accomplished thru custom assemblies where a developer wrote .NET code, compiled it and saved it to a directory on their local server.  The justification for this was to make code reusable across all reports in large enterprise deployments.  

In the Power BI Service, we can upload Paginated Reports (formally known as, Reporting Services Reports) into the service for consumption.  A database developer will use the new Power BI Report Builder to create their paginated report (canned report) and save it to the service. (file type = .rdl)  These reports are available to end-users as long as their workspace is assigned a premium capacity.  This is a key asset in the business intelligence application.  Reporting Services has been around since SQL Server 2005 and deployed across many BI enviornments.

For large migrations, a number of customers perceived “custom assemblies” as a roadblock and this is the reason for this repo.  We want to ensure everyone knows this is a supported feature just needs a bit of refactoring of their custom assemblies into Azure Functions.  With Azure Functions, we can refactor the existing code set and provide a REST API endpoint for the report to call and implements the functionality needed in the reports.  This repo has a few working examples to help provide technical guidance on how-to implement it and hopefully help you better understand the use case.

There are four reports that highlight different use cases and showcase Paginated reports & Azure Functions.

1.	CallAzureFunction.rdl – Simple Hello World example to show mechanics
2.	JSONConverter.rdl – C# Azure Function to convert JSON files into tables
3.	ScoredReviews.rdl – Cognitive Service Sentiment API to rate sentiment of review
4.	TranslateReviews.rdl – Translate reviews into different languages

# Setup Instructions
Prereqs
1. Install Visual Studio 2019 https://docs.microsoft.com/en-us/visualstudio/install/install-visual-studio?view=vs-2019
    
    a. Choose SQL Server Data Tools as a workload during setup of Visual Studio Installer.  https://docs.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver15
    
    b. Add the "Microsoft Reporting Services Project" as an Extension from the Marketplace https://docs.microsoft.com/en-us/visualstudio/ide/finding-and-using-visual-studio-extensions?view=vs-2019 
    
2. Azure Subscription 
3. Power BI tenant with Power BI Pro license for developer
4. Power BI Premium Capacity to the Workspace that contains the Paginated Report

# Environment Setup
1. Setup Cognitive Services; Text API & Translate API

    a. Create a cognitive services resource in the Azure Portal.
    
    b. Navigate to the newly created service and copy the api security key for use in later configuration steps.

2. Create Azure Function App

    a. During Deployment you will publish HelloWorld.cs & JSONConverter.cs files as Functions

3. Azure SQL Database
    
    a. Create a SQL Database Service

4. App Workspace in Power BI

    a. Create a Workspace in Power BI Service to publish RDL files

5. Power BI Capacity in Azure

    a. Setup Azure Power BI Embed Capacity. A4 SKU (A4 or higher required for Paginated Reports)
    
    b. Assign workspace to Embed capacity in powerbi.com

# Code Deployment in Visual Studio
1. Publish Azure Functions

    a. Right-Click on SSRSFunction Folder in Visual Studio solution

    b. Deployment wizard will create Azure Function and Deploy code

    c. Copy URL and keys to notepad

2. Open SQL Server Management Studio and open sql files in script folder

    a. Edit CreateAPIConfigTable.sql to replace keys and URIs from notepad

    b. Run both .sql scripts on Azure SQL Database.

3. Edit connection strings for .rdl files in Visual Studio project for each report.
4. Publish .rdl files to Power BI App Workspace
5. Enter credentials for data soruce in Power BI.
6. Test out reports

