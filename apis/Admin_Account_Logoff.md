# Admin/Account/Logoff

This method records an account logout event reported by an authorized API caller.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Record an account logout event |

## Endpoint URL

```text
/TIMM/v1/Admin/Account/Logoff
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Admin/Account/Logoff` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Logoff` |

All identifiers and credentials in examples are synthetic or placeholders.

## Authentication

The API caller must authenticate on every request and have permission to call this method. Use HTTP Basic Authentication or a JSON `auth` object in the request body.

```json
{"auth":{"user":"api_user","pwd":"api_password"}}
```

## Request Parameters

Send the following fields inside the JSON `param` object. Use `Content-Type: application/json` and `Accept: application/json`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `AccountID` | `Integer` | Required | Account whose logout is reported. |
| `CompanyID` | `Integer` | Required | Company reported for the logout. |
| `BranchID` | `Integer` | Required | Branch reported for the logout. |
| `ApplicationID` | `Integer (64-bit)` | Optional | Application identifier. Defaults to `70000000` when omitted. |
| `LoginWindows` | `String` | Optional | Windows login reported by the caller. |
| `MachineName` | `String` | Optional | Machine name reported by the caller. |
| `OsVersion` | `String` | Optional | Operating-system version. |
| `ApplicationName` | `String` | Optional | Application name. |
| `ModuleName` | `String` | Optional | Module name. |
| `ModuleVersion` | `String` | Optional | Module version. |

Omit optional parameters to use their defaults. Event metadata is optional, defaults to empty text, and must fit the configured field lengths.

## Processing Rules

- The target account must exist and must not be a group. Logout can be recorded for a disabled account.
- No account password or previous Login is required. The company, branch and application are caller-reported context; account access to that context is not checked.
- Success confirms that a logout event was recorded. It does not revoke a session, token or API credential.
- Repeated requests, including retries after a timeout, can create separate logout events.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | `200` on success; negative on failure. |
| `exec_msg` | `String` | Execution message. |
| `resultset.AccountID` | `String` | Account whose logout was recorded; empty on failure. |
| `resultset.CompanyID` | `String` | Company reported for the logout; empty on failure. |
| `resultset.LogID` | `String` | Recorded logout-event identifier; empty on failure. |

Check `exec_code` before using `resultset`, even when HTTP status is `200`. Authentication or request-validation errors may omit `resultset`.

## Responses

**Success Response:**

```json
{"exec_code":200,"exec_msg":"Success","resultset":{"AccountID":"12345","CompanyID":"160","LogID":"10003"}}
```

**Account Event Denied:**

```json
{"exec_code":-2412,"exec_msg":"Account event denied.","resultset":{"AccountID":"","CompanyID":"","LogID":""}}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | LOGOUT event recorded |
| `-1003` | Required request parameter missing |
| `-1004` | Request execution failed |
| `-2400` | Invalid request parameters or event metadata exceeds a field length |
| `-2412` | Target account does not exist or is a group |
| `-2414` | Event could not be recorded |
| `-2499` | Account operation failed |

## cURL Examples

### POST — Report logout without resubmitting the account password

```bash
curl --request POST \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Logoff' \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  --data '{"auth":{"user":"api_user","pwd":"api_password"},"param":{"AccountID":12345,"CompanyID":160,"BranchID":10,"ApplicationName":"Example application","ModuleName":"Logout"}}'
```
