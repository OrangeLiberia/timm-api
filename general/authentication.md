# Authentication

The system mandates that the caller must authenticate itself on each call. This information will be validated against the
authentication module to grant or not access to the system. This is a generic object definition that is used by most of
the API’s.
All the API’s that require authentication refer has an example that the authentication object is required to passed in
the HTTP Body. Passing the authentication information has an HTPP basic authentication is also supported:

JSON Object

auth

Parameter Name

Data

Way

Description

Type
User

String

Input

User name to be provided.

Pwd

String

Input

Password to be provided.

The authentication parameters can be provided to the API in 3 different methods, they can be provided as a JSON
object on the HTTP Body in the format:
{"auth":{"user":"username", "pwd":"password" }
They can also be provided within the URL itself:
POST http[s]://[URL]?auth:user=username&auth:pwd=password&….
Finally, authentication information can be passed in as a HTTP Basic Authentication.
