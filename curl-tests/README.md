# TIMM API cURL Test Cases

This directory contains portable cURL test cases built from the documented API examples.

The committed files under `templates/` do not contain real credentials. They use these placeholders:

| Placeholder | Description |
|-------------|-------------|
| `#TIMM-API-USERNAME#` | API username |
| `#TIMM-API-PASSWORD#` | API password |

From the API standpoint, only `user` and `pwd` are required. Different assigned credentials can be passed to the scripts without changing the template structure.

Generated files are written to `generated/`, which is ignored by Git.

## Build Payloads

### Windows

```powershell
.\curl-tests\scripts\build-payloads-windows.ps1 -User "<username>" -Pwd "<password>"
```

### Linux

```bash
sh curl-tests/scripts/build-payloads-linux.sh "<username>" "<password>"
```

### macOS

```bash
sh curl-tests/scripts/build-payloads-macos.sh "<username>" "<password>"
```

You can also copy any file from `templates/`, remove the `.tpl` suffix, and use a find-and-replace tool to replace the placeholders manually.

## Test Cases

### CRM/Types/Language

```bash
curl -k -d @curl-tests/generated/crm-types-language-auth.json -X GET "http://192.168.19.210:11000/TIMM/v1/CRM/Types/Language"
```

Expected result: `exec_code` is `0`.

### CRM/Types/KYC/Level

```bash
curl -K curl-tests/generated/crm-types-kyc-level.curl-config
```

Expected result: `exec_code` is `0`.

### CRM/Types/KYC/GSM

```bash
curl -K curl-tests/generated/crm-types-kyc-gsm.curl-config
```

Expected result: `exec_code` is `0`.

### CRM/Types/KYC/OM

```bash
curl -K curl-tests/generated/crm-types-kyc-om.curl-config
```

Expected result: `exec_code` is `0`.

### CRM/Subscriber/Language — Missing MSISDN

```bash
curl -k -d @curl-tests/generated/crm-subscriber-language-missing-msisdn.json -X POST "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language"
```

Expected result: `exec_code` is `-1003`.

### CRM/Subscriber/Language — Invalid Language Specification

```bash
curl -k -d @curl-tests/generated/crm-subscriber-language-invalid-language.json -X POST "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language"
```

Expected result: `exec_code` is `-100`.

### CRM/Subscriber/Language — Set by LanguageCode

```bash
curl -k -d @curl-tests/generated/crm-subscriber-language-code.json -X POST "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language"
```

Expected result: `exec_code` is `200`.

### CRM/Subscriber/Language — Set by LanguageID

```bash
curl -k -d @curl-tests/generated/crm-subscriber-language-id.json -X POST "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Language"
```

Expected result: `exec_code` is `200`.

### CRM/PBX/Call/Answer — Missing IP

```bash
curl -k -d @curl-tests/generated/crm-pbx-call-answer-missing-ip.json -X POST "http://192.168.19.139:11000/TIMM/v1/CRM/PBX/Call/Answer"
```

Expected result: `exec_code` is `-1003`.

### CRM/PBX/Call/Answer — Missing IP and MSISDN

```bash
curl -k -d @curl-tests/generated/crm-pbx-call-answer-missing-ip-msisdn.json -X POST "http://192.168.19.139:11000/TIMM/v1/CRM/PBX/Call/Answer"
```

Expected result: `exec_code` is `-1003`.

### CRM/PBX/Call/Answer — Success

```bash
curl -k -d @curl-tests/generated/crm-pbx-call-answer-success.json -X POST "http://192.168.19.139:11000/TIMM/v1/CRM/PBX/Call/Answer"
```

Expected result: `exec_code` is `200`.

### CRM/Subscriber/Classification/Rate

```bash
curl -k -d @curl-tests/generated/crm-subscriber-classification-rate.json -X GET "http://192.168.19.139:11000/TIMM/v1/CRM/Subscriber/Classification/Rate"
```

Expected result: `exec_code` is `200`.

### Agent/Balance/IN — Get IN Balance

```bash
curl -K curl-tests/generated/agent-balance-in-get.curl-config
```

Expected result: `exec_code` is `0`.

### Agent/Balance/IN — Increase IN Balance

```bash
curl -k -d @curl-tests/generated/agent-balance-in-post.json -X POST "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Balance/IN"
```

Expected result: `exec_code` is `200`, with `resultset.ExecTxt` as `success` and `resultset.internal_code` as `100`.

### Agent/Balance/IN — Decrease IN Balance

```bash
curl -k -d @curl-tests/generated/agent-balance-in-delete.json -X DELETE "https://APIDEV.Orange.com.lr/TIMM/v1/Agent/Balance/IN"
```

Expected result: `exec_code` is `200`, with `resultset.ExecTxt` as `success` and `resultset.internal_code` as `100`.

### Subscriber/Balance/IN — Get IN Balance

```bash
curl -K curl-tests/generated/subscriber-balance-in-get.curl-config
```

Expected result: `exec_code` is `0`.

### Subscriber/Balance/IN — Increase IN Balance

```bash
curl -k -d @curl-tests/generated/subscriber-balance-in-post.json -X POST "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Balance/IN"
```

Expected result: `exec_code` is `200`, with `resultset.ExecTxt` as `success` and `resultset.internal_code` as `100`.

### Subscriber/Balance/IN — Decrease IN Balance

```bash
curl -k -d @curl-tests/generated/subscriber-balance-in-delete.json -X DELETE "https://APIDEV.Orange.com.lr/TIMM/v1/Subscriber/Balance/IN"
```

Expected result: `exec_code` is `200`, with `resultset.ExecTxt` as `success` and `resultset.internal_code` as `100`.

### FlyTxt/Inbound/Offers

This endpoint uses credentials in the query string, so it uses a curl config file instead of a JSON body.

```bash
curl -k -K curl-tests/generated/flytxt-inbound-offers.curl-config
```

Expected result: `exec_code` is `200`.

### Invoicing/Invoice/Totals — Success

```bash
curl -K curl-tests/generated/invoicing-invoice-totals-success.curl-config
```

Expected result: `exec_code` is `200`.

### Invoicing/Invoice/Details — Success

This test uses the API defaults for `PriorityAccountId`, `Lang`, and `Tax`.

```bash
curl -K curl-tests/generated/invoicing-invoice-details-success.curl-config
```

Expected result: `exec_code` is `200`.

### Subscriber/JungleEnergy/Tokens — No Tokens found

```bash
curl -K curl-tests/generated/subscriber-jungleenergy-tokens-no-tokens.curl-config
```

Expected result: `exec_code` is `-200`.

### Subscriber/JungleEnergy/Tokens — Success

```bash
curl -K curl-tests/generated/subscriber-jungleenergy-tokens-success.curl-config
```

Expected result: `exec_code` is `200`.

### Subscriber/LEC/Tokens — No Tokens found

```bash
curl -K curl-tests/generated/subscriber-lec-tokens-no-tokens.curl-config
```

Expected result: `exec_code` is `-200`.

### Subscriber/LEC/Tokens — Success

```bash
curl -K curl-tests/generated/subscriber-lec-tokens-success.curl-config
```

Expected result: `exec_code` is `200`.

### Subscriber/OrangeEnergy/Tokens — No Tokens found

```bash
curl -K curl-tests/generated/subscriber-orangeenergy-tokens-no-tokens.curl-config
```

Expected result: `exec_code` is `-200`.

### Subscriber/OrangeEnergy/Tokens — Success

```bash
curl -K curl-tests/generated/subscriber-orangeenergy-tokens-success.curl-config
```

Expected result: `exec_code` is `200`.

### Subscriber/JungleEnergy/Meter/Favorite — Meter not found

```bash
curl -K curl-tests/generated/subscriber-jungleenergy-meter-favorite-not-found.curl-config
```

Expected result: `exec_code` is `-200`.

### Subscriber/JungleEnergy/Meter/Favorite — Success

```bash
curl -K curl-tests/generated/subscriber-jungleenergy-meter-favorite-success.curl-config
```

Expected result: `exec_code` is `203`.

### Subscriber/LEC/Meter/Favorite — Meter not found

```bash
curl -K curl-tests/generated/subscriber-lec-meter-favorite-not-found.curl-config
```

Expected result: `exec_code` is `-200`.

### Subscriber/LEC/Meter/Favorite — Success

```bash
curl -K curl-tests/generated/subscriber-lec-meter-favorite-success.curl-config
```

Expected result: `exec_code` is `203`.

### Subscriber/OrangeEnergy/Meter/Favorite — Meter not found

```bash
curl -K curl-tests/generated/subscriber-orangeenergy-meter-favorite-not-found.curl-config
```

Expected result: `exec_code` is `-200`.

### Subscriber/OrangeEnergy/Meter/Favorite — Success

```bash
curl -K curl-tests/generated/subscriber-orangeenergy-meter-favorite-success.curl-config
```

Expected result: `exec_code` is `203`.
