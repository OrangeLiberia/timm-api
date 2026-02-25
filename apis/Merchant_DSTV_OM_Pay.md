# Merchant/DSTV/OM/Pay

This method will allow a merchant and activate a DSTV product using their merchant Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Merchant to pay a DSTV product |

## Endpoint URL

```
TIMM/v1/Merchant/DSTV/OM/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Merchant/DSTV/OM/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/DSTV/OM/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Currency` | `String` | ✅ Required | Identification of Wallet being charged: - USD |
| `Amount` | `String` | ⬜ Optional | Expected amount to be charged the merchant account. Product Amount * Number of Months |
| `DSTVSmartCardId` | `String` | ✅ Required | DSTV Smart Card were product should be activated. |
| `DSTVProductCode` | `String` | ✅ Required | DSTV Product Code that needs to be activated |
| `NumberMonths` | `Integer` | ✅ Required | Number of Months Activating |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |
| `RecipentMSISDN` | `String` | ⬜ Optional | Recipient Phone Number on whose account the RecipientID should be associated with and will receive the SMS. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |

## Mock Responses

### POST — Allows for a Merchant to pay a DSTV product

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

### POST — Allows for a Merchant to pay a DSTV product

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Merchant/DSTV/OM/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "Currency": "LRD",
    "Amount": 100.0,
    "DSTVSmartCardId": "ID-001234",
    "DSTVProductCode": "<DSTVProductCode>",
    "NumberMonths": 1,
    "ExternalID": "ID-001234",
    "RecipentMSISDN": "0777777588"
  }
}'
```
