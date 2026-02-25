# Subscriber/Billers/OM/Pay/Offline

This method will allow a subscriber to pay a to a Biller using his Orange Money account. Previous version of this API was named: /TIMM/v1/Subscriber/Billers/OTHB/OM/Pay

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for Subscriber to pay biller partner |

## Endpoint URL

```
/TIMM/v1/Subscriber/Billers/OM/Pay/Offline
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/Billers/OM/Pay/Offline` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/Pay/Offline` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Currency` | `String` | ✅ Required | Identification of Wallet being charged: - |
| `RefNum` | `String` | ✅ Required | Reference Identifier being payed for |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |
| `SubWallet` | `String` | ⬜ Optional | Each identifier of the Sub Wallet belonging to the Biller that should be used for this transaction. Sub Wallet list is configured for each user and mapping. (WalletZ1, WalletY2,, WalletX3, … ) Payer’s PIN Payer’s PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform, and encoded into Base64. |

## Mock Responses

### POST — Allows for Subscriber to pay biller partner

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "transactionid": "TXN20241107123456",
    "status": "Completed",
    "amount": "100.00",
    "currency": "LRD"
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

### POST — Allows for Subscriber to pay biller partner

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/Pay/Offline" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "Currency": "LRD",
    "RefNum": "<RefNum>",
    "ExternalID": "ID-001234",
    "SubWallet": "<SubWallet>"
  }
}'
```
