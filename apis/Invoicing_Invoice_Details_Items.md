# Invoicing/Invoice/Details/Items

This method returns itemized invoice usage charges for an account and billing period, grouped into service headers with nested details.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns invoice detail items grouped by service |

## Endpoint URL

```text
/TIMM/v1/Invoicing/Invoice/Details/Items
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://api.example.invalid/TIMM/v1/Invoicing/Invoice/Details/Items` |
| Dev/Test | `https://api-dev.example.invalid:11003/TIMM/v1/Invoicing/Invoice/Details/Items` |

Replace the reserved example host with the approved TIMM.API server. Credentials, account identifiers, subscriber names and numbers in examples are placeholders or synthetic data.

This page describes `TIMM_INVOICING.API.GetInvoiceDetails`, the supplied route configuration, and the local TIMM.API serializer. **No live HTTP result for this endpoint has been supplied.** Response examples are illustrative, not captured responses; deployment, HTTP status mappings and deployed serialization remain to be verified.

## Authentication

Send API credentials through query parameters, as in the supplied cURL tests:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `auth:user` | `String` | Required | API username with permission for this endpoint |
| `auth:pwd` | `String` | Required | Password for the API username |

Keep the colons in `auth:user` and `auth:pwd` literal. URL-encode parameter values where necessary, but do not encode these colons as `%3A`. Use HTTPS and avoid sharing URLs containing credentials. No application `Token` is part of this contract.

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Period` | `String(6)` | Required | Billing period in `YYYYMM` format, for example `202603`. Must resolve to an available billing cycle |
| `AccountID` | `Numeric(18,0)` | Required | Account identifier. Send its full decimal representation as a query value |
| `Lang` | `String(2)` | Optional | SQL language setting. Omission uses `En`; the procedure handles `En` and `Fr`. This does not guarantee translation of stored descriptions |
| `DocType` | `String(3)` | Optional | Invoice document type. Omission uses `NFT` |

Send these parameters directly in the query string, **without** a `param:` prefix. No request body is required. Use `Accept: application/json`.

The route configuration explicitly marks `Lang` and `DocType` optional. Omit optional parameters to use the defaults. Do not send `ServiceID`, `GlobalID`, `DocNumber`, `Currency` or a payment amount: these are not inputs to this endpoint.

## Processing Rules

- Resolve `Period` to its billing cycle and billing database. A missing cycle or database returns `exec_code: -210` with `Billing cycle period not found`.
- Select records matching the account, billing cycle and document type, then join their service and priceable-item identifiers to the billed usage records. This is an itemized usage view, not a list of every invoice charge or a payment-status query.
- Group results by `ServiceID`, `MSISDN` and `SubscriberName`. Each distinct combination produces one header.
- `TotalValue` is `SUM(Value)` for that group, with SQL type `decimal(18,5)`. The source `Value` comes from `CDRsPostPaid.rateValue` and is not repeated in each returned detail.
- Detail `RateValueOriginal` and `RateValue` both come from `CDRsPostPaid.FinalValue`; `RateValue` is converted to `decimal(18,5)` before formatting as text. **Do not assume that summing detail `RateValue` reproduces `TotalValue`, or that `TotalValue` is the full invoice total.**
- Return the remaining 13 item fields inside `Details`. The procedure emits native XML attributes; the local API serializer converts them into JSON objects in an array, not an escaped XML string.
- Null item-field values become empty strings. Preserve the field spelling `ChargedUnitsFormated` exactly as returned.
- Headers are ordered by `SubscriberName`, then `ServiceID`. Details are ordered by start time, then a temporary row identifier; equal-time ordering is not guaranteed to remain stable across calls.
- No matching usage rows returns `exec_code: -200` with `Not Found`, rather than a successful empty list. This does not by itself prove that the account or invoice does not exist.
- Inspect `exec_code` independently of HTTP status. No pagination, currency conversion or invoice payment action is implemented by this procedure.

## Response Fields

> Result type: **Single Object or Array**, containing service headers and nested detail arrays.

The local database-action serializer returns one service as a `resultset` object and multiple services as a `resultset` array. Consumers should handle both forms. The `resultset[]` notation below describes a service record in the multi-service form; for a single service, the same fields are directly under `resultset`.

Non-XML result values and XML attributes are serialized as JSON strings by the inspected source, including numeric-looking identifiers and amounts. A non-empty `Details` value is an array even when it contains one item. These behaviors must still be checked against the deployed API.

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | Integer | Application execution code; `200` indicates success |
| `exec_msg` | String | Application execution message |
| `resultset` | Object or Object Array | One service header or a collection of service headers on success; absent in the illustrative errors |
| `resultset[].ServiceID` | String | Service identifier, converted to `varchar(30)` by the procedure |
| `resultset[].MSISDN` | String | Subscriber number for the service; preserve the returned format |
| `resultset[].SubscriberName` | String | Subscriber name associated with the service |
| `resultset[].TotalValue` | Decimal String | Sum of source `Value` for the service group, with five decimal places |
| `resultset[].Details` | Object Array | Itemized usage records converted from native SQL XML |
| `resultset[].Details[].PriceableItemID` | String | Priceable-item identifier |
| `resultset[].Details[].PriceableItemDesc` | String | Priceable-item description |
| `resultset[].Details[].PriceableItemGroup` | String | Priceable-item group description |
| `resultset[].Details[].A_MSISDN` | String | Calling number from the usage record |
| `resultset[].Details[].B_MSISDN` | String | Called number from the usage record |
| `resultset[].Details[].DateTimeStartCall` | Date-Time String | Usage start time formatted as `YYYY-MM-DD HH:mm:ss`; no time-zone offset is supplied |
| `resultset[].Details[].DateTimeEndCall` | Date-Time String | Usage end time formatted as `YYYY-MM-DD HH:mm:ss`; no time-zone offset is supplied |
| `resultset[].Details[].ChargeableUnits` | Numeric String | Source call duration in seconds |
| `resultset[].Details[].ChargedUnits` | Numeric String | Charged units calculated from the billing interval and call duration |
| `resultset[].Details[].ChargedUnitsFormated` | String | Formatted units returned by the billing function; spelling preserved from the API |
| `resultset[].Details[].BillingPeriod` | Numeric String | Rating/billing interval from the rate table, not the request's `YYYYMM` period |
| `resultset[].Details[].RateValueOriginal` | Decimal String | Source `FinalValue` converted directly to text |
| `resultset[].Details[].RateValue` | Decimal String | Source `FinalValue` converted through `decimal(18,5)` to text |

Do not infer a currency from these fields: this endpoint does not return a currency identifier.

## Responses

All examples below are **illustrative**. They preserve the source-defined names and anticipated serialization; they do not establish live HTTP status codes or prove that the deployed API has the same behavior.

### GET — One service with two detail items

**Success Response (`exec_code: 200`; HTTP status unverified):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ServiceID": "1000000000201",
    "MSISDN": "231770000001",
    "SubscriberName": "Example Subscriber",
    "TotalValue": "2.50000",
    "Details": [
      {
        "PriceableItemID": "101",
        "PriceableItemDesc": "Example voice usage",
        "PriceableItemGroup": "Voice",
        "A_MSISDN": "231770000001",
        "B_MSISDN": "231770000002",
        "DateTimeStartCall": "2026-03-05 10:00:00",
        "DateTimeEndCall": "2026-03-05 10:01:00",
        "ChargeableUnits": "60",
        "ChargedUnits": "1",
        "ChargedUnitsFormated": "00:01:00",
        "BillingPeriod": "60",
        "RateValueOriginal": "1.00000",
        "RateValue": "1.00000"
      },
      {
        "PriceableItemID": "101",
        "PriceableItemDesc": "Example voice usage",
        "PriceableItemGroup": "Voice",
        "A_MSISDN": "231770000001",
        "B_MSISDN": "231770000003",
        "DateTimeStartCall": "2026-03-06 11:00:00",
        "DateTimeEndCall": "2026-03-06 11:02:00",
        "ChargeableUnits": "120",
        "ChargedUnits": "2",
        "ChargedUnitsFormated": "00:02:00",
        "BillingPeriod": "60",
        "RateValueOriginal": "1.50000",
        "RateValue": "1.50000"
      }
    ]
  }
}
```

For multiple services, `resultset` contains an array of complete service objects with the same fields. The example units and amounts are synthetic and are not a specification of the billing functions or tariffs.

### GET — Billing cycle unavailable

**Error Response (`exec_code: -210`; HTTP status unverified):**

```json
{
  "exec_code": -210,
  "exec_msg": "Billing cycle period not found"
}
```

### GET — No matching detail items

**Error Response (`exec_code: -200`; HTTP status unverified):**

```json
{
  "exec_code": -200,
  "exec_msg": "Not Found"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Success: matching itemized usage records were found |
| `-210` | Billing cycle period not found: no cycle mapping or the corresponding database is unavailable to the procedure |
| `-200` | Not Found: no matching detail rows for the requested filters |
| `-1003` | Expected API-layer rejection when a required parameter is missing; the supplied test expects this code, but endpoint-specific HTTP evidence is pending |

The first three codes come directly from the procedure. Authentication failures, malformed numeric values and other framework/database failures have not been captured for this endpoint; their precise messages and HTTP status codes are not asserted here.

## cURL Examples

The following commands use PowerShell syntax and `curl.exe`. Replace the example account and hosts before testing. `api_user` and `api_password` are placeholders, not usable credentials; URL-encode their replacement values.

### GET — Required parameters only

Omission of `Lang` and `DocType` uses `En` and `NFT` respectively.

```powershell
curl.exe --silent --show-error --include --request GET `
  --header 'Accept: application/json' `
  'https://api-dev.example.invalid:11003/TIMM/v1/Invoicing/Invoice/Details/Items?auth:user=api_user&auth:pwd=api_password&Period=202603&AccountID=1000000000101'
```

### GET — Explicit language and document type

```powershell
curl.exe --silent --show-error --include --request GET `
  --header 'Accept: application/json' `
  'https://api-dev.example.invalid:11003/TIMM/v1/Invoicing/Invoice/Details/Items?auth:user=api_user&auth:pwd=api_password&Period=202603&AccountID=1000000000101&Lang=Fr&DocType=NFT'
```

### GET — Unavailable period

Use a period confirmed absent from the target environment. `190001` is only an example; the expected application code is `-210` when its cycle/database is unavailable.

```powershell
curl.exe --silent --show-error --include --request GET `
  --header 'Accept: application/json' `
  'https://api-dev.example.invalid:11003/TIMM/v1/Invoicing/Invoice/Details/Items?auth:user=api_user&auth:pwd=api_password&Period=190001&AccountID=1000000000101'
```

### GET — Required AccountID omitted

The supplied test expects API-layer `exec_code: -1003` before procedure execution.

```powershell
curl.exe --silent --show-error --include --request GET `
  --header 'Accept: application/json' `
  'https://api-dev.example.invalid:11003/TIMM/v1/Invoicing/Invoice/Details/Items?auth:user=api_user&auth:pwd=api_password&Period=202603'
```

## Test Evidence and Pending Scenarios

Documentation and explorer checks are static checks, not database execution or HTTP tests. Existing cURL scripts cover success, unavailable period and missing `AccountID`; no results for this endpoint have been supplied.

| Scenario | Expected behavior / verification needed |
|----------|-----------------------------------------|
| Existing account with usage | `200`; service headers with the 13 documented item fields |
| One service versus multiple services | Confirm deployed object-versus-array behavior and scalar serialization |
| One item versus multiple items | Confirm `Details` remains an array and is not XML text |
| Optional fields omitted | `Lang=En` and `DocType=NFT` defaults reach the procedure |
| Explicit optional fields | Confirm the requested document-type filter and language behavior |
| Unavailable cycle/database | `-210`, `Billing cycle period not found` |
| Available cycle with no matching usage | `-200`, `Not Found` |
| Missing Period or AccountID | Expected API-layer `-1003`; capture exact message and HTTP status |
| Missing/invalid credentials or route permission | Capture framework rejection; do not infer a code from other endpoints |

For invoice-level totals and payment fields, use the separate [Invoice Details API](Invoicing_Invoice_Details.md). This itemized endpoint does not replace that API.
