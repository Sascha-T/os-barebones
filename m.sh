echo "Cleaning up..."
rm -rf b.o
rm -rf c.o
rm -rf o.bin
echo "Building b.o"
as --32 b.s -o b.o 
echo "Building c.o"
gcc -m32 -c c.c -o c.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
echo "Linking..."
gcc -m32 -T l.ld -o o.bin -ffreestanding -O2 -nostdlib b.o c.o -lgcc
if grub-file --is-x86-multiboot o.bin; then
  echo "SUCCESS | Multiboot confirmed"
  echo "Now building grub image"
  ./g.sh
else
  echo "FAIL   | No multiboot"
fi
