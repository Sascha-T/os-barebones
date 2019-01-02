mkdir -p isodir/boot/grub
cp o.bin isodir/boot/o.bin
cp g.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o o.iso isodir
rm -rf isodir
