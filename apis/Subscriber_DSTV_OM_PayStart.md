# Subscriber/DSTV/OM/PayStart

This method will allow a subscriber to pay and activate a DSTV product with his Orange Money account. The Subscriber will be notified of the Payment initialization and he will be requested to enter PIN.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to Pay LRA Taxes and Fees |

## Endpoint URL

```
TIMM/v1/Subscriber/DSTV/OM/PayStart
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/DSTV/OM/PayStart` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/DSTV/OM/PayStart` |

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
| `DSTVSmartCardId` | `String` | ✅ Required | DSTV Smart Card were product should be activated. |
| `DSTVAccountNumber` | `String` | ✅ Required | DSTV Account Number |
| `DSTVProductCode` | `String` | ✅ Required | DSTV Product Code that needs to be activated |
| `NumberMonths` | `Integer` | ✅ Required | Number of Months Activating |
| `ExternalID` | `String` | ✅ Required | Reference’s to unique id of the caller transaction |

## Mock Responses

### POST — Allows for a Subscriber to Pay LRA Taxes and Fees

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

### POST — Allows for a Subscriber to Pay LRA Taxes and Fees

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/DSTV/OM/PayStart" \
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
    "DSTVSmartCardId": "ID-001234",
    "DSTVAccountNumber": "<DSTVAccountNumber>",
    "DSTVProductCode": "<DSTVProductCode>",
    "NumberMonths": 1,
    "ExternalID": "ID-001234"
  }
}'
```
