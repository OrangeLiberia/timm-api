# Invoicing/Invoice/Details

This method can be called to get invoice details for a billing period, document type, and account.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns invoice details |

## Endpoint URL

```
TIMM/v1/Invoicing/Invoice/Details
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Invoicing/Invoice/Details` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Invoicing/Invoice/Details` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Period` | `String` | ✅ Required | Billing period in `YYYYMM` format |
| `DocType` | `String` | ✅ Required | Document type to filter invoice details |
| `AccountID` | `String` | ✅ Required | Account ID returned by the invoicing system |
| `PriorityAccountId` | `Numeric(18,0)` | Optional | Priority account ID. Default: `NULL` |
| `Lang` | `String(2)` | Optional | Language code used to return invoice details. Default: `En` |
| `Tax` | `Decimal(10,5)` | Optional | Tax rate used to calculate VAT. Default: `0.18` |

## Response Fields

> Result type: **Array**

| Field | Type | Description |
|-------|------|-------------|
| `AccountID` | `String` | Account ID returned by the invoicing system |
| `AccountName` | `String` | Account name |
| `AccountTags` | `String` | Account tags |
| `ClientID` | `String` | Client ID returned by the invoicing system |
| `ClientName` | `String` | Client name |
| `Communications` | `String` | Communications amount |
| `DocID` | `String` | Invoice document ID |
| `ERPDocId` | `String` | ERP document ID |
| `ERPId` | `String` | ERP identifier |
| `ExpirationDate` | `String` | Invoice expiration date in `YYYY-MM-DD` format |
| `InvoiceDate` | `String` | Invoice date in `YYYY-MM-DD` format |
| `MSISDN` | `String` | Subscriber MSISDN |
| `Month` | `String` | Invoice month |
| `MonthlyFees` | `String` | Monthly fees amount |
| `MonthlyVPN` | `String` | Monthly VPN amount |
| `Period` | `String` | Billing period in `YYYYMM` format |
| `ProfilePlanDesc` | `String` | Subscriber profile plan description |
| `SubscriberName` | `String` | Subscriber name |
| `Total` | `String` | Total invoice amount |
| `TotalWithVAT` | `String` | Total invoice amount with VAT |
| `VASOthers` | `String` | VAS and other services amount |
| `VAT` | `String` | VAT amount |
| `VATPercentage` | `String` | VAT percentage applied |
| `Value` | `String` | Invoice detail value for the subscriber |

## Responses

### GET — Returns invoice details

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": [
    {
      "AccountID": "1007100014900",
      "AccountName": "U.S. Embassy",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientID": "1007100014900",
      "ClientName": "U.S. Embassy",
      "Communications": "13,428.25",
      "DocID": "1020260213166",
      "ERPDocId": "",
      "ERPId": "1000414",
      "ExpirationDate": "2026-04-29",
      "InvoiceDate": "2026-03-02",
      "MSISDN": "231776018918",
      "Month": "FEBRUARY",
      "MonthlyFees": "13,799.00",
      "MonthlyVPN": "0.00",
      "Period": "202602",
      "ProfilePlanDesc": "USD Credit Control (-150)",
      "SubscriberName": "U.S. Embassy",
      "Total": "699.05474",
      "TotalWithVAT": "699.05",
      "VASOthers": "23,627.21",
      "VAT": "106.64",
      "VATPercentage": "0.18",
      "Value": "4.83"
    },
    {
      "AccountID": "1007100014900",
      "AccountName": "U.S. Embassy",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientID": "1007100014900",
      "ClientName": "U.S. Embassy",
      "Communications": "13,428.25",
      "DocID": "1020260213166",
      "ERPDocId": "",
      "ERPId": "1000414",
      "ExpirationDate": "2026-04-29",
      "InvoiceDate": "2026-03-02",
      "MSISDN": "231775279769",
      "Month": "FEBRUARY",
      "MonthlyFees": "13,799.00",
      "MonthlyVPN": "0.00",
      "Period": "202602",
      "ProfilePlanDesc": "USD Credit Control (-150)",
      "SubscriberName": "Customer N75279769",
      "Total": "699.05474",
      "TotalWithVAT": "699.05",
      "VASOthers": "23,627.21",
      "VAT": "106.64",
      "VATPercentage": "0.18",
      "Value": "0.23"
    }
  ]
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

### GET — Returns invoice details

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Invoicing/Invoice/Details?auth:user=api_user&auth:pwd=api_password&param:Period=202602&param:DocType=NFT&param:AccountID=1007100014900"
```

### GET — Returns invoice details with optional parameters

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Invoicing/Invoice/Details?auth:user=api_user&auth:pwd=api_password&param:Period=202602&param:DocType=NFT&param:AccountID=1007100014900&param:Lang=En&param:Tax=0.18"
```
