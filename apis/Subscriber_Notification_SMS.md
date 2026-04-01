# Subscriber/Notification/SMS

This method allows to send a SMS to a Subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Sends the subscriber an SMS |

## Endpoint URL

```
TIMM/v1/Subscriber/Notification/SMS
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Notification/SMS` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Notification/SMS` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| JSON Object	| auth |
|-------------|----------|

| JSON Object	| param  | | |
|-------------|----------| ---------- | ---------- | 
| Parameter Name | Data Type	| Required |	Description |
| MSISDN |	String |	Mandatory |	Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx  Or  23177xxxxxxx. Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `SENDERID` | `String` | ⬜ Optional | SMS Sender ID of the user sending the SMS. If not passed in default configured SenderID will be used |
| `SMS` | `String` | ✅ Required | SMS Text to be sent to the subscriber |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `id` | `Integer` | Reference ID for the SMS sent. |
| `msisdn` | `String` | Phone Number associated to reference id. Success Example: |

## Mock Responses

### POST — Sends the subscriber an SMS

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "id": 1,
    "msisdn": "0777777588"
  }
}
```

### POST — Sends multiple subscribers an SMS
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "id": 1,
    "msisdn": ["0777777588", "0777777599", "0777777100"....]
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

### POST — Sends the subscriber an SMS

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Notification/SMS" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "SENDERID": "ID-001234",
    "SMS": "<SMS>"
  }
}'
```
