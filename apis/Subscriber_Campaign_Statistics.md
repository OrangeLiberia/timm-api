# Subscriber/Campaign/Statistics

This method is used to get statistics of a subscriber regarding recharges and Tenure in the system. It will only return a successful code if subscriber exists.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Gets the statistics of the Subscriber |

## Endpoint URL

```
TIMM/v1/Subscriber/Campaign/Statistics
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Campaign/Statistics` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Campaign/Statistics` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to set to Default access. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. |
| `Eligibility` | `String` | ✅ Required | Item to check the eligibility ROAMING– Check Statistics of Subscriber for Roaming eligibility SOS-CREDIT– Check Statistics of Subscriber for SOS-CREDIT eligibility KYC Status – Check KYC Status Examples: { "auth":{"user":"username", "pwd":"password" }, "param": { "msisdn":"0777777721", "Eligibility":"SOS-CREDIT" } } { "auth":{"user":"username", "pwd":"password" }, "param": { "msisdn":"0777777721", "Eligibility":" ROAMING " } } { "auth":{"user":"username", "pwd":"password" }, "param": { "msisdn":"0777777721", "Eligibility":" KYC Status " } } |

## Mock Responses

### GET — Gets the statistics of the Subscriber

**Success Response (`exec_code: 0`):**
```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": {
    "actionid": "ACT-20241107-001234"
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

### GET — Gets the statistics of the Subscriber

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Campaign/Statistics?auth:user=api_user&auth:pwd=api_password&param:MSISDN=0777777588&param:Eligibility=<Eligibility>"
```
