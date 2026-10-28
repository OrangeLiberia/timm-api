# Admin/Account/Validate

This method validates an account password and its access to the specified company, branch and application.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Validate account credentials and access |

## Endpoint URL

```text
/TIMM/v1/Admin/Account/Validate
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Admin/Account/Validate` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Validate` |

All account identifiers and credentials in examples are placeholders or synthetic values.

## Authentication

The API caller must authenticate on every request and have permission to call this method. Use HTTP Basic Authentication or a JSON `auth` object in the request body.

```json
{"auth":{"user":"api_user","pwd":"api_password"}}
```

The `auth` credentials identify the API caller. `Account` and `Password` identify the account being validated. Send account passwords in the HTTPS request body.

## Request Parameters

Send the following fields inside the JSON `param` object. Use `Content-Type: application/json` and `Accept: application/json`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Account` | `String` | Required | Account login name, up to 400 UTF-16 code units. Must not be empty or contain only spaces. |
| `Password` | `String` | Required | Account password; 1 to 400 characters. Supports U+0001 through U+00FF; spaces are significant. |
| `CompanyID` | `Integer` | Required | Company identifier. |
| `BranchID` | `Integer` | Required | Branch identifier. |
| `ApplicationID` | `Integer (64-bit)` | Optional | Application identifier. Defaults to `70000000` when omitted. |

Omit optional parameters to use their defaults.

## Processing Rules

- The account must be enabled, must not be a group, and must have access to the requested company, branch and application.
- Access may be assigned directly to the account or inherited from its groups.
- Incorrect credentials, disabled accounts and insufficient access return the same validation failure.
- Success returns `AccountID` and `CompanyID`. Validation does not create a session, issue a token or record a login event.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | `200` on success; negative on failure. |
| `exec_msg` | `String` | Execution message. |
| `resultset.AccountID` | `String` | Validated account identifier; empty on failure. |
| `resultset.CompanyID` | `String` | Company whose access was validated; empty on failure. |

Check `exec_code` before using `resultset`, even when HTTP status is `200`. Authentication or request-validation errors may omit `resultset`.

## Responses

**Success Response (`exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "AccountID": "12345",
    "CompanyID": "160"
  }
}
```

**Validation Failure:**

```json
{
  "exec_code": -2401,
  "exec_msg": "Invalid credentials or account access denied.",
  "resultset": {
    "AccountID": "",
    "CompanyID": ""
  }
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Account credentials and access validated |
| `-1003` | Required request parameter missing |
| `-1004` | Request execution failed |
| `-2400` | Invalid account name, password or access scope |
| `-2401` | Invalid credentials or account access denied |
| `-2499` | Account operation failed |

## cURL Examples

### POST — Validate using the default application

```bash
curl --request POST \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Validate' \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  --data '{"auth":{"user":"api_user","pwd":"api_password"},"param":{"Account":"example.account","Password":"<account_password>","CompanyID":160,"BranchID":10}}'
```

### Request body — Validate with an explicit application

```json
{
  "auth": {"user": "api_user", "pwd": "api_password"},
  "param": {
    "Account": "example.account",
    "Password": "<account_password>",
    "CompanyID": 160,
    "BranchID": 10,
    "ApplicationID": 70000000
  }
}
```
