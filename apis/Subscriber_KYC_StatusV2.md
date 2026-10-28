# StatusV2 API

## Endpoint

```http
POST http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/StatusV2
```

## Request

### cURL

```bash
curl -X POST "http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/StatusV2?auth:user=KYCMobileValidation&auth:pwd=YOUR_API_PASSWORD&param:ID=33333&param:TimmUserID=18089&param:MSISDN=0777567588&param:AgentMSISDN=0777000000&param:ValidationGSM=100&param:ValidationOM=100&param:OMLevel=1"
```

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `auth:user` | `KYCMobileValidation` | API authentication username |
| `auth:pwd` | `********` | API authentication password |
| `param:ID` | `33333` | KYC/subscriber record ID supplied to the API |
| `param:TimmUserID` | `18089` | TIMM user ID |
| `param:MSISDN` | `0777567588` | Subscriber mobile number |
| `param:AgentMSISDN` | `0777000000` | Agent mobile number |
| `param:ValidationGSM` | `100` | GSM validation value |
| `param:ValidationOM` | `100` | Orange Money validation value |
| `param:OMLevel` | `1` | Orange Money level |

> **Security:** Do not commit real API passwords or credentials to GitHub. Use environment variables or a secrets-management solution.

---

# Response

The supplied example returned:

```json
{
  "exec_code": -220,
  "exec_msg": "Fail: Wrong paramters"
}
```

## Response Status

| Field | Value | Description |
|---|---:|---|
| `exec_code` | `-220` | API reported a parameter error |
| `exec_msg` | `Fail: Wrong paramters` | Error message returned by the API (spelling preserved from response) |

## Error Handling

The example response indicates that the API did not accept the supplied parameters. The response alone does not identify which parameter is missing or invalid. Verify the parameter names, required values, and expected formats against the API implementation.

---

# API Summary

| Property | Value |
|---|---|
| Method | `POST` |
| Endpoint | `/TIMM/v1/CRM/Subscriber/KYC/StatusV2` |
| Authentication | Query-string authentication parameters |
| Input | `ID`, `TimmUserID`, `MSISDN`, `AgentMSISDN`, `ValidationGSM`, `ValidationOM`, `OMLevel` |
| Example Response Code | `-220` |
| Response Format | JSON |

> **Note:** This document records the cURL request and response supplied as an example. The successful response and the exact validation rules for each parameter have not been provided.
