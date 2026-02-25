# Guidelines

Guidelines
In this section we will define both the major guidelines to read the following document together with the general
guidelines to calling the different methods of the API.
As stated, before these API is largely based on REST interface principles, the only major differences is that the system
allows parameters to be passed in on an HTTP Body when performing an HTTP GET. Some HTTP stacks do not support
this action (adding a Body to an HTTP GET request) in this case scenario API users have one of two choices.
1)

All API’s are reachable and can be called using an HTTP POST to System/Redirect API.
For example for an API with the following URL: TIMM/v1/Example and the following object requirements:
{"auth":{"user":"username", "pwd":"password" },"param":{ "msisdn":"0777777588"}}
This API can be called through a query string in the following format URL:
HTTP POST to System/Redirect API with the following HTTP Body:
{"redirect":{ "url":"/TIMM/v1/Example", "verb":"GET" }
{"auth":{"user":"username", "pwd":"password" },"param":{ "msisdn":"0777777588"}}}
For more details regarding this approach please refer to System/Redirect page 132.

2)

All requests can be executed in the format of a query string without the requirement of providing an HTTP Body.
For example for an API with the following URL: TIMM/v1/Example and the following object requirements:
{"auth":{"user":"username", "pwd":"password" },"param":{ "msisdn":"0777777588"}}
This API can be called through a query string in the following query format URL:
TIMM/v1/Example?auth:user=username&auth:pwd=password&param:msisdn=0777777588

Any call performed in any method of the API is composed of 3 different calling attributes: HTTP Verb, URL and HTTP
Body. The URL identify uniquely the API being called; the HTTP Verb indicates the action being performed on the API.
Finally, the HTTP Body will include the required parameters that must be transmitted to the calling API.
Within the HTTP Body it’s expected that a valid JSON object should be present that will provide the full required
information to the API being called.
Within each API definition item within this document there are three subsections.
Action definition
Presents a general table with the general definition of the method characteristics. First it defines what types of HTTP
Verbs are supported and what their effect are. Secondly it identifies the required JSON objects that should be provided
by the caller. Finally, it specifies the URL that should be used to call the method.
Request definition
Presents one or several tables where with required objects that should be passed within the body. Usually only the
specific JSON objects are defined where general objects, for example the authentication object, are just referenced
within the action definition.
Reply definition
Presents one or several tables where the objects that are being returned by the API are defined.
Data Encryption
For some case scenarios in case of sensitive data is being sent Encryption of that data, might be required and/or
suggested. In this case scenario we employ the PKCS#7/CMS encryption (RFC 5652: Cryptographic Message Syntax
(CMS) (rfc-editor.org)) of the AES key, allow the sender to encrypt the data with the public keys provided in this
document.
MSISDN Pseudonymize
As per request MSISDN pseudonymization can be enabled for an API username. For this to work it needs to work with
in compliance with Header Enrichment.
