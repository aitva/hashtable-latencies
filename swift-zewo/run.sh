#!/bin/sh
set -e
swift build --configuration release
.build/release/swift-zewo