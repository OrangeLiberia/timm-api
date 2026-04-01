# Subscriber/External/P2P/Pay/Commit

This method will allow to commit a P2P transaction that was initiated on the CBL Gateway previously.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for an Agent to execute a P2P to another Agent |

## Endpoint URL

```
TIMM/v1/Subscriber/External/P2P/Pay/Commit
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/External/P2P/Pay/Commit` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/External/P2P/Pay/Commit` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `PayerPINENC` | `String` | ✅ Required |  |
| `Amount` | `String` | ✅ Required | Amount of air time to charge |
| `TransactionID` | `String` | ✅ Required | CBL Transaction ID that we want to commit |
| `SMSNOTIFICATION` | `String` | ✅ Required | (optional) SMS to be sent to customer on successful transfer. If parameter not |

## Mock Responses

### POST — Allows for an Agent to execute a P2P to another Agent

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

### POST — Allows for an Agent to execute a P2P to another Agent

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/External/P2P/Pay/Commit" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "PayerPINENC": "<PayerPINENC>",
    "Amount": 100.0,
    "TransactionID": "ID-001234",
    "SMSNOTIFICATION": "<SMSNOTIFICATION>"
  }
}'
```
