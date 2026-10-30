# CRM/Subscriber/KYC/SaveDocument

This method saves identification document details for a SIM registration.

## Action Definition

HTTP Verb | Description
--- | ---
`POST` | Save identification document details for a SIM registration

## Endpoint URL

`/TIMM/v1/CRM/Subscriber/KYC/SaveDocument`

## Environments

Environment | Base URL
--- | ---
Production / current example | `http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/SaveDocument`

> The source example provides this endpoint only. Other environment URLs have not been provided.

## Authentication

The example authenticates through query-string parameters. Replace the password placeholder with a secret supplied by your secure environment.

| Parameter | Type | Required | Description |
|---|---|---|---|
| `auth:user` | `String` | Required | API authentication username |
| `auth:pwd` | `String` | Required | API authentication password |

Do not commit real credentials or customer information to source control. Avoid logging complete query strings containing credentials or personal information.

## Request Parameters

Send the following parameters in the request query string.

| Parameter | Type | Required | Description |
|---|---|---|---|
| `param:IDSimReg` | `Integer` | Required in example | SIM registration ID |
| `param:TimmUserID` | `Integer` | Required in example | TIMM user ID |
| `param:MSISDN` | `String` | Required in example | Customer mobile number |
| `param:DocumentType` | `String` | Required in example | Document type, for example `Passport` |
| `param:IDDocumentType` | `Integer` | Required in example | Document type identifier |
| `param:DocumentNumber` | `String` | Required in example | Identification document number |

The source example demonstrates all six parameters. Formal API validation rules and parameter limits were not provided.

## Processing Rules

- The request submits SIM registration and identification document details.
- The example response reports success with `exec_code` set to `200`.
- Other processing rules were not provided in the source.

## Response Fields

| Field | Type | Description |
|---|---|---|
| `exec_code` | `Integer` | Execution result code; `200` in the supplied successful response |
| `exec_msg` | `String` | Execution status message; `Success` in the supplied response |

Check `exec_code` before treating the request as successful.

## Responses

### Success Response

```json
{
  "exec_code": 200,
  "exec_msg": "Success"
}
```

Only the successful response above was supplied. Other response examples and error codes are not documented here.

## Error Handling

| Code / condition | Description |
|---|---|
| `200` | API reports successful execution |
| Any other value | Treat as unsuccessful and inspect `exec_msg` |

Specific error codes and their meanings were not provided.

## cURL Examples

### POST — Save document details

```bash
curl --request POST \
  'http://192.168.19.200:11000/TIMM/v1/CRM/Subscriber/KYC/SaveDocument?auth:user=KYCMobileValidation&auth:pwd=YOUR_API_PASSWORD&param:IDSimReg=33333&param:TimmUserID=18089&param:MSISDN=0777567588&param:DocumentType=Passport&param:IDDocumentType=5&param:DocumentNumber=88888'
```

Replace the sample values with appropriate test data. Use synthetic customer details in documentation and testing, and keep credentials out of source control. For production use, prefer a secure transport such as HTTPS if supported by the API environment.

## API Summary

| Property | Value |
|---|---|
| Method | `POST` |
| Endpoint | `/TIMM/v1/CRM/Subscriber/KYC/SaveDocument` |
| Authentication | Query-string parameters (`auth:user`, `auth:pwd`) |
| Input | `IDSimReg`, `TimmUserID`, `MSISDN`, `DocumentType`, `IDDocumentType`, `DocumentNumber` |
| Success code shown | `200` |
| Response format | JSON |
