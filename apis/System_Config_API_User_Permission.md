# System/Config/API/User/Permission

This method can be called to add or remove one API permission for an existing API user.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Adds one API permission to a user |
| `DELETE` | Removes one API permission from a user |

## Endpoint URL

```
TIMM/v1/System/Config/API/User/Permission
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/System/Config/API/User/Permission` |
| Dev/Test   | `http://192.168.19.139:11000/TIMM/v1/System/Config/API/User/Permission` |

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

> The supplied Dev/Test endpoint uses HTTP. Credentials placed in its query string are not encrypted in transit and can appear in network, proxy, process, or server logs.

## Request Parameters

Both parameters are required for `POST` and `DELETE`.

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `username` | `String` | ✅ Required | Existing API username in the current server environment |
| `APIID` | `Integer` | ✅ Required | Identifier of the API permission to add or remove. Use an `APIID` returned by `System/Config/API/List` |

### Request Body

```json
{
  "param": {
    "username": "test",
    "APIID": 214042
  }
}
```

## Processing Rules

- `POST` requires an existing user, an existing `APIID`, and a permission that is not already assigned to that user.
- `DELETE` requires an existing user, an existing `APIID`, and a permission currently assigned to that user.
- Both operations apply to the user record in the current server environment.
- TIMM stores the client-facing `DELETE` method as `DEL` internally; clients must send the HTTP `DELETE` verb.
- A successful `DELETE` response returns the original permission creation timestamp in `CreationDate`.

These operations change the stored API permissions. A running TIMM.API process can continue using its previously loaded authorization cache until the applicable restart or reinitialization procedure is completed.

## Response Fields

> Result type: **Single Object**

Successful `POST` and `DELETE` calls return the same result shape. Error responses contain only `exec_code` and `exec_msg`.

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object describing the permission that was added or removed; omitted on error |
| `resultset.APIID` | `String` | Identifier of the API permission |
| `resultset.CreationDate` | `DateTime String` | Date and time when the permission was originally created |
| `resultset.IDUser` | `String` | Internal identifier of the API user |
| `resultset.Username` | `String` | API username affected by the operation |

## Responses

### POST — Add an API permission

**Success Response (`exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "APIID": "214042",
    "CreationDate": "2026-08-29 00:59:06.210",
    "IDUser": "1001",
    "Username": "test"
  }
}
```

**Username Not Found (`exec_code: -2201`):**

```json
{
  "exec_code": -2201,
  "exec_msg": "The username does not exist in the current environment."
}
```

**API Permission Not Found (`exec_code: -2203`):**

```json
{
  "exec_code": -2203,
  "exec_msg": "The requested permission(APIID) does not exist."
}
```

**Permission Already Assigned (`exec_code: -2204`):**

```json
{
  "exec_code": -2204,
  "exec_msg": "The user already has the requested API permission."
}
```

### DELETE — Remove an API permission

**Success Response (`exec_code: 200`):**

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "APIID": "214042",
    "CreationDate": "2026-08-29 00:59:06.210",
    "IDUser": "1001",
    "Username": "test"
  }
}
```

**Username Not Found (`exec_code: -2201`):**

```json
{
  "exec_code": -2201,
  "exec_msg": "The username does not exist in the current environment."
}
```

**API Permission Not Found (`exec_code: -2203`):**

```json
{
  "exec_code": -2203,
  "exec_msg": "The requested permission(APIID) does not exist."
}
```

**Permission Not Assigned (`exec_code: -2205`):**

```json
{
  "exec_code": -2205,
  "exec_msg": "The user does not have the requested API permission."
}
```

## Error Codes

| Code | HTTP Verb | Description |
|------|-----------|-------------|
| `200` | `POST`, `DELETE` | Success |
| `-1003` | `POST`, `DELETE` | API Call is missing a parameter |
| `-2200` | `POST`, `DELETE` | One or more mandatory parameters are empty |
| `-2201` | `POST`, `DELETE` | The username does not exist in the current environment |
| `-2203` | `POST`, `DELETE` | The requested permission (`APIID`) does not exist |
| `-2204` | `POST` | The user already has the requested API permission |
| `-2205` | `DELETE` | The user does not have the requested API permission |
| `-2299` | `POST`, `DELETE` | The permission update failed |

## cURL Examples

### POST — Add an API permission

```bash
curl.exe --silent --show-error --request POST \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  --data-binary "@curl-tests/generated/system-config-api-user-permission-post-success.json" \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/User/Permission?auth:user=api_user&auth:pwd=api_password"
```

### DELETE — Remove an API permission

```bash
curl.exe --silent --show-error --request DELETE \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  --data-binary "@curl-tests/generated/system-config-api-user-permission-delete-success.json" \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/User/Permission?auth:user=api_user&auth:pwd=api_password"
```
