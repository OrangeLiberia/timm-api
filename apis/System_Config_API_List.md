# System/Config/API/List

This method can be called to return the configured TIMM API route definitions.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns the configured API route definitions |

## Endpoint URL

```
TIMM/v1/System/Config/API/List
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/System/Config/API/List` |
| Dev/Test   | `http://192.168.19.139:11000/TIMM/v1/System/Config/API/List` |

## Authentication

Authentication credentials must be provided on every request, either as URL query parameters or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

This API does not require endpoint-specific request parameters.

## Response Fields

> Result type: **Array**

The `resultset` array contains one object per configured API route. Its length, order, and entries depend on the API catalog in the target environment.

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | `Integer` | Execution code |
| `exec_msg` | `String` | Execution message |
| `resultset` | `Object Array` | Configured API route definitions |
| `resultset[].APIID` | `String` | Internal identifier of the configured API |
| `resultset[].APIZone` | `String` | Logical API zone or category, such as `COMMON` or `CRM` |
| `resultset[].Description` | `String` | Human-readable purpose of the API |
| `resultset[].HTTPVerb` | `String` | HTTP method configured for the route, such as `GET` or `POST` |
| `resultset[].INConfigRequired` | `String` | Intelligent Network configuration requirement flag; `0` means not required |
| `resultset[].OMConfigRequired` | `String` | Orange Money configuration requirement flag; `0` means not required |
| `resultset[].Route` | `String` | Relative path of the configured API route |

## Responses

### GET — Returns the configured API route definitions

**Success Response (`exec_code: 0`):**

The response below is intentionally abbreviated. The live response can contain additional entries.

```json
{
  "exec_code": 0,
  "exec_msg": "Success",
  "resultset": [
    {
      "APIID": "90",
      "APIZone": "COMMON",
      "Description": "Currency",
      "HTTPVerb": "GET",
      "INConfigRequired": "0",
      "OMConfigRequired": "0",
      "Route": "/TIMM/v1/COMMON/Currency/List"
    },
    {
      "APIID": "92",
      "APIZone": "COMMON",
      "Description": "Currency",
      "HTTPVerb": "POST",
      "INConfigRequired": "0",
      "OMConfigRequired": "0",
      "Route": "/TIMM/v1/COMMON/Currency/Exchange"
    },
    {
      "APIID": "120",
      "APIZone": "CRM",
      "Description": "Occupation Information List",
      "HTTPVerb": "GET",
      "INConfigRequired": "0",
      "OMConfigRequired": "0",
      "Route": "/TIMM/v1/CRM/Types/Occupation"
    }
  ]
}
```

**Authorization Error Response (`exec_code: -1002`):**

```json
{
  "exec_code": -1002,
  "exec_msg": "Authorization failed"
}
```

## Error Codes

| Code | Description |
|------|-------------|
| `0` | Success |
| `-1002` | Authorization failed |
| `-1004` | API Call execution failed |

## cURL Examples

### GET — Returns the configured API route definitions

```bash
curl.exe --silent --show-error --request GET \
  --header "Accept: application/json" \
  "http://192.168.19.139:11000/TIMM/v1/System/Config/API/List?auth:user=api_user&auth:pwd=api_password"
```
