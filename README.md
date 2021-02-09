# 外部IPアドレスを持たないVMインスタンスにCloud IAPを利用してSSH接続する

## これは何？
- GCPでVPCとsubnetを作成し、subnet内にVMインスタンスを起動します
- VMインスタンスに外部IPアドレスを付与しません
- subnet内に起動したVMインスタンスにIAPを用いてSSH接続します

## Cloud IAP(Identity-Aware Proxy)とは？
- Cloud IAPの仕組み
  - https://cloud.google.com/iap/docs/concepts-overview
- Cloud IAPの使い方
  - https://cloud.google.com/iap/docs/using-tcp-forwarding

## セットアップ
- `Terraform v0.14.5`のインストール
  - https://releases.hashicorp.com/terraform/
- Google Cloud Platformのprojectを作成する
  - https://cloud.google.com/resource-manager/docs/creating-managing-projects
- GCP StorageのBucketを作成する
  - https://cloud.google.com/storage/docs/creating-buckets
- `gcloud CLI`のインストール（VMインスタンスにSSH接続したい場合）
  - https://cloud.google.com/sdk/gcloud

## リソースの作成
```
$ export GCP_PROJECT_ID="your-gcp-project-id"
$ export GCS_BUCKET_NAME="your-gcs-bucket-name"
$ export USER_MAIL="your-google-user-mail-to-allow-ssh-acccess@gmail.com"

$ bin/apply $GCP_PROJECT_ID $GCS_BUCKET_NAME $USER_MAIL
```

## リソースの削除
```
$ export GCP_PROJECT_ID="your-gcp-project-id"
$ export GCS_BUCKET_NAME="your-gcs-bucket-name"
$ export USER_MAIL="your-google-user-mail-to-allow-ssh-acccess@gmail.com"

$ bin/destroy $GCP_PROJECT_ID $GCS_BUCKET_NAME $USER_MAIL
```

## VMインスタンスへのSSH接続
```
$ export ZONE="asia-northeast1-a"
$ export VM_INSTANCE_NAME="bastion"
$ export GCP_PROJECT_ID="your-gcp-project-id"

# GCPのprojectを作成したgoogleアカウントでログインする（すでにログインしてる場合は不要）
$ gcloud auth login

# IAPを利用してSSH接続する
$ gcloud beta compute ssh --zone $ZONE $VM_INSTANCE_NAME --project $GCP_PROJECT_ID
```
