# System/Config/API/Create/User

This method can be called to create an API user and optionally assign configuration resources to the new user.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Create API user and assign configuration resources |

## Endpoint URL

```
TIMM/v1/System/Config/API/Create/User
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/System/Config/API/Create/User` |
| Dev/Test   | `http://192.168.19.139:11000/TIMM/v1/System/Config/API/Create/User` |

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `domain` | `String` | ✅ Required | API user domain |
| `username` | `String` | ✅ Required | API username to be created |
| `credential` | `String` | ✅ Required | API user credential |
| `Name` | `String` | ✅ Required | API user display name |
| `Description` | `String` | ✅ Required | API user description |
| `UserType` | `Integer` | ✅ Required | API user type. The value must exist in the API user type reference table |
| `ExecAttributes` | `String Array` | ⬜ Optional | List of unique, available `ResourceKey` values to assign to the new user. For example: `["IN-100300166","OM-WALLET-0779612009"]` |
| `Creator` | `String` | ✅ Required | User or process requesting the API user creation |
| `InternalBusinessOwner` | `String` | ✅ Required | Internal business owner name |
| `InternalBusinessOwnerPhone` | `String` | ✅ Required | Internal business owner phone number |
| `InternalBusinessOwnerEmail` | `String` | ✅ Required | Internal business owner email address |
| `PartnerName` | `String` | ✅ Required | Partner name |
| `PartnerPhone` | `String` | ✅ Required | Partner phone number |
| `PartnerEmail` | `String` | ✅ Required | Partner email address |

## Processing Rules

If `ExecAttributes` is supplied, each value must be a non-empty configuration resource key. The same resource key cannot be supplied more than once.

Requested configuration resources are assigned only if all of them are still available. If any requested resource is no longer available, the user is not created and no requested resource remains assigned by this call.

If `ExecAttributes` is not supplied, the user is created without assigning configuration resources.

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing user creation information |
| `resultset.User` | `Object` | Object containing the created API user information. On failed calls this value can be empty |
| `resultset.User.Domain` | `String` | API user domain |
| `resultset.User.ID` | `String` | Internal API user ID |
| `resultset.User.UserID` | `String` | API user ID |
| `resultset.User.Username` | `String` | API username created |

## Responses

### POST — Create API user and assign configuration resources

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "User": {
      "Domain": "TEST",
      "ID": "2129083",
      "UserID": "1007",
      "Username": "api-resource-test-001"
    }
  }
}
```

**Missing Parameter Response (`exec_code: -1003`):**
```json
{
  "exec_code": -1003,
  "exec_msg": "API Call is missing a parameter: CREATOR"
}
```

**Invalid UserType Response (`exec_code: -2101`):**
```json
{
  "exec_code": -2101,
  "exec_msg": "The requested UserType does not exist.",
  "resultset": {
    "User": ""
  }
}
```

**Configuration Resource Not Available Response (`exec_code: -2104`):**
```json
{
  "exec_code": -2104,
  "exec_msg": "One or more configuration resources are no longer available: IN-100259, OM-0779948136",
  "resultset": {
    "User": ""
  }
}
```

**Duplicate Username Response (`exec_code: -2105`):**
```json
{
  "exec_code": -2105,
  "exec_msg": "The username already exists in the default environment.",
  "resultset": {
    "User": ""
  }
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `200` | Success |
| `-1003` | API Call is missing a parameter |
| `-2100` | One or more mandatory parameters are empty |
| `-2101` | The requested UserType does not exist |
| `-2102` | ExecAttributes must be an array of non-empty resource keys |
| `-2103` | ExecAttributes contains a duplicate resource key |
| `-2104` | One or more configuration resources are no longer available |
| `-2105` | The username already exists in the default environment |
| `-2106` | Resource Override attributes must contain string values only |
| `-2107` | Selected resources contain conflicting Override attributes |
| `-2108` | Combined resource ExecutionAttributes exceeds 4096 bytes |
| `-2109` | No API UserID values remain available |
| `-2199` | User creation failed |

## cURL Examples

### POST — Create API user with configuration resources

```bash
curl -k --silent --show-error -X POST \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/Create/User?auth:user=api_user&auth:pwd=api_password" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --data-binary @curl-tests/generated/system-config-api-create-user-with-resources.json
```

Expected result: `exec_code` is `200`. If the requested `UserType` does not exist in the target environment, `exec_code` is `-2101`.

### POST — Create API user without configuration resources

```bash
curl -k --silent --show-error -X POST \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/Create/User?auth:user=api_user&auth:pwd=api_password" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --data-binary @curl-tests/generated/system-config-api-create-user-without-resources.json
```

Expected result: `exec_code` is `200`.

### POST — Missing Creator

```bash
curl -k --silent --show-error -X POST \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/Create/User?auth:user=api_user&auth:pwd=api_password" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --data-binary @curl-tests/generated/system-config-api-create-user-missing-creator.json
```

Expected result: `exec_code` is `-1003`.

### POST — Unavailable Configuration Resources

```bash
curl -k --silent --show-error -X POST \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/Create/User?auth:user=api_user&auth:pwd=api_password" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --data-binary @curl-tests/generated/system-config-api-create-user-with-unavailable-resources.json
```

Expected result: `exec_code` is `-2104`.

### POST — Duplicate Username

```bash
curl -k --silent --show-error -X POST \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/Create/User?auth:user=api_user&auth:pwd=api_password" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --data-binary @curl-tests/generated/system-config-api-create-user-duplicate.json
```

Expected result: `exec_code` is `-2105`.
