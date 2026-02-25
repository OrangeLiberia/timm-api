# Subscriber/OrangeEnergy/Meter/Favorite

This method allows the subscriber to add their favorite meter numbers and tie it to an alias. Subscriber is allowed to add up to 3 favorite meters.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a subscriber to add favorite OrangeEnergy meter numbers. |
| `DELETE` | Allows for a subscriber to remove a favorite OrangeEnergy meter number. |
| `GET` | List all the subscribers favorite OrangeEnergy meters. |

## Endpoint URL

```
/TIMM/v1/Subscriber/
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to add the favorite Meter. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `MeterNumber` | `String` | ✅ Required |  |

## Mock Responses

### POST — Allows for a subscriber to add favorite OrangeEnergy meter numbers.

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

### DELETE — Allows for a subscriber to remove a favorite OrangeEnergy meter number.

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

### GET — List all the subscribers favorite OrangeEnergy meters.

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

### POST — Allows for a subscriber to add favorite OrangeEnergy meter numbers.

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/" \
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

### DELETE — Allows for a subscriber to remove a favorite OrangeEnergy meter number.

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:MeterNumber=<MeterNumber>"
```

### GET — List all the subscribers favorite OrangeEnergy meters.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:MeterNumber=<MeterNumber>"
```
