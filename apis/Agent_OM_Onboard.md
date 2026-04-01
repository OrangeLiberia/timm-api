# Agent/OM/Onboard

This method is used to an Agent onboard into one of the External systems

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Sets an Agent as onboarded. |
| `DELETE` | Removes an Agent from being onboarded. |

## Endpoint URL

```
TIMM/v1/Agent/OM/Onboard
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Agent/OM/Onboard` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Agent/OM/Onboard` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to OnBoard. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `TYPE` | `EnumString` | ✅ Required | Type of Onboarded system: [ RetailCode, AV-Microcredit ] exec_code integer >= 0 Positive values indicate that method completed with success but encountered some warnings IDs. |

## Mock Responses

### POST — Sets an Agent as onboarded.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "subscriberid": "SUB-20241107-77588",
    "msisdn": "0777777588",
    "status": "Registered"
  }
}
```

### DELETE — Removes an Agent from being onboarded.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "subscriberid": "SUB-20241107-77588",
    "msisdn": "0777777588",
    "status": "Registered"
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

### POST — Sets an Agent as onboarded.

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/OM/Onboard" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "TYPE": "<TYPE>"
  }
}'
```

### DELETE — Removes an Agent from being onboarded.

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/OM/Onboard?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:TYPE=<TYPE>"
```
