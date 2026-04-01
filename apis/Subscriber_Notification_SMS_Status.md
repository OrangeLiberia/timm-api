# Subscriber/Notification/SMS/Status

This method gets the status of a SMS that was sent to a Subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the status of SMS sent by the API user. |

## Endpoint URL

```
TIMM/v1/Subscriber/Notification/SMS/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Notification/SMS/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Notification/SMS/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `SMSId` | `Integer` | ✅ Required | Reference ID for the SMS sent or an array of Reference ID . or Integer[] |

## Mock Responses

### GET — Returns the status of SMS sent by the API user.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "status": "Active",
    "msisdn": "0777777588"
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

### GET — Returns the status of SMS sent by the API user.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Notification/SMS/Status?auth:user=api_user&auth:pwd=api_password&param:SMSId=ID-001234"
```
