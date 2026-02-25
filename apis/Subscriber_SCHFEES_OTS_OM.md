# Subscriber/SCHFEES/OTS/OM

This method will allow to get information regarding the available schools that a subscriber is able to pay school fees through Orange Money.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a Subscriber to Pay LRA Taxes and Fees |

## Endpoint URL

```
/TIMM/v1/Subscriber/SCHFEES/OTS/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/SCHFEES/OTS/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/SCHFEES/OTS/OM` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Mock Responses

### GET — Allows for a Subscriber to Pay LRA Taxes and Fees

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

### GET — Allows for a Subscriber to Pay LRA Taxes and Fees

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/SCHFEES/OTS/OM?auth:user=api_user&auth:pwd=api_password"
```
