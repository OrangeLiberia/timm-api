# Subscriber/Points

This method registers a subscriber in the Points program or returns Points user details.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Registers a Points user |
| `GET` | Returns Points user details |

## Endpoint URL

```
TIMM/v1/Subscriber/Points
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Points` |
| Dev/Test | `http://apidev.orange.com.lr:11000/TIMM/v1/Subscriber/Points` |

Replace the example host with the base URL for the target TIMM.API environment. Run related `POST` and `GET` calls against the same environment when validating a registration.

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## `POST` Request Parameters

The `POST` request sends its parameters inside the JSON `param` object.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Type` | `String(16)` | ✅ Required | Points program or category identifier |
| `MSISDN` | `String(9)` | ✅ Required | Subscriber number used by this integration |
| `Name` | `String(500)` | ✅ Required | Name associated with the Points registration |

### Request Body

```json
{
  "param": {
    "Type": "TEST",
    "MSISDN": "770000001",
    "Name": "Points Test User"
  }
}
```

## `GET` Request Parameters

The `GET` parameters are passed directly in the query string without the `param:` prefix.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Type` | `String(16)` | ✅ Required | Points program or category identifier |
| `MSISDN` | `String(9)` | ✅ Required | Subscriber number whose Points details are requested |

## Processing Rules and Observed Behavior

- A successful `POST` returns the standard execution fields without a `resultset`.
- The intended `GET` contract selects records by the supplied `Type` and `MSISDN` and returns an array.
- The supplied `POST` and `GET` examples targeted different server addresses, so they do not prove same-environment read-after-write behavior.
- The supplied `GET` response also contained a record whose `Type` and `MSISDN` did not match the requested filters. Until same-environment testing proves otherwise, clients should validate every returned row instead of assuming the response is filtered.

## Response Fields

### Common Fields

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |

### `GET` Result Fields

> Result type: **Array**

| Field | Type | Description |
|-------|------|-------------|
| `resultset` | `Object Array` | Points user records returned by the lookup |
| `resultset[].MSISDN` | `String` | Subscriber number stored in the Points record |
| `resultset[].Name` | `String` | Name associated with the Points record |
| `resultset[].Points` | `Numeric String` | Current Points balance serialized as a string |
| `resultset[].RegistrationDate` | `DateTime String` | Registration timestamp formatted as `YYYY-MM-DD HH:mm:ss` |
| `resultset[].Type` | `String` | Points program or category identifier |

## Responses

### POST — Register a Points user

**Success Response (`exec_code: 0`):**

```json
{
  "exec_code": 0,
  "exec_msg": "Success"
}
```

### GET — Return Points user details

**Observed Success Response (`exec_code: 0`, sanitized):**

The example remains intentionally multi-row because the supplied response contained both an unrelated record and the requested test record.

```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": [
    {
      "MSISDN": "770000010",
      "Name": "Example Points User",
      "Points": "1",
      "RegistrationDate": "2026-09-09 00:00:00",
      "Type": "EASPORTS"
    },
    {
      "MSISDN": "770000001",
      "Name": "Points Test User",
      "Points": "0",
      "RegistrationDate": "2026-09-09 18:07:00",
      "Type": "TEST"
    }
  ]
}
```

## Error Codes

| Code | HTTP Verb | Description |
|------|-----------|-------------|
| `0` | `POST`, `GET` | Successful execution in the supplied examples |
| `-1003` | `POST`, `GET` | A required parameter is missing; this is a configured test expectation, not a response captured in the supplied examples |

The registration procedure can return additional business codes. Those codes and messages were not supplied and are therefore not documented here.

## cURL Examples

### POST — Register a Points user

```bash
curl.exe --silent --show-error --request POST \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  --data-binary "@curl-tests/generated/subscriber-points-post-success.json" \
  "https://api-url:11003/TIMM/v1/Subscriber/Points?auth:user=api_user&auth:pwd=api_password"
```

### GET — Return Points user details

```bash
curl.exe --silent --show-error --request GET \
  --header "Accept: application/json" \
  "https://api-url:11003/TIMM/v1/Subscriber/Points?Type=TEST&MSISDN=770000001&auth:user=api_user&auth:pwd=api_password"
```
