# ACL/Account

This method returns the account and name when an account belongs to the specified ACL group.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get an account and its name from the specified ACL group |

## Endpoint URL

```text
/TIMM/v1/ACL/Account
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://api.example.invalid/TIMM/v1/ACL/Account` |
| Dev/Test | `https://APIDEV.Orange.com.lr/TIMM/v1/ACL/Account` |

Replace the production example host with the configured production base URL.

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or through the configured TIMM authentication mechanism. The authenticated API user must have permission to call this GET method. Multiple users can have permission to use the same method.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `auth:user` | `String` | Required | API username permitted to call this method |
| `auth:pwd` | `String` | Required | API user's password when query authentication is used |

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `GroupName` | `String` | Required | ACL group description, up to 256 characters. Matches `API.MenuACLGroups.Description` |
| `Account` | `String` | Required | Account MSISDN, up to 32 characters. Matches `API.MenuACLNumbers.MSISDN`; preserve leading zeros |

Send these parameters directly in the query string, without the `param:` prefix. No request body is required. URL-encode parameter values containing spaces or other special characters.

## Processing Rules

- The configured database action is `TIMM_API.API.GetACLAccount`.
- The lookup joins the ACL group and account records on `ACLID` and filters by both `GroupName` and `Account`.
- The unique group-description index and the `(ACLID, MSISDN)` primary key guarantee at most one match. Text matching follows the column collations.
- An account with a missing name is still a successful match. The reviewed TIMM SQL serializer represents a SQL `NULL` name as an empty string.
- A missing group, missing account, or account belonging only to another group returns `Account not found in the specified group.`
- Inspect `exec_code` independently of HTTP status. Missing required request parameters can be rejected by the API before the procedure runs.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Application code; `200` indicates success |
| `exec_msg` | `String` | Application execution message |
| `resultset.Account` | `String` | Matching account MSISDN; empty on a procedure-level error |
| `resultset.Name` | `String` | Matching name; empty when SQL `Name` is `NULL` or on a procedure-level error |

The procedure's status columns are mapped to the response envelope and excluded from `resultset`. Authentication or request-validation failures can return only `exec_code` and `exec_msg`.

## Responses

### GET — Get an account from an ACL group

The following examples illustrate the procedure and reviewed serializer contract; they are not captured production responses.

**Success Response (`exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "Account": "000000001",
    "Name": "Example Name"
  }
}
```

**Not Found Response:**

```json
{
  "exec_code": -2301,
  "exec_msg": "Account not found in the specified group.",
  "resultset": {
    "Account": "",
    "Name": ""
  }
}
```

**Blank Parameter Response:**

```json
{
  "exec_code": -2300,
  "exec_msg": "GroupName and Account are required.",
  "resultset": {
    "Account": "",
    "Name": ""
  }
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Matching account found |
| `-1003` | Required request parameter is missing at the API layer |
| `-2300` | `GroupName` or `Account` is blank or SQL `NULL` |
| `-2301` | Account was not found in the specified group |

## cURL Examples

### GET — Lookup by group and account

```bash
curl -X GET \
  'https://APIDEV.Orange.com.lr/TIMM/v1/ACL/Account?auth:user=api_user&auth:pwd=api_password&GroupName=Example%20Group&Account=000000001' \
  -H 'Accept: application/json'
```

### GET — Account not found in the group

```bash
curl -X GET \
  'https://APIDEV.Orange.com.lr/TIMM/v1/ACL/Account?auth:user=api_user&auth:pwd=api_password&GroupName=Example%20Group&Account=000000999' \
  -H 'Accept: application/json'
```
