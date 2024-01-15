 export GITHUB_USER=aji-suprana
 export GITHUB_TOKEN=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

 flux bootstrap github \
  --components-extra=image-reflector-controller,image-automation-controller \
  --owner=$GITHUB_USER \
  --repository=testfluxcd \
  --branch=main \
  --path=./ \
  --read-write-key \
  --personal