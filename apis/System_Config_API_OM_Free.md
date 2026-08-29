# System/Config/API/OM/Free

This method can be called to return the free Orange Money API configuration resource.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the free Orange Money API configuration |

## Endpoint URL

```
TIMM/v1/System/Config/API/OM/Free
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/System/Config/API/OM/Free` |
| Dev/Test   | `http://192.168.19.139:11000/TIMM/v1/System/Config/API/OM/Free` |

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

This API does not require endpoint-specific request parameters.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing API configuration information |
| `resultset.Config` | `Object` | Object containing free Orange Money API configuration |
| `resultset.Config.BILLERWALLET` | `String` | Biller Wallet configuration resource |
| `resultset.Config.MERCHWALLLET` | `String` | Merchant Wallet configuration resource |

## Responses

### GET — Returns the free Orange Money API configuration

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "Config": {
      "BILLERWALLET": "OM-WALLET-0779612009",
      "MERCHWALLLET": "OM-WALLET-0779612009"
    }
  }
}
```

**Configuration Not Available Response (`exec_code: 2002`):**
```json
{
  "exec_code": 2002,
  "exec_msg": "No OM configuration resource is available"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Success |
| `2002` | No OM configuration resource is available |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error |

## cURL Examples

### GET — Returns the free Orange Money API configuration

```bash
curl -k --silent --show-error -X GET \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/OM/Free?auth:user=api_user&auth:pwd=api_password" \
  -H "Accept: application/json"
```
