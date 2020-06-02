# PROFILE := florence-dev
BUCKET := ajs-test-us-east-1
STACK := astocchetti-test-remove
STACKTWO := astocchetti-test-http-api

#.PHONY
.PHONY: pgktwo deploy

# all: package deploy
http: package deploytwo

package:
	aws cloudformation package --template-file cfn.yaml --s3-bucket $(BUCKET) --output-template-file app-output_sam.yaml

deploy:
	aws cloudformation deploy --template-file /Users/astocchetti/Desktop/apigw/app-output_sam.yaml --capabilities CAPABILITY_IAM --stack-name $(STACK)

pgktwo:
	aws cloudformation package --template-file cfn-http-api.yml --s3-bucket $(BUCKET) --output-template-file app-output_sam-httpapi.yaml

deploytwo:
	aws cloudformation deploy --template-file /Users/astocchetti/Desktop/apigw/app-output_sam-httpapi.yaml --capabilities CAPABILITY_IAM --stack-name $(STACKTWO)
