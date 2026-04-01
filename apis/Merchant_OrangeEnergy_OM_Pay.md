# Merchant/OrangeEnergy/OM/Pay

This method will allow a Merchant to top up and Orange Energy Meter using the Orange Money merchant account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Merchant to Pay for Orange Energy |
| `DELETE` | Allows to remove a favorite Orange Energy meter number. |
| `GET` | List all the subscriber’s favorite meters. |

## Endpoint URL

```
/TIMM/v1/Merchant/OrangeEnergy/Meter/Favorite
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Merchant/OrangeEnergy/Meter/Favorite` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/OrangeEnergy/Meter/Favorite` |

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
| `SubscriptionID` | `String` | ✅ Required | Unique identifier of the account we are topping up |
| `PaymentType` | `String` | ✅ Required | SUBSCRIPTIONFEE or RECHARGING |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |

## Mock Responses

### POST — Allows for a Merchant to Pay for Orange Energy

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

### DELETE — Allows to remove a favorite Orange Energy meter number.

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

### GET — List all the subscriber’s favorite meters.

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

### POST — Allows for a Merchant to Pay for Orange Energy

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/OrangeEnergy/Meter/Favorite" \
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
    "SubscriptionID": "ID-001234",
    "PaymentType": "<PaymentType>",
    "ExternalID": "ID-001234"
  }
}'
```

### DELETE — Allows to remove a favorite Orange Energy meter number.

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/OrangeEnergy/Meter/Favorite?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:Currency=LRD&param:Amount=100.0&param:SubscriptionID=ID-001234&param:PaymentType=<PaymentType>&param:ExternalID=ID-001234"
```

### GET — List all the subscriber’s favorite meters.

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Merchant/OrangeEnergy/Meter/Favorite?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:Currency=LRD&param:Amount=100.0&param:SubscriptionID=ID-001234&param:PaymentType=<PaymentType>&param:ExternalID=ID-001234"
```
