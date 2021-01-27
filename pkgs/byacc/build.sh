pkgver=20210109
pkgname=byacc
bad=""
ext="doc"

fetch() {
	curl https://invisible-island.net/datafiles/release/byacc.tar.gz -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
	cp ../reader-mesa.patch .
}

build() {
	cd $pkgname-$pkgver
	./configure \
		--prefix=/usr \
		--program-prefix=b \
		--enable-btyacc
	patch -p1 < ../reader-mesa.patch
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
	ln -sr $pkgdir/usr/bin/byacc $pkgdir/usr/bin/yacc
	rm -r $pkgdir/usr/share
}

package_doc() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
	rm -r $pkgdir/usr/bin
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE
}
