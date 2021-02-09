resource "google_project_iam_custom_role" "my_custom_role" {
  role_id = "MyCustomRole"
  title   = "My Custom Role"

  permissions = [
    # VMインスタンスにSSH接続するのに必要な権限
    "compute.projects.get",
    "compute.instances.get",
    "compute.instances.setMetadata",
    "iam.serviceAccounts.actAs",
    # IAPに必要な権限
    "iap.tunnelInstances.accessViaIAP",
  ]
}
