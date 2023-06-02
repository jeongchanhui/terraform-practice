#!/bin/bash
# backend.tf 파일의 내용을 정의합니다.
read -d '' content << EOF
terraform {
  backend "s3" {
      bucket         = "chnh-tfstate" 
      key            = "terraformer-practice/terraform.tfstate"
      region         = "ap-northeast-2"
      encrypt        = true
  }
}
EOF

# 현재 디렉토리와 모든 하위 디렉토리에 대해 반복합니다.
for d in $(find . -type d)
do
  # 각 디렉토리에 backend.tf 파일을 생성합니다.
  echo "$content" > "$d/backend.tf"
done
