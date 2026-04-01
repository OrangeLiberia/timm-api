# Subscriber/Billers/OM/PayStart

This method will allow a subscriber to start the payment on the billers. A request is sent to the Orange Money subscriber informing of the charge. The Subscriber will be notified of the Payment initialization and he will be requested to enter PIN. Previous version of this API was named: /TIMM/v1/Subscriber/Billers/OTHB/OM/PayStart

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a biller partner to initiate bill payment on behalf on a Subscriber |

## Endpoint URL

```
/TIMM/v1/Subscriber/Billers/OM/PayStart
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/Billers/OM/PayStart` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/PayStart` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Currency` | `String` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `Amount` | `Decimal` | ✅ Required | Amount to be charged to Subscriber |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |
| `SubWallet` | `String` | ⬜ Optional | Each identifier of the Sub Wallet belonging to the Biller that should be used for this transaction. Sub Wallet list is configured for each user and mapping. (WalletZ1, WalletY2,, WalletX3, … ) URL URL to an implementation of Subscriber Payment Callback/Webhook |

## Mock Responses

### POST — Allows for a biller partner to initiate bill payment on behalf on a Subscriber

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

### POST — Allows for a biller partner to initiate bill payment on behalf on a Subscriber

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/Billers/OM/PayStart" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "Currency": "LRD",
    "Amount": 100.0,
    "ExternalID": "ID-001234",
    "SubWallet": "<SubWallet>"
  }
}'
```
