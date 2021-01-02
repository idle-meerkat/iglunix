pkgver=6.7
pkgname=om4
pkgrel=1
bad=""
ext="doc"

fetch() {
	curl -L "https://github.com/ibara/m4/releases/download/om4-6.7/om4-6.7.tar.gz" -o $pkgname-$pkgver.tar.xz
	tar -xf $pkgname-$pkgver.tar.xz
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/
	make
}

package() {
	cd $pkgname-$pkgver
	install -d $pkgdir/bin
	install -Dm4755 om4 $pkgdir/bin
	cd $pkgdir/bin
	ln -s om4 m4
}

package_doc() {
	cd $pkgname-$pkgver
	install -d $pkgdir/share/man/
	install -d $pkgdir/share/man/man1
	install -Dm644 m4.1 $pkgdir/share/man/man1
}

license() {
	cd $pkgname-$pkgver
	echo "Source are a combination of BSD and ISC licensed files"
}
