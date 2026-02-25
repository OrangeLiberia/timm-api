# PRV/OM/Suspend

This method allows barring or unbarring of Subscriber and Channel user wallets.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Bar’s the Subscriber on Orange Money. |
| `DELETE` | Unbar’s the Subscriber on Orange Money. |

## Endpoint URL

```
TIMM/v1/PRV/Service/OM/Barring
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/PRV/Service/OM/Barring` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/OM/Barring` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to activate. The package 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of Wallet being queried: USD, LD |
| `USERTYPE` | `EnumString` | ✅ Required | Identification of the type of user: - |
| `BARRINGDIRECTION` | `EnumString` | ✅ Required | Identification of the barring direction: - |
| `REMARK` | `String` | ✅ Required | CHANNEL, CUSTOMER, SUBSCRIBER BOTH, SENDER, RECEIVER Comment for the reason of barring |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `ActionID` | `String` | Reference to the action within the provisioning ID |

## Mock Responses

### POST — Bar’s the Subscriber on Orange Money.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "ActionID": "ACT-20241107-001234"
  }
}
```

### DELETE — Unbar’s the Subscriber on Orange Money.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "ActionID": "ACT-20241107-001234"
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

### POST — Bar’s the Subscriber on Orange Money.

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/OM/Barring" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "LRD",
    "USERTYPE": "<USERTYPE>",
    "BARRINGDIRECTION": "<BARRINGDIRECTION>",
    "REMARK": "<REMARK>"
  }
}'
```

### DELETE — Unbar’s the Subscriber on Orange Money.

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/TIMM/v1/PRV/Service/OM/Barring?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:CURRENCY=LRD&param:USERTYPE=<USERTYPE>&param:BARRINGDIRECTION=<BARRINGDIRECTION>&param:REMARK=<REMARK>"
```
