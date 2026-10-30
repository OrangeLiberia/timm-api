# Subscriber/Bundle/Details

This method returns detailed information and allowances for bundles active on a subscriber.

## Action Definition

| HTTP Verb | Description |
|-----------|-------------|
| `GET` | Returns detailed information and allowances for bundles active on a subscriber |

## Endpoint URL

```text
/TIMM/v1/Subscriber/Bundle/Details
```

## Environments

| Environment | Base URL |
|-------------|----------|
| Production | `https://192.168.19.200:11003/TIMM/v1/Subscriber/Bundle/Details` |
| Dev/Test   | `https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/Details` |


## Authentication

Authentication credentials must be provided on every request, either as a JSON `auth` object in the body, as URL query parameters, or via HTTP Basic Authentication.

```json
{"auth": {"user": "<username>", "pwd": "<password>"}}
```

## Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `MSISDN` | `String` | ✅ Required | Phone Number on whose account you want to add the Bundle. Phone number can have a size of either 10 or 12 digits, according to the following formats: 077xxxxxx Or 23177xxxxxxx Or, if pseudonymization is enabled for the connection, encrypted XMSISDN header can be passed in directly. exec_code integer >= 0 Positive values indicate that method completed with success but encountered some warnings IDs. |

### Request Body

```json
{
  "auth": {
    "user": "<API_USERNAME>",
    "pwd": "<API_PASSWORD>"
  },
  "param": {
    "MSISDN": "0770000001"
  }
}
```

## Response Fields

> Result type: **Array**, with a nested `Allowance` array for each returned record.

A successful response contains `exec_code: 200`, `exec_msg: "Success"` and a `resultset` array. Each record represents a bundle or an aggregate allowance total. A bundle can contain multiple allowance entries, including voice, data and SMS counters in the same `Allowance` array.

Identifiers, flags, allowance values and dates inside the result are JSON strings. Preserve the exact field casing, including `ActivationDT`, `StartDt` and `RenewalDt`.

### Bundle Fields

| Field | Type | Description |
|-------|------|-------------|
| `exec_code` | Integer | Application execution code; `200` indicates success |
| `exec_msg` | String | Application execution message; `Success` for a successful request |
| `resultset` | Object Array | Subscriber bundle records and aggregate allowance records returned by the service |
| `resultset[].ActivationDT` | Date-Time String | Bundle activation timestamp in `YYYY-MM-DDTHH:mm:ss` format, without a time-zone offset |
| `resultset[].Allowance` | Object Array | Allowance/counter entries for the bundle or aggregate record; a bundle can contain multiple entries |
| `resultset[].BundleID` | String | Bundle identifier. It can be empty or contain an aggregate marker such as `#TOTAL::VOICE#`, `#TOTAL::DATA#` or `#TOTAL::SMS#` |
| `resultset[].EndDT` | Date-Time String | Bundle end timestamp in `YYYY-MM-DDTHH:mm:ss` format, without a time-zone offset |
| `resultset[].ExpirationDT` | Date-Time String | Bundle expiration timestamp in `YYYY-MM-DDTHH:mm:ss` format, without a time-zone offset |
| `resultset[].INBundleID` | String | IN-side bundle/counter identifier. Preserve negative identifiers used by aggregate records |
| `resultset[].IsExtension` | String | Extension flag: `"1"` when set, `"0"` when unset |
| `resultset[].IsOffered` | String | Offer flag: `"1"` when set, `"0"` when unset |
| `resultset[].IsPromoActive` | String | Promotion activity flag: `"1"` when set, `"0"` when unset |
| `resultset[].Name` | String | Bundle name or aggregate allowance label |
| `resultset[].RenewalDt` | String | Renewal date, or an empty string when no renewal date is provided |
| `resultset[].StartDt` | Date-Time String | Bundle start timestamp in `YYYY-MM-DDTHH:mm:ss` format, without a time-zone offset |
| `resultset[].SubsID` | String | Subscription identifier, when available. Preserve sentinel values such as `"-1"` |

### Allowance Fields

| Field | Type | Description |
|-------|------|-------------|
| `resultset[].Allowance[].DataType` | String | Unit of the allowance value: `SECOND` for seconds, `MByte` for megabytes, or `UNIT` for units such as SMS messages |
| `resultset[].Allowance[].Description` | String, optional | Additional allowance description, including aggregate labels. The field can be omitted |
| `resultset[].Allowance[].GroupName` | String | Allowance group name or aggregate label |
| `resultset[].Allowance[].ID` | String | Allowance/counter identifier, including negative values for aggregate records |
| `resultset[].Allowance[].Name` | String | Allowance/counter name |
| `resultset[].Allowance[].ResetValue` | String, optional | Reset value associated with the counter, for example `"0"`. The field can be omitted |
| `resultset[].Allowance[].SubType` | String | Allowance subtype, such as `VOICE`, `VOICE ON-NET`, `DATA`, `SMS`, `SMS ON-NET` or `CUG IN GROUP FREE CALLS` |
| `resultset[].Allowance[].Type` | String | Allowance category, such as `VOICE`, `DATA` or `SMS` |
| `resultset[].Allowance[].Value` | String | Allowance/counter value: integer text such as `"630"`, decimal text such as `"9.84"` or `"812966.19"`, zero, or the literal `"Unlimited"` |

### Allowance Units and Values

| Category | DataType | Value examples |
|----------|----------|----------------|
| `VOICE` | `SECOND` | `"28"`, `"120"`, `"630"`, `"Unlimited"` |
| `DATA` | `MByte` | `"0"`, `"9.84"`, `"50.00"`, `"812966.19"` |
| `SMS` | `UNIT` | `"Unlimited"` |

`Value` remains a JSON string in every case. Parse numeric values as decimals where calculations are needed, and handle `"Unlimited"` separately. Do not combine values with different units.

### Aggregate Allowances

| Aggregate marker | INBundleID / allowance ID | Category | DataType |
|------------------|--------------------------|----------|----------|
| `#TOTAL::VOICE#` | `-3` | `VOICE` | `SECOND` |
| `#TOTAL::DATA#` | `-4` | `DATA` | `MByte` |
| `#TOTAL::SMS#` | `-1` | `SMS` | `UNIT` |

Aggregate records summarize allowances by category and appear alongside the individual bundle records. Use their values as returned; do not add aggregate totals to the individual counters or assume that every counter subtype contributes to a total in the same way.

## Response Interpretation

- Iterate through both arrays: `resultset` contains bundle/aggregate records, and each record's `Allowance` array contains its individual counters. Do not assume a fixed number of bundles or one counter per bundle.
- A combined bundle can include voice, data and SMS allowances with the same `Allowance[].ID`. Keep each entry; do not deduplicate counters by ID. Use `Name`, `Type`, `SubType` and `DataType` to interpret each counter.
- `BundleID` can be empty while `INBundleID` is populated. 
- Aggregate values and individual counters can use different numeric precision. For example, a data counter can contain `"812966.19"` while its aggregate contains `"812966"`. Do not require exact equality between a displayed aggregate and a recalculated total.
- `Description` and `ResetValue` are optional properties. Handle omitted fields without substituting zero, an empty string or `null` into the original response.
- A returned counter can have `Value: "0"`. Zero allowance alone does not indicate bundle expiry or inactivity.
- Preserve `Name` and `SubType` independently, even where their labels differ.
- Timestamps do not include a time-zone offset. Apply the service's agreed time-zone convention rather than assuming UTC. Read `EndDT` and `ExpirationDT` as separate fields.

## Responses

### GET — Retrieve a subscriber's active bundle details

**Success Response (`exec_code: 200`):**

The response below includes promotional data, aggregate data/voice/SMS totals, and a combined bundle with four allowance entries.

```json
{
  "exec_code": 200,
  "exec_msg": "Success",
  "resultset": [
    {
      "ActivationDT": "2023-11-25T16:28:10",
      "Allowance": [
        {
          "DataType": "MByte",
          "GroupName": "Facebook Free",
          "ID": "10027",
          "Name": "Facebook Free - Data Promotion",
          "ResetValue": "0",
          "SubType": "DATA",
          "Type": "DATA",
          "Value": "0"
        }
      ],
      "BundleID": "",
      "EndDT": "2026-11-29T00:35:53",
      "ExpirationDT": "2026-11-29T00:35:53",
      "INBundleID": "10027",
      "IsExtension": "1",
      "IsOffered": "1",
      "IsPromoActive": "1",
      "Name": "Facebook Free",
      "RenewalDt": "",
      "StartDt": "2023-11-25T16:28:10",
      "SubsID": "-1"
    },
    {
      "ActivationDT": "2023-11-25T16:28:10",
      "Allowance": [
        {
          "DataType": "MByte",
          "Description": "#TOTAL::DATA#",
          "GroupName": "#TOTAL::DATA#",
          "ID": "-4",
          "Name": "#TOTAL::DATA#",
          "SubType": "DATA",
          "Type": "DATA",
          "Value": "60"
        }
      ],
      "BundleID": "#TOTAL::DATA#",
      "EndDT": "2026-11-29T00:35:53",
      "ExpirationDT": "2026-11-29T00:35:53",
      "INBundleID": "-4",
      "IsExtension": "1",
      "IsOffered": "1",
      "IsPromoActive": "1",
      "Name": "#TOTAL::DATA#",
      "RenewalDt": "",
      "StartDt": "2023-11-25T16:28:10",
      "SubsID": "-1"
    },
    {
      "ActivationDT": "2026-10-26T22:44:53",
      "Allowance": [
        {
          "DataType": "MByte",
          "GroupName": "Orange Promo $2 5GB",
          "ID": "10300",
          "Name": "Orange Promo MB",
          "ResetValue": "0",
          "SubType": "DATA",
          "Type": "DATA",
          "Value": "9.84"
        }
      ],
      "BundleID": "PKG-5GB7Day",
      "EndDT": "2026-10-30T22:44:53",
      "ExpirationDT": "2026-10-30T22:44:53",
      "INBundleID": "10300",
      "IsExtension": "1",
      "IsOffered": "1",
      "IsPromoActive": "1",
      "Name": "Orange Promo $2 5GB",
      "RenewalDt": "",
      "StartDt": "2026-10-26T22:44:53",
      "SubsID": "-1"
    },
    {
      "ActivationDT": "2026-10-30T00:35:53",
      "Allowance": [
        {
          "DataType": "UNIT",
          "Description": "#TOTAL::SMS#",
          "GroupName": "#TOTAL::SMS#",
          "ID": "-1",
          "Name": "#TOTAL::SMS#",
          "SubType": "SMS",
          "Type": "SMS",
          "Value": "Unlimited"
        }
      ],
      "BundleID": "#TOTAL::SMS#",
      "EndDT": "2026-11-04T00:35:53",
      "ExpirationDT": "2026-11-04T00:35:53",
      "INBundleID": "-1",
      "IsExtension": "1",
      "IsOffered": "1",
      "IsPromoActive": "1",
      "Name": "#TOTAL::SMS#",
      "RenewalDt": "",
      "StartDt": "2026-10-30T00:35:53",
      "SubsID": "-1"
    },
    {
      "ActivationDT": "2026-10-30T00:35:53",
      "Allowance": [
        {
          "DataType": "SECOND",
          "Description": "#TOTAL::VOICE#",
          "GroupName": "#TOTAL::VOICE#",
          "ID": "-3",
          "Name": "#TOTAL::VOICE#",
          "SubType": "VOICE",
          "Type": "VOICE",
          "Value": "148"
        }
      ],
      "BundleID": "#TOTAL::VOICE#",
      "EndDT": "2026-11-04T00:35:53",
      "ExpirationDT": "2026-11-04T00:35:53",
      "INBundleID": "-3",
      "IsExtension": "1",
      "IsOffered": "1",
      "IsPromoActive": "1",
      "Name": "#TOTAL::VOICE#",
      "RenewalDt": "",
      "StartDt": "2026-10-30T00:35:53",
      "SubsID": "-1"
    },
    {
      "ActivationDT": "2026-10-30T00:35:53",
      "Allowance": [
        {
          "DataType": "SECOND",
          "GroupName": "Orange $1 5 days bundle",
          "ID": "10038",
          "Name": "$1 5 days bundle Mins On-Net",
          "ResetValue": "0",
          "SubType": "VOICE ON-NET",
          "Type": "VOICE",
          "Value": "28"
        },
        {
          "DataType": "SECOND",
          "GroupName": "Orange $1 5 days bundle",
          "ID": "10038",
          "Name": "$1 5 days bundle Mins All-Net",
          "ResetValue": "0",
          "SubType": "VOICE ON-NET",
          "Type": "VOICE",
          "Value": "120"
        },
        {
          "DataType": "MByte",
          "GroupName": "Orange $1 5 days bundle",
          "ID": "10038",
          "Name": "$1 5 days bundle MB",
          "ResetValue": "0",
          "SubType": "DATA",
          "Type": "DATA",
          "Value": "50.00"
        },
        {
          "DataType": "UNIT",
          "GroupName": "Orange $1 5 days bundle",
          "ID": "10038",
          "Name": "3D3C - Unlimited on-net SMS",
          "ResetValue": "0",
          "SubType": "SMS ON-NET",
          "Type": "SMS",
          "Value": "Unlimited"
        }
      ],
      "BundleID": "PKG-F3D",
      "EndDT": "2026-11-04T00:35:53",
      "ExpirationDT": "2026-11-04T00:35:53",
      "INBundleID": "10038",
      "IsExtension": "1",
      "IsOffered": "1",
      "IsPromoActive": "1",
      "Name": "Orange $1 5 days bundle",
      "RenewalDt": "",
      "StartDt": "2026-10-30T00:35:53",
      "SubsID": "-1"
    }
  ]
}
```

### Error Handling

Check `exec_code` and `exec_msg` before processing `resultset`. For an unsuccessful request, use the application message to determine the reason and do not assume that bundle details are present. The application execution code is separate from the HTTP status.

## Error Codes

| Code | Description |
|------|-------------|
| `100` | Success With Warning |
| `200` | Success |
| `-1003` | API Call is missing a parameter |
| `-1004` | API Call execution failed |
| `-1005` | API Call execution partial failed |
| `-1115` | API Call parameter is invalid |
| `-1116` | Missing Configurations |
| `-2000` | General Error / Execution Error|

## cURL Examples

### GET — Retrieve a subscriber's active bundle details

Use the `bundle_check.json` body shown above. Run the command from the directory containing that file. Keep the body file private because it contains credentials.

**PowerShell:**

```powershell
curl.exe --request GET `
  'https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/Details' `
  --header 'Content-Type: application/json' `
  --header 'Accept: application/json' `
  --data-binary '@bundle_check.json'
```

**Bash:**

```bash
curl --request GET \
  'https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Bundle/Details' \
  --header 'Content-Type: application/json' \
  --header 'Accept: application/json' \
  --data-binary '@bundle_check.json'
```

The commands send a JSON body with the `GET` request and use the standard Dev/Test URL. To call Production, use the Production URL from the Environments table. Keep certificate verification enabled.
