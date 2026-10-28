# Admin/Account/Login

This method validates an account's credentials and access, then records the login attempt.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Validate and record an account login attempt |

## Endpoint URL

```text
/TIMM/v1/Admin/Account/Login
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Admin/Account/Login` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Login` |

All identifiers and credentials in examples are synthetic or placeholders.

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
| `LoginWindows` | `String` | Optional | Windows login reported by the caller. |
| `MachineName` | `String` | Optional | Machine name reported by the caller. |
| `OsVersion` | `String` | Optional | Operating-system version. |
| `ApplicationName` | `String` | Optional | Application name. |
| `ModuleName` | `String` | Optional | Module name. |
| `ModuleVersion` | `String` | Optional | Module version. |

Omit optional parameters to use their defaults. Event metadata is optional, defaults to empty text, and must fit the configured field lengths.

## Processing Rules

- The account must be enabled, must not be a group, and must have access to the requested company, branch and application. Access may be direct or inherited from its groups.
- Successful and failed validation attempts are recorded. Requests rejected before account validation may have no event record.
- Success requires both valid account access and a recorded event. A failed login can still return a `LogID`; this does not indicate successful authentication.
- Login does not create a session or issue a token.
- Retrying after a timeout or lost response can record another login attempt.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | `200` on success; negative on failure. |
| `exec_msg` | `String` | Execution message. |
| `resultset.AccountID` | `String` | Validated account identifier; empty on failure. |
| `resultset.CompanyID` | `String` | Company whose access was validated; empty on failure. |
| `resultset.LogID` | `String` | Recorded login-event identifier, including recorded failures; empty if no event was recorded. |

Check `exec_code` before using `resultset`, even when HTTP status is `200`. Authentication or request-validation errors may omit `resultset`.

## Responses

**Success Response:**

```json
{"exec_code":200,"exec_msg":"Success","resultset":{"AccountID":"12345","CompanyID":"160","LogID":"10001"}}
```

**Recorded Login Failure:**

```json
{"exec_code":-2401,"exec_msg":"Invalid credentials or account access denied.","resultset":{"AccountID":"","CompanyID":"","LogID":"10002"}}
```

**Event Write Failure:**

```json
{"exec_code":-2414,"exec_msg":"Account event could not be recorded.","resultset":{"AccountID":"","CompanyID":"","LogID":""}}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Account validated and LOGIN event recorded |
| `-1003` | Required request parameter missing |
| `-1004` | Request execution failed |
| `-2400` | Invalid request parameters or event metadata exceeds a field length |
| `-2401` | Invalid credentials or account access denied; inspect LogID for its recorded event |
| `-2414` | Event could not be recorded |
| `-2499` | Account operation failed |

## cURL Examples

### POST — Login with optional metadata

```bash
curl --request POST \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Login' \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  --data '{"auth":{"user":"api_user","pwd":"api_password"},"param":{"Account":"example.account","Password":"<account_password>","CompanyID":160,"BranchID":10,"ApplicationName":"Example application","ModuleName":"Login","ModuleVersion":"1.0","MachineName":"example-device"}}'
```
