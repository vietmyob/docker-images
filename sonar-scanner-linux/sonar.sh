#!/bin/bash

set -e

function die { echo "$*" >&2; exit 1; }
function require { command -v "$1" >/dev/null || die "ERROR: command '$1' required but not found."; }

require sonar-scanner
require jq
require curl

function get_value_from_line { 
  echo "${1#*=}"
}

json_value="jq -cr"

#----------------------------------------------------------------

SONAR_REPORT_FILE=".sonar/report-task.txt"
SONAR_CONFIG_FILE="./sonar-project.properties"

SONAR_HOST_URL_KEY="serverUrl"
SONAR_CE_TASK_URL_KEY="ceTaskUrl"
SONAR_ANALYSIS_API="api/qualitygates/project_status"
SONAR_CONFIG_LOGIN_KEY="sonar.login"

SONAR_API_WAIT_INTERVAL=5

#----------------------------------------------------------------

# sonar.login should not be in the config file
sonar_login=$(get_value_from_line "$(grep "$SONAR_CONFIG_LOGIN_KEY" "$SONAR_CONFIG_FILE")")

if [[ -n "$sonar_login" ]]; then
  die "ERROR: sonar.login should not exist in the sonar-project.properties file - please pass it in as a parameter using -Dsonar.login=... instead."
fi

for arg in "$@"; do
  if [[ "$arg" == "-D$SONAR_CONFIG_LOGIN_KEY=*" ]]; then
    sonar_login=$(get_value_from_line "$arg")
    break
  fi
done

sonar-scanner "$@"

if [[ ! -f "$SONAR_REPORT_FILE" ]]; then
  die "ERROR: File not found: $SONAR_REPORT_FILE"
fi 

sonar_ce_task_url=$(get_value_from_line "$(grep "$SONAR_CE_TASK_URL_KEY" "$SONAR_REPORT_FILE")")
sonar_host_url=$(get_value_from_line "$(grep "$SONAR_HOST_URL_KEY" "$SONAR_REPORT_FILE")")

echo -n "INFO: Waiting for SonarQube analysis"
while [[ "$sonar_analysis_status" != "SUCCESS" ]] && [[ "$sonar_analysis_status" != "FAILED" ]]; do
  sonar_ce_task_json=$(curl -fsSLu "$sonar_login": "$sonar_ce_task_url")
  sonar_analysis_status=$(echo "$sonar_ce_task_json" | $json_value '.task.status')
  sleep $SONAR_API_WAIT_INTERVAL
  echo -n '.'
done
echo ""

if [[ "$sonar_analysis_status" != "SUCCESS" ]]; then
  die "ERROR: Sonar analysis status"
fi

sonar_analysis_id=$(echo "$sonar_ce_task_json" | $json_value '.task.analysisId')
analysis_result=$(curl -fsSLu "$sonar_login": "$sonar_host_url/$SONAR_ANALYSIS_API?analysisId=$sonar_analysis_id" | $json_value '.projectStatus.status')

echo "INFO: Final result: $analysis_result"

if [[ "$analysis_result" != "OK" ]]; then
  die "ERROR: Analysis came back non-positive"
fi

