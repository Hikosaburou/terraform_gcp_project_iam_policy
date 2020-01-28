# terraform_gcp_project_iam_policy
Cloud IAMのメンバーに役割を設定する


## 準備: サービスアカウントキーを準備

サービスアカウントキーを作成し、gcp-sa-key.json というファイル名で保存する

## デプロイ

`<GCP_PROJECT_ID>` にプロジェクトIDを指定する。

```
make terraform ARGS=init PJ=<GCP_PROJECT_ID>
make terraform ARGS=validate PJ=<GCP_PROJECT_ID>
make terraform ARGS=plan PJ=<GCP_PROJECT_ID>
make terraform ARGS=apply PJ=<GCP_PROJECT_ID>
```