# Admin/Account/Permissions

This method returns the direct and inherited permissions for an account in the specified company and application.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get account permissions, optionally including application names |

## Endpoint URL

```text
/TIMM/v1/Admin/Account/Permissions
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Admin/Account/Permissions` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Permissions` |

All identifiers and credentials in examples are synthetic or placeholders.

## Authentication

The API caller must authenticate on every request and have permission to call this method. Use HTTP Basic Authentication or the `auth:user` and `auth:pwd` query parameters.

## Request Parameters

Send query parameters directly, without a `param:` prefix. No JSON body is required.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `AccountID` | `Integer` | Required | Account whose permissions are requested. |
| `CompanyID` | `Integer` | Required | Company whose permissions are requested. |
| `ApplicationID` | `Integer (64-bit)` | Optional | Main application identifier. Defaults to `70000000` when omitted. |
| `Detailed` | `Integer flag` | Optional | `0` returns permission identifiers and security flags; `1` also includes application names. Defaults to `0`. |

Omit optional parameters to use their defaults.

## Processing Rules

- The account must be enabled, must not be a group, and must belong to the requested company, directly or through its groups.
- Only permissions for the requested company and application are returned. Duplicate permission records are removed.
- `Security` classifies a permission: `"1"` identifies a security-level permission; `"0"` identifies another permission type. It is not an access-denied flag.
- No matching permissions is a successful result with `PermissionCount = "0"` and `Permissions = null`.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | `200` on success; negative on failure. |
| `exec_msg` | `String` | Execution message. |
| `resultset.AccountID` | `String` | Account whose permissions were queried; empty on failure. |
| `resultset.CompanyID` | `String` | Company whose permissions were queried; empty on failure. |
| `resultset.PermissionCount` | `String` | Number of returned permission records; empty on failure. |
| `resultset.Permissions` | `Array, null or String` | Permission records; `null` for a successful empty list, or an empty string on failure. |
| `resultset.Permissions[].ApplicationID` | `String` | Granted application identifier. |
| `resultset.Permissions[].Security` | `String` | `"1"` for a security-level permission; otherwise `"0"`. |
| `resultset.Permissions[].Name` | `String` | Application name. Included only when `Detailed = 1`; may be empty. |

Check `exec_code` before using `resultset`, even when HTTP status is `200`. Authentication or request-validation errors may omit `resultset`.

## Responses

**Success Response — detailed permissions:**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "AccountID": "12345",
    "CompanyID": "160",
    "PermissionCount": "2",
    "Permissions": [
      {"ApplicationID": "108", "Security": "1", "Name": "Read reports"},
      {"ApplicationID": "256", "Security": "0", "Name": "Administration"}
    ]
  }
}
```

**Success Response — empty list:**

```json
{"exec_code":200,"exec_msg":"Success","resultset":{"AccountID":"12345","CompanyID":"160","PermissionCount":"0","Permissions":null}}
```

**Access Denied:**

```json
{"exec_code":-2412,"exec_msg":"Account access denied.","resultset":{"AccountID":"","CompanyID":"","PermissionCount":"","Permissions":""}}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Permissions queried successfully, including zero permissions |
| `-1003` | Required request parameter missing |
| `-1004` | Request execution failed |
| `-1116` | Permission configuration unavailable or invalid |
| `-2400` | Invalid account or permissions parameters |
| `-2412` | Account missing, disabled, a group or without company access |
| `-2499` | Account operation failed |

## cURL Examples

### GET — Default application and compact permissions

```bash
curl --request GET --user 'api_user' \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Permissions?AccountID=12345&CompanyID=160' \
  --header 'Accept: application/json'
```

### GET — Detailed permissions

```bash
curl --request GET --user 'api_user' \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Admin/Account/Permissions?AccountID=12345&CompanyID=160&ApplicationID=70000000&Detailed=1' \
  --header 'Accept: application/json'
```

The commands prompt for the API caller's password.
