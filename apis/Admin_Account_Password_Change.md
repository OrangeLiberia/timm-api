# Admin/Account/Password/Change

This method changes an account password after validating the current password and the account's company, branch and application access.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Change an account password |

## Endpoint URL

```text
/TIMM/v1/Admin/Account/Password/Change
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Admin/Account/Password/Change` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Password/Change` |

All account identifiers and credentials in examples are placeholders or synthetic values.

## Authentication

The API caller must authenticate on every request and have permission to call this method. Use HTTP Basic Authentication or a JSON `auth` object in the request body.

```json
{"auth":{"user":"api_user","pwd":"api_password"}}
```

The `auth` credentials identify the API caller. `AccountID` identifies the account whose password will change.

## Request Parameters

Send the following fields inside the JSON `param` object. Use `Content-Type: application/json` and `Accept: application/json`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `AccountID` | `Integer` | Required | Account identifier. |
| `OldPassword` | `String` | Required | Current account password; 1 to 400 characters. Supports U+0001 through U+00FF; spaces are significant. |
| `NewPassword` | `String` | Required | New account password; 1 to 400 characters. Supports U+0001 through U+00FF; spaces are significant. |
| `CompanyID` | `Integer` | Required | Company identifier. |
| `BranchID` | `Integer` | Required | Branch identifier. |
| `ApplicationID` | `Integer (64-bit)` | Optional | Application identifier. Defaults to `70000000` when omitted. |

Omit optional parameters to use their defaults.

## Processing Rules

- The current password must match. The account must be enabled, must not be a group, and must have access to the requested company, branch and application.
- Access may be assigned directly to the account or inherited from its groups.
- A successful request changes the password immediately. The API permits the current and new passwords to be identical.
- If the response is lost or times out, validate the new password before retrying. A repeated request with an outdated current password is denied.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | `200` on success; negative on failure. |
| `exec_msg` | `String` | Execution message. |
| `resultset.AccountID` | `String` | Account whose password was changed; empty on failure. |
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

**Change Denied:**

```json
{
  "exec_code": -2402,
  "exec_msg": "Password change denied: invalid credentials or account access.",
  "resultset": {
    "AccountID": "",
    "CompanyID": ""
  }
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Password changed |
| `-1003` | Required request parameter missing |
| `-1004` | Request execution failed |
| `-2400` | Invalid account identifier, password or access scope |
| `-2402` | Invalid credentials or account access denied; password not changed |
| `-2499` | Account operation failed |

## cURL Examples

### POST — Change using the default application

```bash
curl --request POST \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Password/Change' \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  --data '{"auth":{"user":"api_user","pwd":"api_password"},"param":{"AccountID":12345,"OldPassword":"<current_password>","NewPassword":"<new_password>","CompanyID":160,"BranchID":10}}'
```

### Request body — Change with an explicit application

```json
{
  "auth": {"user": "api_user", "pwd": "api_password"},
  "param": {
    "AccountID": 12345,
    "OldPassword": "<current_password>",
    "NewPassword": "<new_password>",
    "CompanyID": 160,
    "BranchID": 10,
    "ApplicationID": 70000000
  }
}
```
