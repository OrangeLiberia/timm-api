# Agent/Balance/OM

This method provides the Agent the Orange Money Balance for a specific Wallet.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get the current eValue for his Orange Money wallet. |

## Endpoint URL

```
TIMM/v1/Agent/Balance/OM
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Agent/Balance/OM` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Balance/OM` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `Currency` | `EnumString` | ✅ Required | Identification of Wallet being queried: USD, LD |
| `Wallet` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main or Loyalty Default: Main |

## Mock Responses

### GET — Get the current eValue for his Orange Money wallet.

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "balance": "250.00",
    "currency": "LRD",
    "accountNumber": "ACC-0777777588"
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

### GET — Get the current eValue for his Orange Money wallet.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Balance/OM?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:Currency=LRD&param:Wallet=<Wallet>"
```
