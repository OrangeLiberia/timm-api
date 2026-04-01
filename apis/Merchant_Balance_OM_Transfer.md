# Merchant/Balance/OM/Transfer

This method allows a Merchant to transfer eValue from his Orange Money wallet to a Subscribers, Agent or Merchant Orange Money wallet.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Merchant to transfer eValue from his Orange Money wallet to a Subscribers, |

## Endpoint URL

```
TIMM/v1/Merchant/Balance/OM/Transfer
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/Balance/OM/Transfer` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM/Transfer` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to add the eValue. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `TOS` | `EnumString` | ⬜ Optional | Identification of the type of subscriber: SUBS, MERCH, AGENT Default: SUBS |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `AMOUNT` | `Decimal` | ✅ Required | Amount |
| `WALLET` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main or Loyalty Default: Main |
| `SUBWALLET` | `String` | ⬜ Optional | Each identifier of the Sub Wallet belonging to the Biller that should be used for this transaction. Sub Wallet list is configured for each user and mapping. (WalletZ1, WalletY2,, WalletX3, … ) |
| `MERCHPINENC` | `String` | ⬜ Optional | Merchant PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform. (by default, PIN is not required since it’s configured on the authentication session) |
| `SMSNOTIFICATION` | `String` | ⬜ Optional | SMS to be sent to customer on successful transfer. (limit to 160 characters) SMSDISPLAYNAME EXTERNALID If only DisplayName is provided the following standard SMS will be sent: {Txn} Confirmed. You have sent {amount}{currency} to |
| `{displayName} on {date,Time}` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |

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
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/Balance/OM/Transfer" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "TOS": "<TOS>",
    "CURRENCY": "LRD",
    "AMOUNT": 100.0,
    "WALLET": "<WALLET>",
    "SUBWALLET": "<SUBWALLET>",
    "MERCHPINENC": "<MERCHPINENC>",
    "SMSNOTIFICATION": "<SMSNOTIFICATION>",
    "{displayName} on {date,Time}": "2024-11-07"
  }
}'
```
