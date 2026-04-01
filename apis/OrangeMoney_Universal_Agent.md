# OrangeMoney/Universal/Agent

This method returning the details for a Universal Code.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the details of the Universal Code for the Agent |

## Endpoint URL

```
/TIMM/v1/OM/Universal/Agent
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/OM/Universal/Agent` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/OM/Universal/Agent` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to register. Phone number can have a size of either 10 or 12 digits. Application might by restricted to the following ranges: 077xxxxxx Or 23177xxxxxxx |

## Mock Responses

### GET — Returns the details of the Universal Code for the Agent

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

### GET — Returns the details of the Universal Code for the Agent

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/OM/Universal/Agent?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588"
```
