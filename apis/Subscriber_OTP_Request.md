# Subscriber/OTP/Request

This method causes a One Time Password to be generated, this OTP will be sent to the subscriber via SMS. The method will return an OTP ID to the caller that should be used as the ID on the validation procedure.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Sends the subscriber a One Time Pin |

## Endpoint URL

```
TIMM/v1/Subscriber/OTP/Request
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/OTP/Request` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OTP/Request` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account that will receive the OTP. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `SENDERID` | `String` | ✅ Required | (optional) SMS Sender ID of the user sending the SMS. If not passed in default configured SenderID will be used |
| `PRESMS` | `String` | ✅ Required | (optional) SMS Text to be added to the SMS being sent to the subscriber |

## Mock Responses

### POST — Sends the subscriber a One Time Pin

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "reference": "OTP-REF-2024-001234",
    "status": "Sent"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
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

### POST — Sends the subscriber a One Time Pin

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OTP/Request" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "SENDERID": "ID-001234",
    "PRESMS": "<PRESMS>"
  }
}'
```
