# OrangeMoney/Universal/Tag

This method returning the details for a Universal Code.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the details of an Universal Code from a Tag |

## Endpoint URL

```
/TIMM/v1/OM/Universal/Tag
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/OM/Universal/Tag` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/OM/Universal/Tag` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Tag` | `String` | ✅ Required | Universal Tag read from the QR Code exec_code integer |

## Mock Responses

### GET — Returns the details of an Universal Code from a Tag

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

### GET — Returns the details of an Universal Code from a Tag

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Universal/Tag?auth:user=api_user&auth:pwd=api_password&param:Tag=<Tag>"
```
