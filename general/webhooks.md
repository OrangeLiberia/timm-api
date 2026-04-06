# Webhooks & Callbacks

Webhooks are an extension of an API, but instead of your code requesting data from our API platform, in this case
Orange API sends the data to you. The data arrives as a web request to your application/server. A webhook may be the result of an earlier API call (this type of webhook is also called a "callback" and configured through the callback json object), such as an asynchronous request to the …PayStart API’s. 

Webhooks are also used to notify your application/server of events such as an incoming call or message.
Since the Orange servers need to be able to send data to your application via webhooks, you need to set up a webserver to receive the incoming HTTP requests. You also need to specify the URL of each webhook on your webserver so that data can be sent to each one.

With webhooks, it is important that the URL to send the webhooks to is configured. When there is data available, Orange sends the webhook/callback to your application as an HTTP request. Your application should respond with an HTTP success code to indicate that it successfully received the data.

The APIs calls listed that are asynchronous by nature those allow a callback object to be specified (object specified bellow), in those cases that a callback object is specified it will override any webhook specification, if any, that’s has been configured for that user.

| JSON Object | callback | | |
| ----------- | -------- | --- | --- |
| Parameter | Data Type | Required | Description |
| URL  | String | ✅ Required | Callback URL |
| PARAMFILTER | String Array | ⬜ Optional | List of the inbound call parameters that should be included in the notification callback. |


## Subscriber Payment Callback

This Callback/Webhook notification exists/occurs each time a Payment is executed.  

| Action definition | |
| ---------- | ----- |
| `Verb`	| POST method will be used |
| `URL`	| [Partner Provided URL] | 
| `TXNID`	| Transaction ID |
| `TXNStatus`	| Transaction Status (TF – Transaction Failed, TS – Transaction Succeeded TI – Transaction Iniciated) |
| `Param`	| JSON object dependent on Payment Event Context | 


Taking an example of a Callback configured for Billers/OTHB to the URL www.webhook.com. 

The param object will be composed of all the inbound public parameters of the original Payment event. So for the following Payment Action made on the Orange API:

```json
{ "auth":{ "user":"username", "pwd":"password" },"param": {"msisdn":"0777777788", "Amount":"10", "Currency":"USD", "OtherBillerId":"1234567" , "PayerPIN":"1234"} }" 
```

The following command represents the call will be made by Orange API subsystem:

```bash
curl -X POST 
       -data "{"TXNID":"CI121313.1121.C00002", "TXNStatus":"TS", "param": {"msisdn":"0777777788", "Amount":"10", "Currency":"USD", "OtherBillerId":"1234567" } }" 
         http://www.webhook.com
```