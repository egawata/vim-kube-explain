# vim-kube-explain - Vim plugin

This plugin shows a description of a field in k8s manifest yaml file. The result is an output of `kubectl explain (field)`.

## How to use

- Open a manifest file (`*.yaml`)
- Move to a line which includes a field name
- Run a command `:KubeExplain`
- You will see an output of `kubectl explain` in a new buffer.

For example, if you open the following manifest, move to line 8 (`  replicas: 3`), and run `:KubeExplain` in normal mode, you will see a result of `kubectl explain Deployment.spec.replicas`.

~~~yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
~~~

~~~
KIND:     Deployment
VERSION:  extensions/v1beta1

FIELD:    replicas <integer>

DESCRIPTION:
     Number of desired pods. This is a pointer to distinguish between explicit
     zero and not specified. Defaults to 1.

[Process exited 0]
~~~

I recommend to add a shortcut to launch quickly.
The following example enables to run `KubeExplain` with `Leader`(backslash by default) followed by `k`

~~~vim
nnoremap <Leader>k :<C-u>KubeExplain<CR>
~~~

## License

Copyright (c) egawata. Distributed under the same terms as Vim itself.
