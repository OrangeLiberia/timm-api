# OrangeMoney/Transaction/Status

This method allows to check the status of a transaction.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the status of an Orange Money transaction |

## Endpoint URL

```
/TIMM/v1/OM/Transaction/Status
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/OM/Transaction/Status` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/OM/Transaction/Status` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Mock Responses

### GET — Gets the status of an Orange Money transaction

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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### GET — Gets the status of an Orange Money transaction

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Transaction/Status?auth:user=api_user&auth:pwd=api_password"
```
