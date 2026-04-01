# Merchant/OM/Exchange/PayStart

This method allows a Merchant to execute an exchange of eValue for a Subscribers, Agent or Merchant Orange Money wallet. The Subscriber will be notified of a Payment to Merchant initialization with the Amount and he will be requested to enter PIN to complete the action. After that action is completed money is transferred from Merchant to the Subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Merchant to transfer eValue from his Orange Money wallet to a Subscribers, |

## Endpoint URL

```
TIMM/v1/Merchant/OM/Exchange/PayStart
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/OM/Exchange/PayStart` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/OM/Exchange/PayStart` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you iniciate the payment and at the same time want to add the eValue. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `RECIPENTMSISDN` | `String` | ⬜ Optional | Phone Number on whose account will receive the payment and at the same time want to add the eValue. If parameter not supplied MSISDN will be used. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `SOURCECURRENCY` | `EnumString` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `SOURCEAMOUNT` | `Decimal` | ✅ Required | Amount to charge the subscriber |
| `SOURCEWALLET` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main or Loyalty. Default: Main |
| `DESTCURRENCY` | `String` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `DESTAMOUNT` | `String` | ✅ Required | Amount to transfer to the subscriber |
| `DESTWALLET` | `EnumString` | ⬜ Optional | Restricted Identification of Wallet being charged: |
| `EXTERNALID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `trxid` | `String` | Transaction ID |

## Mock Responses

### POST — Allows for a Merchant to transfer eValue from his Orange Money wallet to a Subscribers,

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "trxid": "sample_trxid"
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

### POST — Allows for a Merchant to transfer eValue from his Orange Money wallet to a Subscribers,

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/OM/Exchange/PayStart" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "RECIPENTMSISDN": "0777777588",
    "SOURCECURRENCY": "LRD",
    "SOURCEAMOUNT": 100.0,
    "SOURCEWALLET": "<SOURCEWALLET>",
    "DESTCURRENCY": "LRD",
    "DESTAMOUNT": 100.0,
    "DESTWALLET": "<DESTWALLET>",
    "EXTERNALID": "ID-001234"
  }
}'
```
