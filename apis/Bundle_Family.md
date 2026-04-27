# Bundle/Family

This resource allows managing family bundle balance sharing between an owner number and member numbers.

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## POST Bundle/Family

This method allows adding a balance share for the specified owner number and member number.

### Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Add balance share for the specified number |

### Endpoint URL

```
TIMM/v1/Bundle/Family
```

### Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Bundle/Family` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family` |

### Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `OwnerMSISDN` | `String` | Required | Owner or master phone number whose balance resource will be shared. Phone number can have a size of either 10 or 12 digits, for example `077xxxxxxx` or `23177xxxxxxx`. |
| `MemberMSISDN` | `String` | Required | Member phone number that will receive access to the shared balance. Phone number can have a size of either 10 or 12 digits, for example `077xxxxxxx` or `23177xxxxxxx`. |
| `BundleID` | `String` | Required | Balance resource code to share, for example `DataBal1`. |
| `UsageLimit` | `String` | Required | Maximum amount of balance the member may consume from the share. |
| `ActivationDate` | `String` | Optional | Date and time when the balance share becomes active. Format: `YYYY-MM-DD HH:mm:ss`. Default is empty. |
| `ExpirationDate` | `String` | Optional | Date and time when the balance share expires. Format: `YYYY-MM-DD HH:mm:ss`. Default is empty. |
| `BundleCharge` | `String` | Optional | Payment force flag. Default is `N`. |
| `UsageLimitDataUnit` | `String` | Optional | Unit for `UsageLimit`, for example `GB`. Default is `GB`. |
| `Priority` | `Integer` | Optional | Priority of the balance share. Default is `0`. |
| `Comment` | `String` | Optional | Optional front-facing comment. |

### Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `internal_code` | `String` | Internal result code mapped from the provider result code. |
| `BundleWalletID` | `String` | Balance share identifier returned by the provider. |

### Mock Responses

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "internal_code": "100",
    "BundleWalletID": "100001"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
}
```

### cURL Example

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "OwnerMSISDN": "0772916201",
    "MemberMSISDN": "0772916203",
    "BundleID": "DataBal1",
    "UsageLimit": "3",
    "ActivationDate": "2026-01-20 00:00:00",
    "ExpirationDate": "",
    "BundleCharge": "N",
    "UsageLimitDataUnit": "GB",
    "Priority": 0,
    "Comment": "Add family bundle member"
  }
}'
```

## PUT Bundle/Family

This method allows modifying the maximum balance share limit for the specified owner number and member number.

### Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `PUT` | Modify the maximum balance share limit for the specified number |

### Endpoint URL

```
TIMM/v1/Bundle/Family
```

### Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Bundle/Family` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family` |

### Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `BundleWalletID` | `String` | Required | Balance share identifier. |
| `OwnerMSISDN` | `String` | Required | Owner or master phone number for the balance share. Phone number can have a size of either 10 or 12 digits, for example `077xxxxxxx` or `23177xxxxxxx`. |
| `MemberMSISDN` | `String` | Required | Member phone number for the balance share. Phone number can have a size of either 10 or 12 digits, for example `077xxxxxxx` or `23177xxxxxxx`. |
| `UsageLimit` | `String` | Required | New maximum amount of balance the member may consume from the share. |
| `UsageLimitDataUnit` | `String` | Optional | Unit for `UsageLimit`. Leave empty when the limit is already expressed in the provider base unit. |
| `BundleID` | `String` | Optional | Optional front-facing bundle or resource identifier. |
| `Comment` | `String` | Optional | Optional front-facing comment. |

### Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `internal_code` | `String` | Internal result code mapped from the provider result code. |
| `BundleWalletID` | `String` | Balance share identifier returned by the provider. |

### Mock Responses

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "internal_code": "100",
    "BundleWalletID": "101"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
}
```

### cURL Example

```bash
curl -k -X PUT \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "BundleWalletID": "101",
    "OwnerMSISDN": "0772916201",
    "MemberMSISDN": "0772916203",
    "UsageLimit": "10000",
    "UsageLimitDataUnit": "",
    "BundleID": "DataBal1",
    "Comment": "Modify family bundle limit"
  }
}'
```

## GET Bundle/Family

This method allows querying balance share information for a specific owner number, member number, or both.

### Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Query balance share information for a specific master number and/or member number |

### Endpoint URL

```
TIMM/v1/Bundle/Family
```

### Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Bundle/Family` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family` |

### Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `BundleID` | `String` | Required | Balance resource code to query, for example `DataBal1`. |
| `OwnerMSISDN` | `String` | Conditional | Owner or master phone number to query. Required when `MemberMSISDN` is not provided. Phone number can have a size of either 10 or 12 digits, for example `077xxxxxxx` or `23177xxxxxxx`. |
| `MemberMSISDN` | `String` | Conditional | Member phone number to query. Required when `OwnerMSISDN` is not provided. Phone number can have a size of either 10 or 12 digits, for example `077xxxxxxx` or `23177xxxxxxx`. |
| `Comment` | `String` | Optional | Optional front-facing comment. |

### Response Fields

> Result type: **Object Array**

| Field | Type | Description |
|-------|------|-------------|
| `internal_code` | `String` | Internal result code mapped from the provider result code. |
| `BundleWalletID` | `String` | Balance share identifier. |
| `accountCode` | `String` | Account code associated with the balance share. |
| `OwnerMSISDN` | `String` | Owner or master phone number. |
| `MemberMSISDN` | `String` | Member phone number. |
| `BundleID` | `String` | Balance resource code. |
| `acctResName` | `String` | Balance resource name returned by the provider. |
| `unitType` | `String` | Unit type returned by the provider, for example `Data`. |
| `ActivationDate` | `String` | Balance share effective date. |
| `ExpirationDate` | `String` | Balance share expiration date. |
| `BundleCharge` | `String` | Payment force flag. |
| `UsageLimit` | `String` | Maximum usage limit returned by the provider. |
| `consumedAmount` | `String` | Amount already consumed from the share. |
| `Priority` | `String` | Balance share priority. |

### Mock Responses

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "internal_code": "100",
    "balShareDtoList": [
      {
        "BundleWalletID": "101",
        "accountCode": "accountCode1",
        "OwnerMSISDN": "231772916201",
        "MemberMSISDN": "231772916203",
        "BundleID": "DataBal1",
        "acctResName": "DataBalName1",
        "unitType": "Data",
        "ActivationDate": "2024-06-03 16:37:28",
        "ExpirationDate": "",
        "BundleCharge": "N",
        "UsageLimit": "1073741824",
        "consumedAmount": "0",
        "Priority": "1"
      },
      {
        "BundleWalletID": "102",
        "accountCode": "accountCode1",
        "OwnerMSISDN": "231772916201",
        "MemberMSISDN": "231772916204",
        "BundleID": "DataBal1",
        "acctResName": "DataBalName1",
        "unitType": "Data",
        "ActivationDate": "2024-06-03 16:37:28",
        "ExpirationDate": "",
        "BundleCharge": "N",
        "UsageLimit": "5368709120",
        "consumedAmount": "1073741824",
        "Priority": "1"
      }
    ]
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
}
```

### cURL Example

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family?auth:user=api_user&auth:pwd=api_password&param:BundleID=DataBal1&param:OwnerMSISDN=0772916201&param:MemberMSISDN=&param:Comment=Query%20family%20bundle"
```

## DEL Bundle/Family

This method allows deleting a balance share for the specified balance share identifier.

### Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `DEL` | Delete the balance share for the specified number |

### Endpoint URL

```
TIMM/v1/Bundle/Family
```

### Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Bundle/Family` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family` |

### Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `BundleWalletID` | `String` | Required | Balance share identifier. |
| `BundleID` | `String` | Optional | Optional front-facing bundle or resource identifier. |
| `Comment` | `String` | Optional | Optional front-facing comment. |

### Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `internal_code` | `String` | Internal result code mapped from the provider result code. |
| `BundleWalletID` | `String` | Balance share identifier returned by the provider. |

### Mock Responses

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "internal_code": "100",
    "BundleWalletID": "101"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -12,
  "exec_msg": "Authorization failed"
}
```

### cURL Example

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Bundle/Family" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "BundleWalletID": "101",
    "BundleID": "DataBal1",
    "Comment": "Delete family bundle member"
  }
}'
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success |
| `200` | Success With Warning |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error |
