# Subscriber/BNB/Outbound/OM/PayStart

This method will allow a subscriber to start a BNB Outbound payment to one Subscribers using his Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to Pay to another Subscriber. |

## Endpoint URL

```
/TIMM/v1/Subscriber/BNB/Outbound/OM/PayStart
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003//TIMM/v1/Subscriber/BNB/Outbound/OM/PayStart` |
| Dev/Test   | `https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/BNB/Outbound/OM/PayStart` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Currency` | `String` | ✅ Required | Identification of Wallet being charged: - USD, LD Wallet |
| `Enum` | `String` | ⬜ Optional | Defines in what Wallet the action should take place: Main, Commission or Loyalty Default: Main |
| `Amount` | `Decimal` | ✅ Required | Amount to be charged to Subscriber |
| `RecipentMSISDN` | `String` | ⬜ Optional | Recipient Phone Number on whose account the equal amount will be transferred to. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx RecipentCountryCode Enum String |
| `RecipentName` | `String` | ⬜ Optional | The receiver full name (lastname firstname) – |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction exec_code integer >= 0 Positive values indicate that method completed with success but encountered some warnings IDs. |

## Mock Responses

### POST — Allows for a Subscriber to Pay to another Subscriber.

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

### POST — Allows for a Subscriber to Pay to another Subscriber.

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr//TIMM/v1/Subscriber/BNB/Outbound/OM/PayStart" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "Currency": "LRD",
    "Enum": "<Enum>",
    "Amount": 100.0,
    "RecipentMSISDN": "0777777588",
    "RecipentName": "John Doe",
    "ExternalID": "ID-001234"
  }
}'
```
