#!/usr/bin/bash

set -e

JSON="{"

if [[ -z "$INPUT_TOKEN" ]]
then
    echo "ERROR: Yoy must provide a valid token!"
    exit 1
fi

if [[ -z "$INPUT_DEFECTDOJO_URL" ]]
then
    echo "ERROR: You must provide a valid defectdojo url included import-scan endpoint. Example: https://defectdojo.domain.com/api/v2/import-scan/"
    exit 1
fi

if [[ ! -z "$INPUT_TAGS" ]]
then
    JSON+='"tags":['$INPUT_TAGS'],'
fi
  
if [[ ! -z "$INPUT_NAME" ]]
then
    JSON+='"name":"'$INPUT_NAME'",'
fi

if [[ ! -z "$INPUT_DESCRIPTION" ]]
then
    JSON+='"description":"'$INPUT_DESCRIPTION'",'
fi

if [[ ! -z "$INPUT_VERSION" ]]
then
    JSON+='"version":"'$INPUT_VERSION'",'
fi
  
if [[ ! -z "$INPUT_FIRST_CONTACTED" ]]
then
    JSON+='"first_contacted":"'$INPUT_FIRST_CONTACTED'",'
fi

if [[ ! -z "$INPUT_TARGET_START" ]]
then
    JSON+='"target_start":"'$INPUT_TARGET_START'",'
fi

if [[ ! -z "$INPUT_TARGET_END" ]]
then
    JSON+='"target_end":"'$INPUT_TARGET_END'",'
fi

if [[ ! -z "$INPUT_REASON" ]]
then
    JSON+='"reason":"'$INPUT_REASON'",'
fi

if [[ ! -z "$INPUT_TRACKER" ]]
then
    JSON+='"tracker":"'$INPUT_TRACKER'",'
fi

if [[ ! -z "$INPUT_TEST_STRATEGY" ]]
then
    JSON+='"test_strategy":"'$INPUT_TEST_STRATEGY'",'
fi  
  
if [[ ! -z "$INPUT_THREAT_MODEL" ]]
then
    JSON+='"threat_model":"'$INPUT_THREAT_MODEL'",'
fi  

if [[ ! -z "$INPUT_API_TEST" ]]
then
    JSON+='"api_test":"'$INPUT_API_TEST'",'
fi  

if [[ ! -z "$INPUT_PEN_TEST" ]]
then
    JSON+='"pen_test":"'$INPUT_PEN_TEST'",'
fi  
  
if [[ ! -z "$INPUT_CHECK_LIST" ]]
then
    JSON+='"check_list":"'$INPUT_CHECK_LIST'",'
fi  
  
if [[ ! -z "$INPUT_STATUS" ]]
then
    JSON+='"status":"'$INPUT_STATUS'",'
fi

if [[ ! -z "$INPUT_ENGAGEMENT_TYPE" ]]
then
    JSON+='"engagement_type":"'$INPUT_ENGAGEMENT_TYPE'",'
fi

if [[ ! -z "$INPUT_BUILD_ID" ]]
then
    JSON+='"build_id":"'$INPUT_BUILD_ID'",'
fi
  
if [[ ! -z "$INPUT_COMMIT_HASH" ]]
then
    JSON+='"commit_hash":"'$INPUT_COMMIT_HASH'",'
fi
  
if [[ ! -z "$INPUT_BRANCH_TAG" ]]
then
    JSON+='"branch_tag":"'$INPUT_BRANCH_TAG'",'
fi

if [[ ! -z "$INPUT_SOURCE_CODE_MANAEMENT_URI" ]]
then
    JSON+='"source_code_management_uri":"'$INPUT_SOURCE_CODE_MANAEMENT_URI'",'
fi

if [[ ! -z "$INPUT_DEDUPLICATION_ON_ENGAGEMENT" ]]
then
    JSON+='"deduplication_on_engagement":"'$INPUT_DEDUPLICATION_ON_ENGAGEMENT'",'
fi

if [[ ! -z "$INPUT_LEAD" ]]
then
    JSON+='"lead":'$INPUT_LEAD','
fi

if [[ ! -z "$INPUT_REQUESTER" ]]
then
    JSON+='"requester":'$INPUT_REQUESTER','
fi

if [[ ! -z "$INPUT_PRESET" ]]
then
    JSON+='"preset":'$INPUT_PRESET','
fi

if [[ ! -z "$INPUT_REPORT_TYPE" ]]
then
    JSON+='"report_type":'$INPUT_REPORT_TYPE','
fi

if [[ ! -z "$INPUT_PRODUCT" ]]
then
    JSON+='"product":'$INPUT_PRODUCT','
fi

if [[ ! -z "$INPUT_BUILD_SERVER" ]]
then
    JSON+='"build_server":'$INPUT_BUILD_SERVER','
fi

if [[ ! -z "$INPUT_SOURCE_CODE_MANAEMENT_SERVER" ]]
then
    JSON+='"source_code_management_server":'$INPUT_SOURCE_CODE_MANAEMENT_SERVER','
fi

if [[ ! -z "$INPUT_ORCHESTRATION_ENGINE" ]]
then
    JSON+='"orchestration_engine":'$INPUT_ORCHESTRATION_ENGINE','
fi

JSON+="}"

JSON=$(echo "$JSON" | sed -e 's/,}/}/g')

response=$(curl "$INPUT_DEFECTDOJO_URL$INPUT_DEFECTDOJO_ENDPOINT" -H "Authorization: Token $INPUT_TOKEN" -H "accept: application/json" -H  "Content-Type: application/json" -d "$JSON")
echo "::set-output name=response::$( echo $response)"
