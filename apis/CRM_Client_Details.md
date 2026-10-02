# CRM/Client/Details

This method returns client details and one associated account/address record using the client identifier.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns client details for the supplied `ClientID` |

## Endpoint URL

```text
/TIMM/v1/CRM/Client/Details
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://api.example.invalid/TIMM/v1/CRM/Client/Details` |
| Dev/Test | `http://api-dev.example.invalid:11000/TIMM/v1/CRM/Client/Details` |

Replace the example host with the URL for the target TIMM.API environment. Hosts, credentials, and personal details in the examples are placeholders or synthetic values.

## Authentication

Authentication credentials must be provided on every request. The verified requests use URL query parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `auth:user` | `String` | ✅ Required | API username with permission to call this endpoint |
| `auth:pwd` | `String` | ✅ Required | Password for the API username |

Use literal colons in the parameter names: `auth:user` and `auth:pwd`. URL-encode parameter **values** where necessary; do not encode the colons in these names as `%3A`.

The optional `Token` parameter does not replace these authentication credentials.

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ClientID` | `Numeric(18,0)` | ✅ Required | Client identifier, sent as a decimal string in the query. Zero is rejected |
| `Token` | `String` | ⬜ Optional | Application token, up to 1,024 characters. When omitted, the configured API action supplies an empty string; omission was verified successfully |

Send parameters directly in the query string, without the `param:` prefix. No request body is required. The API configuration supplies `UserID` from the authenticated session; callers do not need to send it.

## Processing Rules

- The response contains one client/account/address record, not a list of all the client's accounts or services.
- Client contact details, including `ClientEmail`, come from the address linked to the selected account.
- When more than one account matches, the supplied procedure uses `TOP (1)` without an ordering rule. Callers must not assume that a particular account is selected or that account selection remains stable.
- If no matching client/account record is returned, the response message is exactly `Service Not Found`.
- Always inspect `exec_code`. An HTTP `200` response can contain an application error.

## Response Fields

> Result type: **Single Object**

On success, `resultset` is one JSON object. All fields inside the observed `resultset` are JSON strings, including identifiers and numeric-looking codes. Preserve empty strings as returned; do not assume that an empty field contains a populated value.

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code; `200` indicates success |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Client details; absent in the verified error responses |
| `resultset.AccountFullName` | `String` | Name or description of the selected account |
| `resultset.AccountID` | `Numeric String` | Selected account identifier |
| `resultset.ClientAddress` | `String` | Client address associated with the selected account |
| `resultset.ClientBirthDate` | `Date-Time String` | Client birth date, observed as `YYYY-MM-DD HH:mm:ss.fff`; no time-zone offset is supplied |
| `resultset.ClientCityID` | `String` | City/locality value returned by CRM |
| `resultset.ClientCountryID` | `String` | Country value returned by CRM; an empty string was observed |
| `resultset.ClientCountyID` | `String` | County/province code returned by CRM |
| `resultset.ClientDocumentID` | `String` | Client identity-document number |
| `resultset.ClientEmail` | `String` | Email on the selected client address; an empty string was observed |
| `resultset.ClientFaxNumber` | `String` | Client fax number as returned by CRM; the sample value was `"0"` |
| `resultset.ClientFloorNumber` | `String` | Floor number on the client address |
| `resultset.ClientFullName` | `String` | Client's full name |
| `resultset.ClientID` | `Numeric String` | Client identifier |
| `resultset.ClientLotNumber` | `String` | Lot number on the client address |
| `resultset.ClientTypeDocID` | `String` | Identity-document type code |
| `resultset.ClientTypeID` | `String` | Client type code |
| `resultset.ClientTypeStreetID` | `String` | Street type code |
| `resultset.ClientZipCode` | `String` | Postal/ZIP code |
| `resultset.CurrencyID` | `String` | Account currency code |

Code descriptions and code-to-label mappings must come from the relevant CRM reference data; the sample code values do not establish those mappings.

## Responses

### GET — Returns client details

**Success Response (HTTP `200`, `exec_code: 200`):**

The example preserves the verified response structure and JSON types, with synthetic personal details and identifiers.

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "AccountFullName": "Example Client",
    "AccountID": "1000000000101",
    "ClientAddress": "Example City, Undefined",
    "ClientBirthDate": "1990-01-02 00:00:00.000",
    "ClientCityID": "1",
    "ClientCountryID": "",
    "ClientCountyID": "1",
    "ClientDocumentID": "DOC000001",
    "ClientEmail": "",
    "ClientFaxNumber": "0",
    "ClientFloorNumber": "",
    "ClientFullName": "Example Client",
    "ClientID": "1000000000001",
    "ClientLotNumber": "",
    "ClientTypeDocID": "7",
    "ClientTypeID": "5",
    "ClientTypeStreetID": "1",
    "ClientZipCode": "",
    "CurrencyID": "5"
  }
}
```

Omitting `Token` returned the same successful response for the tested client.

### GET — ClientID is zero

**Error Response (HTTP `200`, `exec_code: -1004`):**

```json
{
  "exec_code": -1004,
  "exec_msg": "The parameter ClientID cannot be zero"
}
```

### GET — ClientID is missing

**Error Response (HTTP `400`, `exec_code: -1003`):**

```json
{
  "exec_code": -1003,
  "exec_msg": "API Call is missing a parameter: CLIENTID"
}
```

### GET — No matching record

**Error Response (HTTP `200`, `exec_code: -1005`):**

```json
{
  "exec_code": -1005,
  "exec_msg": "Service Not Found"
}
```

## Error Codes

The following HTTP status and execution-code combinations were observed in the supplied tests.

| HTTP Status | Code | Message | Description |
|-------------|------|---------|-------------|
| `200` | `200` | `Success` | Client details returned, with or without `Token` |
| `200` | `-1004` | `The parameter ClientID cannot be zero` | `ClientID=0` was supplied |
| `400` | `-1003` | `API Call is missing a parameter: CLIENTID` | Required query parameter `ClientID` was omitted |
| `200` | `-1005` | `Service Not Found` | No matching client/account record was returned |

These are the verified outcomes, not an exhaustive list of authentication, authorization, or infrastructure errors.

## cURL Examples

The following examples use synthetic client IDs. Replace them with an existing test client or a confirmed absent client, as appropriate. Commands use shell line continuations; each can also be entered on one line.

### GET — Existing client with an empty Token

```bash
curl.exe --silent --show-error --include --request GET \
  --header "Accept: application/json" \
  "http://api-dev.example.invalid:11000/TIMM/v1/CRM/Client/Details?auth:user=api_user&auth:pwd=api_password&ClientID=1000000000001&Token="
```

Expected: HTTP `200`, `exec_code: 200`, with a single-object `resultset`.

### GET — ClientID is zero

```bash
curl.exe --silent --show-error --include --request GET \
  --header "Accept: application/json" \
  "http://api-dev.example.invalid:11000/TIMM/v1/CRM/Client/Details?auth:user=api_user&auth:pwd=api_password&ClientID=0&Token="
```

Expected: HTTP `200`, `exec_code: -1004`.

### GET — ClientID is missing

```bash
curl.exe --silent --show-error --include --request GET \
  --header "Accept: application/json" \
  "http://api-dev.example.invalid:11000/TIMM/v1/CRM/Client/Details?auth:user=api_user&auth:pwd=api_password&Token="
```

Expected: HTTP `400`, `exec_code: -1003`.

### GET — Client not found

```bash
curl.exe --silent --show-error --include --request GET \
  --header "Accept: application/json" \
  "http://api-dev.example.invalid:11000/TIMM/v1/CRM/Client/Details?auth:user=api_user&auth:pwd=api_password&ClientID=2000000000001&Token="
```

Expected: HTTP `200`, `exec_code: -1005`, when this client has no matching record.

### GET — Token omitted

```bash
curl.exe --silent --show-error --include --request GET \
  --header "Accept: application/json" \
  "http://api-dev.example.invalid:11000/TIMM/v1/CRM/Client/Details?auth:user=api_user&auth:pwd=api_password&ClientID=1000000000001"
```

Expected: HTTP `200`, `exec_code: 200`, with the same response shape as the request that supplies `Token`.

## Test Results

All five GET scenarios passed in the user-supplied run on 24 September 2026.

| Scenario | HTTP Status | Expected `exec_code` | Actual `exec_code` | Result |
|----------|-------------|----------------------|--------------------|--------|
| Existing client | `200` | `200` | `200` | PASS |
| ClientID is zero | `200` | `-1004` | `-1004` | PASS |
| ClientID is missing | `400` | `-1003` | `-1003` | PASS |
| Client not found | `200` | `-1005` | `-1005` | PASS |
| Token omitted | `200` | `200` | `200` | PASS |
