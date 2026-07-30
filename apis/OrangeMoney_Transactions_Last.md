# OrangeMoney/Transactions/Last

This method allows the Subscriber to obtain their last Orange Money transactions.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the last Orange Money transactions for a Subscriber. |

## Endpoint URL

```
TIMM/v1/OM/Transactions/Last
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/OM/Transactions/Last` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/OM/Transactions/Last` |

## Authentication

Authentication credentials must be provided on every request as a JSON `auth` object in the request body.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number whose last Orange Money transactions will be returned. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `CURRENCY` | `EnumString` | ✅ Required | Identification of the Orange Money wallet being queried: USD, LRD. |
| `PAYERPIN` | `String` | ✅ Required | Orange Money PIN used to authorize the request. |

## Response Fields

> Result type: **Array**

| Field | Type | Description |
|-------|------|-------------|
| `TRXID` | `String` | Orange Money transaction identifier. |
| `EVAL` | `String` | Transaction evaluation result: `OK-ROLLBACK` transaction can be rolledback `NOOK-ROLLBACK` transaction can't be rolledback   |
| `FROMTO` | `String` | MSISDN of the other party in the transaction. |
| `AMOUNT` | `String` | Transaction amount. |
| `SERVICE` | `String` | Orange Money service used for the transaction. |
| `WALLET` | `String` | Wallet affected by the transaction. |
| `STATUS` | `String` | Orange Money transaction status. |
| `TXNMODE` | `String` | Transaction mode identifier. This field may be omitted by the Orange Money platform. |
| `TXNTYPE` | `String` | Transaction type: `DR` for debit or `CR` for credit. |

## Mock Responses

### GET — Gets the last Orange Money transactions for a Subscriber.

**Success Response (`exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "TRANSACTIONS": [
      {
        "TRXID": "MP260701.2136.B74921",
        "EVAL": "NOOK-ROLLBACK",
        "FROMTO": "0779917225",
        "AMOUNT": "1.25",
        "SERVICE": "MERCHPAY",
        "WALLET": "MAIN",
        "STATUS": "TS",
        "TXNMODE": "1709701",
        "TXNTYPE": "DR"
      },
      {
        "TRXID": "CI260724.1051.B18368",
        "EVAL": "NOOK-ROLLBACK",
        "FROMTO": "0779737155",
        "AMOUNT": "1.00",
        "SERVICE": "CASHIN",
        "WALLET": "MAIN",
        "STATUS": "TS",
        "TXNTYPE": "CR"
      }
    ]
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
| `-2000` | General Error / Execution Error |

## cURL Examples

### GET — Gets the last Orange Money transactions for a Subscriber.

```bash
curl -k -X GET \
  "https://192.168.19.200:11003/TIMM/v1/OM/Transactions/Last" \
  -H "Content-Type: application/json" \
  --data '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "CURRENCY": "USD",
    "PAYERPIN": "0000"
  }
}'
```
