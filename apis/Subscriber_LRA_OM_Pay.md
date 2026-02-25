# Subscriber/LRA/OM/Pay

This method will allow a subscriber to pay LRA Taxes using his Orange Money account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Allows for a Subscriber to Pay LRA Taxes and Fees |

## Endpoint URL

```
TIMM/v1/Subscriber/OM/LRA/Pay
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/OM/LRA/Pay` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OM/LRA/Pay` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Payer Phone Number on whose account the money should be deducted. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted X-MSISDN header can be passed in directly. |
| `Currency` | `String` | ✅ Required | Identification of Wallet being charged: - |
| `PayerTIN` | `String` | ✅ Required | Unique number identifying the Tax payer |
| `TaxPaymentType` | `String` | ✅ Required | Type of Payment Payer’s PIN Payer’s PIN encrypted using public-key cryptography, making use of the certificate of the corresponding platform, and encoded into Base64. |
| `TaxServiceType` | `String` | ✅ Required | TAX, NONTAX Identification of the type of tax being payed: - CIT, WHT, PIT,…. (see ServiceType table below) |
| `TaxPeriodYear` | `String` | ⬜ Optional | Identification of the Year. |
| `TaxPeriod` | `String` | ✅ Required | Tax period to pay for - PPA (Annual Tax Period) PPQ (Quarterly Tax Period) PPM (Monthly Tax Period) |
| `TaxPeriodDetail` | `String` | ✅ Required | Tax period detail information that depends on the TaxPeriod value. Please see TaxPeriodDetail table below for specification on all possible combinations. |
| `TaxRecipient` | `String` | ⬜ Optional | Reference’s to TIN for which the Taxes are being payed for. |
| `ExternalID` | `String` | ⬜ Optional | Reference’s to unique id of the caller transaction |

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
| `>= 0` | Success (positive = warnings) |
| `-10` | System Exception / Body Parse Failed |
| `-11` | API does not exist |
| `-12` | Authorization failed |
| `-13` | Missing required parameter |
| `-100` | Subscriber Blocked / Not found |
| `-200` | Network Element error |

## cURL Examples

### POST — Allows for a Subscriber to Pay LRA Taxes and Fees

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/OM/LRA/Pay" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "Currency": "LRD",
    "PayerTIN": "<PayerTIN>",
    "TaxPaymentType": "<TaxPaymentType>",
    "TaxServiceType": "<TaxServiceType>",
    "TaxPeriodYear": "<TaxPeriodYear>",
    "TaxPeriod": "<TaxPeriod>",
    "TaxPeriodDetail": "<TaxPeriodDetail>",
    "TaxRecipient": "<TaxRecipient>",
    "ExternalID": "ID-001234"
  }
}'
```
