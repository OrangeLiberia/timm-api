# Subscriber/Billers/OM/Offline

This method will allow to get information regarding the biller products details a subscriber is able to activate through Orange Money. Previous version of this API was named: /TIMM/v1/Subscriber/Billers/OTHB/OM

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a Subscriber to view biller products |

## Endpoint URL

```
/TIMM/v1/Subscriber/Billers/OM/Offline
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/Billers/OM/Offline` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/Offline` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `BilerType` | `EnumString` | ⬜ Optional | Type of Biller being requested: - |

## Mock Responses

### GET — Allows for a Subscriber to view biller products

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

### GET — Allows for a Subscriber to view biller products

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/Offline?auth:user=api_user&auth:pwd=api_password&param:BilerType=<BilerType>"
```
