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

2. Install Power BI Report Builder https://www.microsoft.com/en-us/download/details.aspx?id=58158

3. Install SQL Server Management Studio https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15 

    
# Azure Setup
1. Setup Cognitive Services

    a. Click on "Create a Resource" and search for "Cognitive Services".  Create this service and assign it to the same resource group as all services you create for this project.  The pricing tier should be S0.
    
    b. At completion of deployment, Go to Quick Start and copy the keys and endpoints to notepad.  You will use these values in the CreateAPIConfigTable.sql script.

2. Azure SQL Database
    
    a. Create a SQL Database Service.  Use the default settings and this will setup a General Purpose SQL Database without Elastic Pool. It will be a Gen 4 w/ 1 vcores and 10GB storage. (Ensure the "Allow Azure Services" setting is ON in the firewall settings)

3. App Workspace in Power BI

    a. Create a Workspace in Power BI Service to publish RDL files (Requires a Pro license).

4. Power BI Capacity in Azure

    a. Setup Azure Power BI Embed Capacity. A4 SKU (A4 or higher required for Paginated Reports)
    
    b. Assign workspace to Embed capacity in powerbi.com

# Code Deployment
1. Create Azure Function App

    a. Open Visual Studio project "ssrs-assembly-alternatives".  
    
    b. Hover over "SSRSFunction" project folder and right-click on Publish.  Pick a publish target "Azure Function Consumption Plan" and create new.  First step will be to create an App Service Plan.  Fill in the five parameters for your enviroment.  
    
    c. After it completes, publish the Azure Functions to the service.  
    
    d. Go to Azure Portal and click on Azure Function.  Copy the URL and key to notepad.  You will use these values in the CreateAPIConfigTable.sql script.

2. Open SQL Server Management Studio and open sql files in script folder

    a. Login to SQL Server Management Studio to execute a SQL Script on the database.  Open "CreateAPIConfigTable.sql" script in the "scripts" folder and replace parameters with the values from the notepad.  Ensure you add the region for each service. (Ensure to add your local IP to the firewall to ensure you are able to login to service.)

    b. Open "CreateReviewsDB.sql" in the "scripts" folder.  Execute this script in the database you provisioned.  This will create the review table.

3. Open Power BI Report Builder or Visual Studio.

    a. In Visual Studio, open the SSRS Reports project.  Open the folder Reports and right click on each RDL file.  Click on "View Designer" to open rdl file in designer.  On Report Navigation menu go to data sources and update data source to SQL Database connection string from earlier setup.

    b. In Power BI Report Builder, Open each report file.  Navigate the "Report Data" window and modify the Data Source properities.  Update the connection string to the database name from the earlier setup.

4. Open Web Browser and login to Power BI Service.  

    a. Navigate to the workspace created earlier in this setup.

    b. Click on the "Get Data" menu option in the lower left hand side of the screen.  Choose "Files" from the right hand side of the screen under "Create New Content".  

    c. Click on Local Files and navigate to the directory where the SSRSReports are stored.  Click on one report and click open to publish report to workspace.  Do this for each report.

    d. Go back into the workspace and click on "Reports" tab.  Hover over the first action "Manage" for each report listed in the workspace.  Update the Data source credentials by clicking Edit Credentials.  You will want Authentication method to be "Basic" and input user name and password based on setup of environment.  

# Test out Paginated Reports
1. Click on one of the reports and input the parameters to test out reports.  Have fun(ction)!!
