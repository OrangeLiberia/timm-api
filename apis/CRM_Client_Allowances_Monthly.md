# CRM/Client/Allowances/Monthly

This method returns the monthly allowances configured for internal users.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns internal-user monthly allowances |

## Endpoint URL

```
TIMM/v1/CRM/Client/Allowances/Monthly
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/CRM/Client/Allowances/Monthly` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Client/Allowances/Monthly` |


Replace the example host with the base URL for the target TIMM.API environment.

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Period` | `Date` | ⬜ Optional | Allowance period in `YYYY-MM-DD` format. If omitted, the underlying procedure uses its configured default period |

`Period` is passed as a query-string parameter without the `param:` prefix.

## Response Fields

> Result type: **Array**

The `resultset` array contains one object per internal user returned for the selected or default period. The number and order of rows depend on the data in the target environment.

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object Array` | Internal-user monthly allowance records |
| `resultset[].Allowance` | `Decimal String` | Monthly allowance amount, serialized as a decimal string |
| `resultset[].MSISDN` | `String` | Internal user's mobile number |
| `resultset[].Period` | `Date String` | Date identifying the allowance period, formatted as `YYYY-MM-DD` |

## Responses

### GET — Returns monthly allowances

**Success Response (`exec_code: 200`):**

The response below is intentionally abbreviated and uses synthetic MSISDN values. A live response can contain additional rows.

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": [
    {
      "Allowance": "15.000000",
      "MSISDN": "231770000001",
      "Period": "2026-05-01"
    },
    {
      "Allowance": "30.000000",
      "MSISDN": "231770000002",
      "Period": "2026-05-01"
    },
    {
      "Allowance": "40.000000",
      "MSISDN": "231770000003",
      "Period": "2026-05-01"
    }
  ]
}
```

## Error Handling

No endpoint-specific error response was supplied. The invalid-period test must return an `exec_code` other than `200`; clients should not depend on a particular error code until that live response is captured.

## cURL Examples

### GET — Use the default period

```bash
curl.exe --silent --show-error --request GET \
  --header "Accept: application/json" \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Client/Allowances/Monthly?auth:user=api_user&auth:pwd=api_password"
```

### GET — Use an explicit period

```bash
curl.exe --silent --show-error --request GET \
  --header "Accept: application/json" \
  "https://APIDEV.Orange.com.lr/TIMM/v1/CRM/Client/Allowances/Monthly?Period=2026-05-01&auth:user=api_user&auth:pwd=api_password"
```
