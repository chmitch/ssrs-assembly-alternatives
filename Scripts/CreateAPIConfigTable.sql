CREATE TABLE APIConfig
	(
	apiId varchar(50),
	apiUri varchar(500),
	apiKey varchar(1000),
	apiRegion varchar(50) NULL
	);

INSERT APIConfig VALUES
('AzureSentiment','https://eastus2.api.cognitive.microsoft.com/','ba52cee2c8254a4a95ae2d581fe7ab12',NULL),
('AzureTranslate','https://api.cognitive.microsofttranslator.com','ba52cee2c8254a4a95ae2d581fe7ab12','westus2'),
('HelloWorld','https://ssrsfunction20191219092530.azurewebsites.net/api/HelloWorld','aE9UkBuRhXP8ygafFd3lKR0c7BZo7Bq/9SpVXesrRW5ZcJCNGvR1Tw==',NULL),
('JSONConverter','https://ssrsfunction20191219092530.azurewebsites.net/api/JSONConverter','aE9UkBuRhXP8ygafFd3lKR0c7BZo7Bq/9SpVXesrRW5ZcJCNGvR1Tw==',NULL)
