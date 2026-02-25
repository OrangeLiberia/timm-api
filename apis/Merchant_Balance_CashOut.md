# Merchant/Balance/CashOut

This method will allow a Merchant to initiate a Cashout to a subscriber. The Subscriber will be notified of the Payment initialization, and he will be requested to enter PIN.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a biller partner to initiate bill payment on behalf on a Subscriber |

## Endpoint URL

```
/TIMM/v1/Merchant/Balance/Cashout
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Merchant/Balance/Cashout` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/Balance/Cashout` |

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
| `ExternalID` | `String` | ✅ Required | Reference’s to unique id of the caller transaction (optional) URL URL to an implementation of Subscriber Payment Callback/Webhook |

## Mock Responses

### POST — Allows for a biller partner to initiate bill payment on behalf on a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "balance": "250.00",
    "currency": "LRD",
    "accountNumber": "ACC-0777777588"
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

### POST — Allows for a biller partner to initiate bill payment on behalf on a Subscriber

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/Balance/Cashout" \
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
    "ExternalID": "ID-001234"
  }
}'
```
