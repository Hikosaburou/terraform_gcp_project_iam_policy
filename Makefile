ARGS = $2
PJ = $1
 
terraform:
	GOOGLE_CREDENTIALS=gcp-sa-key.json \
		terraform ${ARGS} -var="gcp_project_id=${PJ}"