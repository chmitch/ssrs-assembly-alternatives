# Paginated Reports in Power BI Service (PaaS)

In the past, customers deployed SQL Server Reporting Services on their local virtual machine (IaaS).  Reporting services rendered their static reports and provided analytics to the organization.  A key feature for these reports was providing custom features, functions, business logic that wasn’t native to the platform.  This was accomplished thru custom assemblies where a developer wrote .NET code, compiled it and saved it to a directory on their local server.  The justification for this was to make code reusable across all reports in large enterprise deployments.  

In the Power BI Service, we can upload Paginated Reports (formally known as, Reporting Services Reports) into the service for consumption.  A database developer will use the new Power BI Report Builder to create their paginated report (canned report) and save it to the service. (file type = .rdl)  These reports are available to end-users as long as their workspace is assigned a premium capacity.  This is a key asset in the business intelligence application.  Reporting Services has been around since SQL Server 2005 and deployed across many BI enviornments.

For large migrations, a number of customers perceived “custom assemblies” as a roadblock and this is the reason for this repo.  We want to ensure everyone knows this is a supported feature just needs a bit of refactoring of their custom assemblies into Azure Functions.  With Azure Functions, we can refactor the existing code set and provide a REST API endpoint for the report to call and implements the functionality needed in the reports.  This repo has a few working examples to help provide technical guidance on how-to implement it and hopefully help you better understand the use case.

There are four reports that highlight different use cases and showcase Paginated reports & Azure Functions.

1.	CallAzureFunction.rdl – Simple Hello World example to show mechanics
2.	JSONConverter.rdl – C# Azure Function to convert JSON files into tables
3.	ScoredReviews.rdl – Cognitive Service Sentiment API to rate sentiment of review
4.	TranslateReviews.rdl – Translate reviews into different languages

# IDE Setup Instructions
Prereqs
1. Install Visual Studio 2019 https://docs.microsoft.com/en-us/visualstudio/install/install-visual-studio?view=vs-2019
    
    a. Choose "Data Storage and Processing" workload during installation of Visual Studio.  https://docs.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver15#changes-in-ssdt-for-visual-studio-2019
    
    b. Add the "Microsoft Reporting Services Project" as an Extension from the Marketplace https://docs.microsoft.com/en-us/visualstudio/ide/finding-and-using-visual-studio-extensions?view=vs-2019 

    c. Optional -- Install the Analysis Services and Integration Services extensions.
    
# Azure Setup
1. Setup Cognitive Services

<<<<<<< HEAD
    a. Click on "Create a Resource" and search for "Cognitive Services".  Create this service and assign it to the same resource group as all services you create for this project.  The pricing tier should be S0.
    
    b. At completion of deployment, Go to Quick Start and copy the keys and endpoints in Step 1.  Copy Key 1 to notepad and endpoint.  You will use these values in the CreateAPIConfigTable.sql script.

2. Create Azure Function App

    a. Create a single Azure Function.  Define the runtime stack as .NET CORE, Operating System as Windows and Plan as Consumption.  Leave all other settings as defaults.
=======
    a. Create a cognitive services resource in the Azure Portal.
    
    b. Navigate to the newly created service and copy the api security key for use in later configuration steps.

2. Create Azure Function App

    a. During Deployment you will publish HelloWorld.cs & JSONConverter.cs files as Functions
>>>>>>> 6d786883a37e8ea758826cc6aedbb5bb0730dcf0

3. Azure SQL Database
    
    a. Create a SQL Database Service.  Use the default settings and this will setup a General Purpose SQL Database without Elastic Pool. It will be a Gen 5 w/ 2 vcores and 32GB storage.

4. App Workspace in Power BI

    a. Create a Workspace in Power BI Service to publish RDL files (Requires a Pro license)

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

<<<<<<< HEAD
3. Edit connection strings for .rdl files in Power BI Report Builder for each report
4. Open each report and "Save AS" to Power BI Service.
=======
3. Edit connection strings for .rdl files in Visual Studio project for each report.
4. Publish .rdl files to Power BI App Workspace
>>>>>>> 6d786883a37e8ea758826cc6aedbb5bb0730dcf0
5. Enter credentials for data soruce in Power BI.
6. Test out reports

