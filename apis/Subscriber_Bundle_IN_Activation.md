# Subscriber/Bundle/IN/Activation

This method is called to notify the API Gateway and configured listeners that a Subscriber has done a bundle activation.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Notifies the API Gateway and listeners of a Bundle Activation |

## Endpoint URL

```
/TIMM/v1/Event/Subscriber/Bundle/IN/Activation
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Event/Subscriber/Bundle/IN/Activation` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Event/Subscriber/Bundle/IN/Activation` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Mock Responses

### POST — Notifies the API Gateway and listeners of a Bundle Activation

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "bundleId": "BDL-001",
    "name": "Data Bundle 1GB",
    "status": "Active"
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

### POST — Notifies the API Gateway and listeners of a Bundle Activation

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Event/Subscriber/Bundle/IN/Activation" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  }
}'
```
