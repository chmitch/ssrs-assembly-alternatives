CREATE TABLE APIConfig
	(
	apiId varchar(50),
	apiUri varchar(50),
	apiKey varchar(1000)
	);

INSERT APIConfig VALUES
('AzureSentiment','https://westus2.api.cognitive.microsoft.com/','<keyvalue>'),
('AzureTranslate','https://api.cognitive.microsofttranslator.com',',<keyvalue>')
