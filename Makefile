# Run cmake with the help of GNU make, for convenience.  Running cmake
# in any other way instead is perfectly fine too.

# Support for Rtags reindexing, if available. Note: we use
# CMAKE_EXPORT_COMPILE_COMMANDS unconditionally, since this could
# potentially be useful in several scenarios.
RC = $(if $(shell command -v rc 2>/dev/null), rc -J, :)

.PHONY: debug
debug:
	mkdir -p build && cd build \
	&& cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. \
	&& $(RC)
