# CRM/Search/SIMcard

This method can be called to get SIM card information.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Get SIM card information |

## Endpoint URL

```
TIMM/v1/CRM/Search/SIMcard
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Search/SIMcard` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Search/SIMcard` |

## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ICCID` | `String` | ⬜ Optional | Unique SIM Card number of 19 or 20 digits |
| `MSISDN` | `String(32)` | ⬜ Optional | Phone Number on whose account you want to remove the Ring Back Tone. Phone number can have a size of either 10 or 12 digits, according to the following formats: `077xxxxxx` Or `23177xxxxxxx`. Or, if pseudonymization is enabled for the connection, encrypted `X-MSISDN` header can be passed in directly. |
| `SIMCardTypeID` | `Integer` | ⬜ Optional | SIMCard type ID. See API `/TIMM/v1/CRM/Types/SIMCard` for reference |
| `SIMCardInactive` | `Bit` | ⬜ Optional | If `1` returns only active services. If `0` returns all services. |
| `Token` | `String` | ⬜ Optional | Returned by the method Authenticate/API/Token |

> The parameters `ICCID` and `MSISDN` cannot both be empty.

## Response Fields

| Parameter | Type | Description |
|-----------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Textual description of the error |
| `resultset` | `Object` | SIM card information |
| `resultset.PhoneNumber` | `String` | Phone number |
| `resultset.ICCID` | `String` | Unique SIM Card number of 19 or 20 digits |
| `resultset.IMSI` | `Number` | International Mobile Subscriber Identity |
| `resultset.SIMCardTypeID` | `Integer` | SIMCard type ID. See API `/TIMM/v1/CRM/Types/SIMCard` for reference |
| `resultset.ServicePrePaid` | `Integer` | `1` if the service is pre-paid. `3` if the service is post-paid |
| `resultset.IsActive` | `Bit` | `0` not active. `1` active |
| `resultset.SIMCardStatus` | `String` | SIM Card status |

## Responses

### GET — Get SIM card information

**Success Response (`exec_code: 200`):**
```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": {
    "ICCID": "892310700000000780",
    "IMSI": "0000000078",
    "IsActive": "0",
    "PhoneNumber": "",
    "SIMCardStatus": "0",
    "ServicePrePaid": "1"
  }
}
```

**Error Response:**
```json
{
  "exec_code": -1004,
  "exec_msg": "The parameters ICCID and MSISDN cannot both be empty"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-1004` | The parameters ICCID and MSISDN cannot both be empty |
| `-1005` | The parameter ICCID has to have 18 characters |
| `-1006` | Service Not Found |
| `-1007` | SIM card blocked |
| `-1008` | SIM card active |
| `-1009` | SIM card inactive |
| `-1010` | Internal API error |

## cURL Examples

### GET — Get SIM card information

```bash
curl -k -X GET \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Search/SIMcard?auth:user=api_user&auth:pwd=api_password&param:ICCID=892310700000000780&param:MSISDN=&param:SIMCardInactive=1&param:SIMCardTypeID=2&param:Token=<Token>"
```
