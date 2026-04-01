# Subscriber/Package/TDD

This method will allow’ s to add, remove a TDD Package from a subscriber, or get information regarding the of a TDD Package.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `POST` | Add a TDD Package to a Subscriber |
| `GET` | Gets the TDD Package Information |
| `DELETE` | Removes a TDD Package from a Subscriber |

## Endpoint URL

```
TIMM/v1/Subscriber/Package/TDD
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Package/TDD` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Package/TDD` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to add the TDD Package. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `PkgID` | `String` | ✅ Required | Package Identification 12005 - Fast Connect 5Mb (1 Month) |
| `ParentMSISDN` | `String` | ✅ Required | Phone Number on whose account will be charged and notified of the activation. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. TRXID |
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to delete the TDD Package. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx |
| `PkgID` | `String` | ✅ Required | Package Identification 12005 - Fast Connect 5Mb (1 Month) Do_Provisioning Numeric |
| `Reason` | `String` | ✅ Required | (optional) Reason for the de-activation. GET Request definition: |
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to get the TDD Package information. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `TRXID` | `String` | ✅ Required | (optional) Transaction ID |

## Response Fields

> Result type: **Single Object**

| Field | Type | Description |
|-------|------|-------------|
| `trxid` | `String` | Output Transaction ID |
| `intrxid` | `String` | Output Internal Transaction ID |

## Mock Responses

### POST — Add a TDD Package to a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "trxid": "sample_trxid",
    "intrxid": "sample_intrxid"
  }
}
```

### GET — Gets the TDD Package Information

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "trxid": "sample_trxid",
    "intrxid": "sample_intrxid"
  }
}
```

### DELETE — Removes a TDD Package from a Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "trxid": "sample_trxid",
    "intrxid": "sample_intrxid"
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
| `-2000` | General Error / Execution Error|

## cURL Examples

### POST — Add a TDD Package to a Subscriber

```bash
curl -k -X POST \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Package/TDD" \
  -H "Content-Type: application/json" \
  -d '{
  "auth": {
    "user": "api_user",
    "pwd": "api_password"
  },
  "param": {
    "MSISDN": "0777777588",
    "PkgID": "ID-001234",
    "ParentMSISDN": "0777777588",
    "Reason": "<Reason>",
    "TRXID": "ID-001234"
  }
}'
```

### GET — Gets the TDD Package Information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Package/TDD?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:PkgID=ID-001234&param:ParentMSISDN=0777777588&param:Reason=<Reason>&param:TRXID=ID-001234"
```

### DELETE — Removes a TDD Package from a Subscriber

```bash
curl -k -X DELETE \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Package/TDD?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:PkgID=ID-001234&param:ParentMSISDN=0777777588&param:Reason=<Reason>&param:TRXID=ID-001234"
```
