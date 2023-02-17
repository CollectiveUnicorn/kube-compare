# kube-compare
Take snapshots of your K8s cluster yaml and compare them later on

# Using

To dump & compare all resources in the cluster:
``` shell
./kubecompare dump -f 17-feb-2023-dump-all
./kubecompare compare -f 17-feb-2023-dump-all
```

To dump & compare specific types of resources:
``` shell
./kubecompare dump -f 17-feb-2023-dump-pods-ss-ds -r "pods statefulset daemonset"
./kubecompare -f 17-feb-2023-dump
```

# Updating
Shell script generated using [Bashly](https://bashly.dannyb.co/) yaml file contained in the `src` folder. Run `bashly generate` to update the shell scripts