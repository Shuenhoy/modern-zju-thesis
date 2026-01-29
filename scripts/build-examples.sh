set -e

pushd examples
for f in *.typ; do
    echo "Building $f ..."
    typst compile "$f" --root ..
done
popd