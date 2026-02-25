# Agent/OM/P2P

This method will allow an agent to do P2P to another Agent.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for an Agent to execute a P2P to another Agent |

## Endpoint URL

```
TIMM/v1/Agent/OM/P2P
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Agent/OM/P2P` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Agent/OM/P2P` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `PayerPINENC` | `String` | ✅ Required | Agent PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform, and encoded into Base64. |
| `Currency` | `EnumString` | ✅ Required | Identification of Wallet being charged: |
| `Amount` | `String` | ✅ Required | Amount of air time to charge |
| `SourceWallet` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main, Commission or Loyalty Default: Main |
| `DestWallet` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main, Commission or Loyalty Default: Main |
| `RecipentMSISDN` | `String` | ✅ Required | Recipient Phone Number on whose the amount should be transferred to. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction - USD, LD |

## Mock Responses

### POST — Allows for an Agent to execute a P2P to another Agent

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

### POST — Allows for an Agent to execute a P2P to another Agent

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/OM/P2P" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "PayerPINENC": "<PayerPINENC>",
    "Currency": "LRD",
    "Amount": 100.0,
    "SourceWallet": "<SourceWallet>",
    "DestWallet": "<DestWallet>",
    "RecipentMSISDN": "0777777588",
    "ExternalID": "ID-001234"
  }
}'
```
