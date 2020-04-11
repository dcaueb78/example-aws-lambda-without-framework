# 1o passo criar arquivo de politicas de seguranca
# 2o criar rol de seguranca na AWS

aws iam create-role \ 
  --role-name lambda-exemplo \
  --assume-role-policy-document file://politicas.json \
  | tee logs/role.log

3o criar arquivo com conteudo e zipa-lo