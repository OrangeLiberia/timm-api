request = "POST"
url = "http://api-dev.example.invalid:11000/TIMM/v1/Subscriber/Points?auth:user=#TIMM-API-USERNAME#&auth:pwd=#TIMM-API-PASSWORD#"
header = "Accept: application/json"
header = "Content-Type: application/json"
data-binary = "@curl-tests/generated/subscriber-points-post-missing-name.json"
silent
show-error
