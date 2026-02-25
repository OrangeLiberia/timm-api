# Subscriber/Satcon/OM/PayStart

This method will allow a subscriber to buy a Satcon package using his Orange Money account. The Subscriber will be notified of the Payment initialization, and he will be requested to enter PIN.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to Pay for a package for Satcon |

## Endpoint URL

```
TIMM/v1/Subscriber/Satcon/OM/PayStart
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Satcon/OM/PayStart` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Satcon/OM/PayStart` |

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
| `AccountNumber` | `String` | ✅ Required | Unique LWSC account number that we are topping up |
| `PaymentType` | `EnumString` | ✅ Required | Type of Payment: RENEWALSUBSCRIPTION, SUBSCRIPTION |
| `PackageDuration` | `String` | ✅ Required | (one of) |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction Package Duration, if no Package Id is specified previous packaged ID is used URL URL to an implementation of Subscriber Payment Callback/Webhook |

## Mock Responses

### POST — Allows for a Subscriber to Pay for a package for Satcon

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

### POST — Allows for a Subscriber to Pay for a package for Satcon

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Satcon/OM/PayStart" \
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
    "AccountNumber": "<AccountNumber>",
    "PaymentType": "<PaymentType>",
    "PackageDuration": "<PackageDuration>",
    "ExternalID": "ID-001234"
  }
}'
```
