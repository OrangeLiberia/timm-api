# Invoicing/Invoice/Totals

This method can be called to get invoice totals for a billing period and document type.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns invoice totals |

## Endpoint URL

```
TIMM/v1/Invoicing/Invoice/Totals
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `http://192.168.19.139:11000/TIMM/v1/Invoicing/Invoice/Totals` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Invoicing/Invoice/Totals` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Period` | `String` | ✅ Required | Billing period in `YYYYMM` format |
| `DocType` | `String` | ✅ Required | Document type to filter invoice totals |

## Response Fields

> Result type: **Array**

| Field | Type | Description |
|-------|------|-------------|
| `AccounID` | `String` | Account ID returned by the invoicing system |
| `AccountName` | `String` | Account name |
| `AccountTags` | `String` | Account tags |
| `ClientName` | `String` | Client name |
| `ClienteID` | `String` | Client ID returned by the invoicing system |
| `ERPId` | `String` | ERP identifier |
| `TotalComm` | `String` | Total commission amount |
| `TotalInvoice` | `String` | Total invoice amount |

## Responses

### GET — Returns invoice totals

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": [
    {
      "AccounID": "1007100002296",
      "AccountName": "Liberia National Red Cross",
      "AccountTags": "[OFFICIAL]",
      "ClientName": "Liberia National Red Cross",
      "ClienteID": "1007100002296",
      "ERPId": "1000730",
      "TotalComm": "32.98050",
      "TotalInvoice": "87.98050"
    },
    {
      "AccounID": "1007100014900",
      "AccountName": "U.S. Embassy",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientName": "U.S. Embassy",
      "ClienteID": "1007100014900",
      "ERPId": "1000414",
      "TotalComm": "262.75840",
      "TotalInvoice": "699.05474"
    },
    {
      "AccounID": "1007100136297",
      "AccountName": "ArcelorMittal Liberia",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientName": "ArcelorMittal Liberia",
      "ClienteID": "1007100136297",
      "ERPId": "1000537",
      "TotalComm": "1056.87000",
      "TotalInvoice": "3049.55934"
    },
    {
      "AccounID": "1007100240940",
      "AccountName": "Royal Hotel",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientName": "Royal Hotel",
      "ClienteID": "1007100240940",
      "ERPId": "1000350",
      "TotalComm": "88.64500",
      "TotalInvoice": "138.81097"
    },
    {
      "AccounID": "1007100316022",
      "AccountName": "PICASSO LIBERIA",
      "AccountTags": "[OFFICIAL]",
      "ClientName": "PICASSO LIBERIA",
      "ClienteID": "1007100316022",
      "ERPId": "1000602",
      "TotalComm": ".04600",
      "TotalInvoice": ".04600"
    },
    {
      "AccounID": "1007100353293",
      "AccountName": "Ecobank",
      "AccountTags": "[OFFICIAL] FP",
      "ClientName": "Ecobank",
      "ClienteID": "1007100353293",
      "ERPId": "1000380",
      "TotalComm": ".00000",
      "TotalInvoice": "20.00000"
    },
    {
      "AccounID": "1007100369367",
      "AccountName": "JEETY TRADING Co",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientName": "JEETY TRADING Co",
      "ClienteID": "1007100369367",
      "ERPId": "1000048",
      "TotalComm": "168.40998",
      "TotalInvoice": "453.42405"
    },
    {
      "AccounID": "1007110000019",
      "AccountName": "Firestone",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientName": "Firestone",
      "ClienteID": "1007110000019",
      "ERPId": "1000424",
      "TotalComm": "2538.06210",
      "TotalInvoice": "5499.56450"
    },
    {
      "AccounID": "1007110000040",
      "AccountName": "OBT SHIPPING",
      "AccountTags": "[OFFICIAL]",
      "ClientName": "OBT SHIPPING",
      "ClienteID": "1007110000040",
      "ERPId": "1000348",
      "TotalComm": "166.60050",
      "TotalInvoice": "274.00352"
    },
    {
      "AccounID": "1007110000060",
      "AccountName": "CICA Motors Liberia Inc",
      "AccountTags": "[OFFICIAL] [FP]",
      "ClientName": "CICA Motors Liberia Inc",
      "ClienteID": "1007110000060",
      "ERPId": "1000686",
      "TotalComm": "9.43700",
      "TotalInvoice": "57.43700"
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

### GET — Returns invoice totals

```bash
curl -k -X GET \
  "http://192.168.19.139:11000/TIMM/v1/Invoicing/Invoice/Totals?auth:user=api_user&auth:pwd=api_password&param:Period=202602&param:DocType=NFT"
```
