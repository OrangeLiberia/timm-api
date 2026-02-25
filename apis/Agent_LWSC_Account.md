# Agent/LWSC/Account

This method will allows to obtain the details of a agent on LWSC system.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Agent to Pay LEC |

## Endpoint URL

```
TIMM/v1/Agent/LWSC/Account
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Agent/LWSC/Account` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Agent/LWSC/Account` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `AccountNumber` | `String` | ✅ Required | Unique identifier of the Meter we are topping up |

## Mock Responses

### POST — Allows for a Agent to Pay LEC

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "actionid": "ACT-20241107-001234"
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

### POST — Allows for a Agent to Pay LEC

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/LWSC/Account" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "AccountNumber": "<AccountNumber>"
  }
}'
```
