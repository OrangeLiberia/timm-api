# Service/Get/ServiceID

This method can be called to get the information of a service using the service identifier.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Allows for a caller to get the Service information |

## Endpoint URL

```
TIMM/v1/CRM/Service/Get/ServiceID
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Service/Get/ServiceID` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Service/Get/ServiceID` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ServiceID` | `String` | ✅ Required | Subscriber Service ID |

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object` | Object containing Service information |
| `resultset.ServiceID` | `Number` | Service identifier |
| `resultset.ClientName` | `String` | Subscriber name |
| `resultset.IDCardType` | `String` | Subscriber's ID card type |
| `resultset.IDCardNumber` | `String` | Subscriber's ID card number |
| `resultset.PhoneNumber` | `String` | Phone number |
| `resultset.Status` | `String` | Status of the service |
| `resultset.ActivationCode` | `String` | eSIM activation code used to generate the QR code |

## eSIM QR Code

If `ActivationCode` has a value and the type of SIM Card linked to the service is `4`, i.e. eSIM, then an icon with a QR code should become visible. If the user clicks it, a QR code should be displayed. The QR code is generated based on the value of the field `ActivationCode`. The SIM Card type can be checked on API `/TIMM/v1/CRM/Types/SIMCard`.

## Responses

### GET — Allows for a caller to get the Service information

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ServiceID": 1001,
    "ClientName": "John Doe",
    "IDCardType": "Standard",
    "IDCardNumber": "sample_IDCardNumber",
    "PhoneNumber": "0777777588",
    "Status": "Active",
    "ActivationCode": "LPA:1$example.smdpplus.com$ABCDEF123456"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -1004,
  "exec_msg": "Execution failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1110` | Invalid PIN |
| `-1111` | Invalid PIN for Technical Wallet |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### GET — Allows for a caller to get the Service information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Service/Get/ServiceID?auth:user=api_user&auth:pwd=api_password&param:ServiceID=1001"
```
