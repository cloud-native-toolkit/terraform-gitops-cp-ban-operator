module "cp4ba_operator" {
  source = "./module"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.gitops_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
  #storage_class_gold_name=module.gitops-cp4a-file-retain-gold-gid.storage_name
  #storage_class_silver_name=module.gitops-cp4a-file-retain-silver-gid.storage_name
  #storage_class_bronze_name=module.gitops-cp4a-file-retain-bronze-gid.storage_name
  storageclass_operator=module.gitops-cp4a-file-retain-gold-gid.storage_name
}
