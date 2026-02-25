# SIMREG/Agent/Authenticate

This method authenticates if the pair IMEI and ICCI is allowed to use the SIMREG application.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Executes a simulation for an item base |

## Endpoint URL

```
/TIMM/v1/SIMREG/Agent/Authenticate
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/SIMREG/Agent/Authenticate` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Agent/Authenticate` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ⬜ Optional | MSISDN of the agent’s device Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `AppVersion` | `Integer` | ✅ Required | Application version exec_code integer |

## Mock Responses

### POST — Executes a simulation for an item base

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "status": "Active",
    "iccid": "892310700000000780"
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

### POST — Executes a simulation for an item base

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/SIMREG/Agent/Authenticate" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "AppVersion": 1
  }
}'
```
