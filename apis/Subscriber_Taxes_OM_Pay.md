# Subscriber/Taxes/OM/Pay

This method will allow a subscriber to pay for its taxes using his Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to Pay for Taxes |

## Endpoint URL

```
TIMM/v1/Subscriber/Taxes/OM/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Taxes/OM/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Taxes/OM/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `BILLID` | `String` | ✅ Required | Unique BillId tax account number that the taxes is being payed |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of Wallet currency being charged: USD, LRD |
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted aka cashedout. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly |
| `AMOUNT` | `Decimal` | ✅ Required | Amount to be charged to Subscriber |
| `PAYERPIN` | `String` | ✅ Required | Payer's PIN |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing Taxes payment information |
| `resultset.TXNID` | `String` | Transaction ID |
| `resultset.RECEIPTNO` | `String` | Receipt number |
| `resultset.BANKTRXID` | `String` | Bank transaction ID |
| `resultset.ExecTxt` | `String` | Execution text returned by Taxes system |

## Responses

### POST — Allows for a Subscriber to Pay for Taxes

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "TXNID": "MP260525.1036.B32643",
    "RECEIPTNO": "1870429",
    "BANKTRXID": "13MP260525.1036.B32643",
    "ExecTxt": "success"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -1004,
  "exec_msg": "Execution failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### POST — Allows for a Subscriber to Pay for Taxes

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Taxes/OM/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "BILLID": "1003558",
    "CURRENCY": "LRD",
    "MSISDN": "0776487613",
    "AMOUNT": "500.00",
    "PAYERPIN": "<PAYERPIN>"
  }
}'
```
