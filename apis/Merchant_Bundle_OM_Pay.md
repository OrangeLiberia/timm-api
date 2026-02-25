# Merchant/Bundle/OM/Pay

This method will allow a subscriber to purchase a Bundle using his Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Add a Bundle to a Subscriber and pay through the OM Wallet |

## Endpoint URL

```
TIMM/v1/Subscriber/Bundle/OM/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Bundle/OM/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/OM/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account the Bundle should be activated on. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Currency` | `EnumString` | ✅ Required | Identification of Wallet being charged: - USD, LD |
| `BundleID` | `String` | ✅ Required | Bundle Identification that should be activated. Bundle list |
| `MerchPINENC` | `String` | ⬜ Optional | Merchant PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform (by default, PIN is not required since it’s configured on the authentication session) |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction ( Default will use Internal API Transaction ID if not passed in) |
| `Wallet` | `EnumString` | ⬜ Optional | Restricted Defines in what Wallet the action should take place: Main or Loyalty Default: Main |

## Mock Responses

### POST — Add a Bundle to a Subscriber and pay through the OM Wallet

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

### POST — Add a Bundle to a Subscriber and pay through the OM Wallet

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/OM/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "Currency": "LRD",
    "BundleID": "ID-001234",
    "MerchPINENC": "<MerchPINENC>",
    "ExternalID": "ID-001234",
    "Wallet": "<Wallet>"
  }
}'
```
