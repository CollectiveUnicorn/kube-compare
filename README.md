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
./kubecompare compare -f 17-feb-2023-dump-pods-ss-ds
```

For nicer output, [dyff](https://github.com/homeport/dyff) can be used. 

![dyff image](https://raw.githubusercontent.com/homeport/dyff/main/.docs/dyff-between-git-commits-example.png)

Once dyff is installed run to use it instead of the default `kubectl diff`: 
``` shell 
export KUBECTL_EXTERNAL_DIFF="dyff between --omit-header --set-exit-code"
```

# Updating
Shell script generated using [Bashly](https://bashly.dannyb.co/) yaml file contained in the `src` folder. 
Run `bashly generate` to update the shell scripts when the `bashly.yml` file is updated.