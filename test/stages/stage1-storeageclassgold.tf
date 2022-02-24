module "gitops-cp4a-file-retain-gold-gid" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  
  name="cp4a-file-retain-gold-gid"
  provisioner_name="ibm.io/ibmc-file"
  vol_binding_mode="Immediate"
  reclaim_policy="Retain"
  parameter_list=[{key="type", value="Endurance"},{key = "iopsPerGB",value = "10"},{key = "sizeRange", value = "[20-4000]Gi"},{key="billingType",value="hourly"},{key="classVersion",value="2"},{key="gidAllocate",value="true"}]

}

resource null_resource gitops_storage_class_gold {
  provisioner "local-exec" {
    command = "echo -n 'cp4a-file-retain-gold-gid' > git_sc_name_gold"
  }
}
/*   
module "gitops-cp4a-file-retain-silver-gid" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  
  name="cp4a-file-retain-silver-gid"
  provisioner_name="ibm.io/ibmc-file"
  vol_binding_mode="Immediate"
  reclaim_policy="Retain"
  parameter_list=[{key="type", value="Endurance"},{key = "iopsPerGB",value = "4"},{key = "sizeRange", value = "[20-12000]Gi"},{key="billingType",value="hourly"},{key="classVersion",value="2"},{key="gidAllocate",value="true"}]

}

resource null_resource gitops_storage_class_silver {
  provisioner "local-exec" {
    command = "echo -n 'cp4a-file-retain-silver-gid' > git_sc_name_silver"
  }
}


module "gitops-cp4a-file-retain-bronze-gid" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  
  name="cp4a-file-retain-bronze-gid"
  provisioner_name="ibm.io/ibmc-file"
  vol_binding_mode="Immediate"
  reclaim_policy="Retain"
  parameter_list=[{key="type", value="Endurance"},{key = "iopsPerGB",value = "2"},{key = "sizeRange", value = "[20-12000]Gi"},{key="billingType",value="hourly"},{key="classVersion",value="2"},{key="gidAllocate",value="true"}]

}
resource null_resource gitops_storage_class_bronze {
  provisioner "local-exec" {
    command = "echo -n 'cp4a-file-retain-bronze-gid' > git_sc_name_bronze"
  }
}
*/