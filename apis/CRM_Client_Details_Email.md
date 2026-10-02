# CRM/Client/Details/Email

This method updates the email address on one CRM client address and returns the previous and current values.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `PUT` | Updates the email of one address belonging to the supplied client |

## Endpoint URL

```text
/TIMM/v1/CRM/Client/Details/Email
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Client/Details/Email` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Client/Details/Email` |

Replace the example host with the target TIMM.API server. Credentials, identifiers, and email addresses in examples are placeholders or synthetic values.

## Authentication

The verified requests supply authentication through query parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `auth:user` | `String` | ✅ Required | API username authorized to call this endpoint |
| `auth:pwd` | `String` | ✅ Required | Password for the API username |

Keep the colons in `auth:user` and `auth:pwd` literal; URL-encode their values when necessary. Do not put authentication credentials inside `param`. No application `Token` was supplied in the verified PUT requests.

## Request Parameters

Send a JSON body with the fields inside a top-level `param` object. Use `Content-Type: application/json` and `Accept: application/json`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `param.ClientID` | `Numeric(18,0)` | ✅ Required | Positive client identifier. Decimal strings were used successfully |
| `param.Email` | `String` | ✅ Required | New, non-empty email address. The procedure trims leading/trailing spaces and limits the value to 200 encoded bytes, or the address column capacity if smaller |
| `param.ClientAddressID` | `Numeric(18,0)` | ⬜ Conditional | Positive CRM address identifier belonging to this client. May be omitted when exactly one address belongs to the client; required to select an address when several exist |

The optional-address selection rule and size limit above come from the current stored procedure. Explicit address selection and ambiguous-address rejection were not exercised in the supplied HTTP test run. `ClientAddressID` is not `AccountID`; obtain it from the client's CRM address records.

### Request — Client with one address

```json
{
  "param": {
    "ClientID": "1000000000001",
    "Email": "new.email@example.invalid"
  }
}
```

### Request — Explicit address selection

```json
{
  "param": {
    "ClientID": "1000000000001",
    "ClientAddressID": "1",
    "Email": "new.email@example.invalid"
  }
}
```

This second request illustrates the configured optional parameter; it is not a claim that the explicit-address scenario was tested live.

## Processing Rules

- This is a persistent update, not a preview. Use a disposable test client for write tests.
- The procedure targets one address in `TbccClientesEnderecos`, using the client identifier and, when provided, the address identifier.
- In the observed API behavior, an absent `Email` or `Email: ""` is rejected by the API parameter layer with HTTP `400` / `exec_code: -1003`. An empty string cannot be used to clear an email.
- A non-empty malformed email reaches the procedure and returns HTTP `200` / `exec_code: -1008`.
- Repeating the same valid update returned success. On the repeat, `PreviousEmail` equaled `ClientEmail`; success does not imply the text changed.
- Inspect `exec_code` even when HTTP status is `200`.
- The related [GET client-details endpoint](CRM_Client_Details.md) selects an account-linked address. It does not list all client addresses and must not be assumed to verify a different address selected by `ClientAddressID`.

## Response Fields

> Result type: **Single Object**

The observed response has a single `resultset` object, not an array. All four fields inside it are JSON strings. The current response does **not** include `RowsUpdated`.

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code; `200` indicates success |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Update result, or the procedure's error result. Absent in the observed API-layer `-1003` responses |
| `resultset.ClientAddressID` | `String` | Updated address identifier on success; empty string in the observed procedure errors |
| `resultset.ClientEmail` | `String` | Persisted email on success; empty string in the observed procedure errors |
| `resultset.ClientID` | `String` | Client identifier; echoed in the observed procedure errors, including `"0"` |
| `resultset.PreviousEmail` | `String` | Email before this update on success; empty string in the observed procedure errors |

Empty email fields on an error response do not mean that the stored email was cleared.

## Responses

Examples preserve the observed messages, response shapes, and JSON types, with synthetic identifiers and email addresses.

### PUT — Update email

**Success Response (HTTP `200`, `exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ClientAddressID": "1",
    "ClientEmail": "new.email@example.invalid",
    "ClientID": "1000000000001",
    "PreviousEmail": "api.test@example.invalid"
  }
}
```

### PUT — Repeat the same email

**Success Response (HTTP `200`, `exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ClientAddressID": "1",
    "ClientEmail": "new.email@example.invalid",
    "ClientID": "1000000000001",
    "PreviousEmail": "new.email@example.invalid"
  }
}
```

### PUT — ClientID missing

**Error Response (HTTP `400`, `exec_code: -1003`):**

```json
{
  "exec_code": -1003,
  "exec_msg": "API Call is missing a parameter: CLIENTID"
}
```

### PUT — Email missing or empty

**Error Response (HTTP `400`, `exec_code: -1003`):**

This response was returned both when `Email` was omitted and when it was explicitly `""`.

```json
{
  "exec_code": -1003,
  "exec_msg": "API Call is missing a parameter: EMAIL"
}
```

### PUT — ClientID is zero

**Error Response (HTTP `200`, `exec_code: -1004`):**

```json
{
  "exec_code": -1004,
  "exec_msg": "ClientID and any supplied ClientAddressID must be positive.",
  "resultset": {
    "ClientAddressID": "",
    "ClientEmail": "",
    "ClientID": "0",
    "PreviousEmail": ""
  }
}
```

### PUT — Invalid, non-empty email

**Error Response (HTTP `200`, `exec_code: -1008`):**

```json
{
  "exec_code": -1008,
  "exec_msg": "Email must be a non-empty email address.",
  "resultset": {
    "ClientAddressID": "",
    "ClientEmail": "",
    "ClientID": "1000000000001",
    "PreviousEmail": ""
  }
}
```

### PUT — Email too long

**Error Response (HTTP `200`, `exec_code: -1009`):**

```json
{
  "exec_code": -1009,
  "exec_msg": "Email exceeds the supported length.",
  "resultset": {
    "ClientAddressID": "",
    "ClientEmail": "",
    "ClientID": "1000000000001",
    "PreviousEmail": ""
  }
}
```

### PUT — Client not found

**Error Response (HTTP `200`, `exec_code: -1005`):**

```json
{
  "exec_code": -1005,
  "exec_msg": "Client not found.",
  "resultset": {
    "ClientAddressID": "",
    "ClientEmail": "",
    "ClientID": "2000000000001",
    "PreviousEmail": ""
  }
}
```

## Error Codes

### Observed HTTP outcomes

| HTTP Status | Code | Message | Condition |
|-------------|------|---------|-----------|
| `200` | `200` | `Success` | Email updated, including a repeat with the same value |
| `400` | `-1003` | `API Call is missing a parameter: CLIENTID` | `ClientID` omitted |
| `400` | `-1003` | `API Call is missing a parameter: EMAIL` | `Email` omitted or an empty string |
| `200` | `-1004` | `ClientID and any supplied ClientAddressID must be positive.` | `ClientID=0` |
| `200` | `-1008` | `Email must be a non-empty email address.` | Non-empty malformed email |
| `200` | `-1009` | `Email exceeds the supported length.` | Email exceeds the supported capacity |
| `200` | `-1005` | `Client not found.` | Unknown client identifier |

### Additional procedure-defined outcomes — not tested in the supplied HTTP run

| Code | Message | Condition |
|------|---------|-----------|
| `-1005` | `Client address not found.` | Client exists but the requested address does not match |
| `-1007` | `Multiple addresses match. Supply a unique ClientAddressID.` | Address selection is ambiguous |
| `-1006` | `Internal API error` | Procedure execution or persistence verification failed |

HTTP statuses and complete response bodies for these additional outcomes remain unverified. Authentication and infrastructure errors are not exhaustively covered by this page.

## cURL Examples

```powershell
curl.exe --silent --show-error --include --request PUT --header "Accept: application/json" --header "Content-Type: application/json" --data-binary "@update-client-email.json" "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Client/Details/Email?auth:user=api_user&auth:pwd=api_password"
```

