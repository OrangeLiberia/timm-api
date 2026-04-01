# Agent/OrangeEnergy/Meter/Favorite

This method allows the agent to add their favorite Orange Energy meter numbers and tie it to an alias. The agent is allowed to add up to 3 favorite meters.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for an agent to add favorite Orange Energy meter numbers. |
| `DELETE` | Allows for an agent to remove a favorite Orange Energy meter number. |
| `GET` | List all the agent favorite LEC meters. |

## Endpoint URL

```
/TIMM/v1/Agent/OrangeEnergy/Meter/Favorite
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Agent/OrangeEnergy/Meter/Favorite` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Agent/OrangeEnergy/Meter/Favorite` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to add the favorite meter. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `MeterNumber` | `String` | ✅ Required |  |

## Mock Responses

### POST — Allows for an agent to add favorite Orange Energy meter numbers.

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

### DELETE — Allows for an agent to remove a favorite Orange Energy meter number.

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

### GET — List all the agent favorite LEC meters.

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

### POST — Allows for an agent to add favorite Orange Energy meter numbers.

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Agent/OrangeEnergy/Meter/Favorite" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "MeterNumber": "<MeterNumber>"
  }
}'
```

### DELETE — Allows for an agent to remove a favorite Orange Energy meter number.

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Agent/OrangeEnergy/Meter/Favorite?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:MeterNumber=<MeterNumber>"
```

### GET — List all the agent favorite LEC meters.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Agent/OrangeEnergy/Meter/Favorite?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:MeterNumber=<MeterNumber>"
```
