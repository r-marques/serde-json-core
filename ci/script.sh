set -euxo pipefail

main() {
    cargo check --target $TARGET

    if [ $TARGET = x86_64-unknown-linux-gnu ]; then
        cargo test --target $TARGET
        cargo check --target $TARGET --features std
        return
    fi
}

if [ $TRAVIS_BRANCH != master ]; then
    main
fi
