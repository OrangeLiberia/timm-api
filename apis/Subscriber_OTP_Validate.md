# Subscriber/OTP/Validate

This method will validate if the PIN matches a previous OTP request. It will only return a successful code if the PIN matches.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Validates the Subscriber Against the OTP Pin |

## Endpoint URL

```
TIMM/v1/Subscriber/OTP/Validate
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/OTP/Validate` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OTP/Validate` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `PIN` | `String` | ✅ Required | One Time Pin introduced by Subscriber |
| `OTPID` | `Integer` | ✅ Required | Reference to the OTP ID |

## Mock Responses

### POST — Validates the Subscriber Against the OTP Pin

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

### POST — Validates the Subscriber Against the OTP Pin

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OTP/Validate" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "PIN": "<PIN>",
    "OTPID": "ID-001234"
  }
}'
```
