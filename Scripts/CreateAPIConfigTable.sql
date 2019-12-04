CREATE TABLE APIConfig
	(
	apiId varchar(50),
	apiUri varchar(50),
	apiKey varchar(1000),
	apiRegion varchar(50) NULL
	);

INSERT APIConfig VALUES
('AzureSentiment','https://westus2.api.cognitive.microsoft.com/','<keyvalue>',NULL),
('AzureTranslate','https://api.cognitive.microsofttranslator.com',',<keyvalue>','westus2'),
('HelloWorld','<fn url>','<keyvalue>',NULL)
