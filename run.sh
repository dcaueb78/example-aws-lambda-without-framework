# 1o create policies file
# 2o create AWS security role

aws iam create-role \
  --role-name lambda-example \
  --assume-role-policy-document file://policies.json \
  | tee logs/role.log

# 3o create zip folder
zip function.zip index.js

aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs12.x \
  --role arn:aws:iam::445083237337:role/lambda-example \
  | tee logs/lambda-create.log 

# 4o invoke lambda!
aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log

# -- update, zip
zip function.zip index.js

# update lambda
aws lambda update-function-code \
  --zip-file fileb://function.zip \
  --function-name hello-cli \
  --publish \
  | tee logs/lambda-update.log

# remove lambda and role
aws lambda delete-function \
  --function-name hello-cli

aws iam remove-role \
--role-name lambda-example