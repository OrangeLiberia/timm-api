# OSE/Account

This method will provides information regarding the current subscription assigned to the account and the account details

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows to obtain the available for sale for Orange Energy |

## Endpoint URL

```
TIMM/v1/OSE/Account
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/OSE/Account` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/OSE/Account` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `SubscriptionID` | `String` | ✅ Required | Subscriber account number |

## Mock Responses

### GET — Allows to obtain the available for sale for Orange Energy

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

### GET — Allows to obtain the available for sale for Orange Energy

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/OSE/Account?auth:user=api_user&auth:pwd=api_password&param:SubscriptionID=ID-001234"
```
