# Subscriber/Notification/SMS/IN/Pay

## Action Definition
This method will charge a subscriber on their telecom wallet and after a successfully charge the SMS will be sent to the Subscriber. 

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Charge Amount to a Subscriber Telecom Wallet and if successful send SMS.  |

## Endpoint URL

```
TIMM/v1/Subscriber/Notification/SMS/IN/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Notification/SMS/IN/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Notification/SMS/IN/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

| JSON Object	| auth |
|-------------|----------|

| JSON Object	| param  | | |
|-------------|----------| ---------- | ---------- | 
| Parameter Name | Data Type	| Required |	Description |
| `MSISDN` |	`String` |	Mandatory |	Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx  Or  23177xxxxxxx. Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Wallet` | `EnumString` |	Optional (restricted) | Identification of Wallet being charged: -	Main, Bonus, Extra |
| `Currency` |	`EnumString` |	Mandatory	| Identification of Wallet being charged: -	USD |
| `Amount` |	`Decimal` |	Mandatory	| Amount to be charged to Subscriber |
| `SenderID` | `String` |	Optional |	SMS Sender ID of the user sending the SMS. If not passed in default configured SenderID will be used |
| `SMS`	| `String` | Mandatory | SMS Text to be sent to the subscriber |
| `Comment` |	`String` |	Mandatory |	String that identifies the reason of charge |
| `ExternalID` | `String` |	Optional |	Reference’s to unique id of the caller transaction |



## Mock Responses

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "transactionid": "TXN20241107123456",
    "status": "Completed",
    "amount": "100.00",
    "currency": "LRD"
  }
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success |
| `200` | Success With Warning |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### GET — Get resource

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Notification/SMS/IN/Pay?auth:user=api_user&auth:pwd=api_password"
```
