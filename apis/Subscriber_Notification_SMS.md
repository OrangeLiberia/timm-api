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

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
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
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "id": 1,
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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

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
