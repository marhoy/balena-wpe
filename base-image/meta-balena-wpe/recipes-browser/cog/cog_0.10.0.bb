require cog.inc

SRC_URI = "https://github.com/Igalia/cog/releases/download/v${PV}/cog-${PV}.tar.xz"

SRC_URI[sha256sum] = "2c72369c636ca4684370adad1344071b23c9ee2c851eb7d738fa2e1d7092031f"

RDEPENDS_${PN} += "wpewebkit (>= 2.32)"
