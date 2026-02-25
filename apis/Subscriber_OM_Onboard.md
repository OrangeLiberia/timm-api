# Subscriber/OM/Onboard

This method is used to an Agent onboard into one of the External systems

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Sets an Subscriber as onboarded. |
| `DELETE` | Removes an Subscriber from being onboarded. |

## Endpoint URL

```
TIMM/v1/Subscriber/OM/Onboard
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/OM/Onboard` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OM/Onboard` |

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

### POST — Sets an Subscriber as onboarded.

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

### DELETE — Removes an Subscriber from being onboarded.

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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### POST — Sets an Subscriber as onboarded.

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OM/Onboard" \
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

### DELETE — Removes an Subscriber from being onboarded.

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OM/Onboard?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:TYPE=<TYPE>"
```
